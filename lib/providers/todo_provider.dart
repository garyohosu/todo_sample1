import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/todo_item.dart';

class TodoProvider extends ChangeNotifier {
  late Box<TodoItem> _todoBox;
  List<TodoItem> _todos = [];
  String _searchQuery = '';
  int _priorityFilter = -1; // -1: all, 0: low, 1: middle, 2: high
  int _sortOrder = 0; // 0: created date, 1: deadline, 2: priority
  bool _showCompleted = true;

  TodoProvider() {
    _init();
  }

  Future<void> _init() async {
    _todoBox = Hive.box<TodoItem>('todos');
    _todos = _todoBox.values.toList();
    notifyListeners();
  }

  List<TodoItem> get todos {
    var filtered = _todos.where((todo) {
      // Search filter
      if (_searchQuery.isNotEmpty) {
        final searchLower = _searchQuery.toLowerCase();
        final matchTitle = todo.title.toLowerCase().contains(searchLower);
        final matchDetail = todo.detail?.toLowerCase().contains(searchLower) ?? false;
        final matchTags = todo.tags?.any((tag) => tag.toLowerCase().contains(searchLower)) ?? false;
        
        if (!matchTitle && !matchDetail && !matchTags) {
          return false;
        }
      }

      // Priority filter
      if (_priorityFilter >= 0 && todo.priority != _priorityFilter) {
        return false;
      }

      // Completed filter
      if (!_showCompleted && todo.isDone) {
        return false;
      }

      return true;
    }).toList();

    // Sort
    filtered.sort((a, b) {
      switch (_sortOrder) {
        case 1: // Deadline
          if (a.deadline == null && b.deadline == null) return 0;
          if (a.deadline == null) return 1;
          if (b.deadline == null) return -1;
          return a.deadline!.compareTo(b.deadline!);
        case 2: // Priority
          return b.priority.compareTo(a.priority);
        default: // Created date
          return b.createdAt.compareTo(a.createdAt);
      }
    });

    return filtered;
  }

  int get totalCount => _todos.length;
  int get completedCount => _todos.where((todo) => todo.isDone).length;
  int get pendingCount => _todos.where((todo) => !todo.isDone).length;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setPriorityFilter(int priority) {
    _priorityFilter = priority;
    notifyListeners();
  }

  void setSortOrder(int order) {
    _sortOrder = order;
    notifyListeners();
  }

  void toggleShowCompleted() {
    _showCompleted = !_showCompleted;
    notifyListeners();
  }

  Future<void> addTodo(TodoItem todo) async {
    await _todoBox.put(todo.id, todo);
    _todos.add(todo);
    notifyListeners();
  }

  Future<void> updateTodo(TodoItem todo) async {
    await _todoBox.put(todo.id, todo);
    final index = _todos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _todos[index] = todo;
      notifyListeners();
    }
  }

  Future<void> deleteTodo(String id) async {
    await _todoBox.delete(id);
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  Future<void> toggleTodoStatus(String id) async {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].isDone = !_todos[index].isDone;
      await _todoBox.put(id, _todos[index]);
      notifyListeners();
    }
  }

  Future<void> deleteCompletedTodos() async {
    final completedIds = _todos
        .where((todo) => todo.isDone)
        .map((todo) => todo.id)
        .toList();
    
    for (var id in completedIds) {
      await _todoBox.delete(id);
    }
    
    _todos.removeWhere((todo) => todo.isDone);
    notifyListeners();
  }

  Future<void> deleteAllTodos() async {
    await _todoBox.clear();
    _todos.clear();
    notifyListeners();
  }

  String exportToJson() {
    final data = _todos.map((todo) => todo.toJson()).toList();
    return jsonEncode(data);
  }

  Future<void> importFromJson(String jsonString) async {
    try {
      final List<dynamic> data = jsonDecode(jsonString);
      await _todoBox.clear();
      _todos.clear();
      
      for (var item in data) {
        final todo = TodoItem.fromJson(item);
        await _todoBox.put(todo.id, todo);
        _todos.add(todo);
      }
      
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error importing JSON: $e');
      }
      rethrow;
    }
  }
}