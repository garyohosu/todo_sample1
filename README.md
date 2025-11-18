# 📱 Flutter ToDoアプリ

![Flutter](https://img.shields.io/badge/Flutter-3.24-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.5-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green.svg)

**シンプルで軽量な個人向けToDoアプリ** - Gensparkで作成

日々のタスク管理、締切管理、重要度管理を直感的に行えるFlutterネイティブアプリです。

## 🌐 デモサイト

**GitHub Pages**: https://garyohosu.github.io/todo_sample1/

ブラウザで直接お試しいただけます！

## ✨ 特徴

### 基本機能
- ✅ **タスク管理**
  - タスクの追加、編集、削除
  - タイトル（必須）、詳細（任意）、締切日、優先度（低/中/高）
  - タスクの完了/未完了トグル
  - タグ機能による分類

- 📋 **タスク一覧画面**
  - 未完了・完了済みタスクの表示
  - タスクをタップで編集
  - チェックボックスで完了状態を即座に切り替え
  - 優先度と締切をカラフルなチップで視覚化

- 🔍 **検索・フィルタ・ソート機能**
  - キーワード検索（タイトル、詳細、タグ）
  - 優先度フィルタ（すべて/高/中/低）
  - ソート機能（作成日順/締切順/優先度順）
  - 完了済みタスクの表示/非表示切り替え

- 💾 **ローカルストレージ**
  - Hiveによる高速なローカルデータ保存
  - オフラインで完全動作
  - データの永続化

### 追加機能
- 🌙 **ダークモード**
  - ライト/ダークテーマの切り替え
  - 設定が永続保存される
  - Material Design 3準拠

- 📤 **データバックアップ**
  - JSONエクスポート機能（Web版対応）
  - JSONインポート機能（Web版対応）
  - 完了済みタスクの一括削除
  - すべてのタスクの削除機能

- 📊 **統計表示**
  - 全体・未完了・完了のタスク数をリアルタイム表示
  - 見やすいカラーコーディング

- ⏰ **締切管理**
  - 日付と時刻の選択
  - 締切が近い（24時間以内）の警告表示
  - 締切超過の赤色表示

## 🎨 UI/UXの特徴

- **Material Design 3** 準拠の美しいデザイン
- **レスポンシブ対応** で様々な画面サイズに最適化
- **直感的な操作性** でストレスフリー
- **カラフルな視覚化** で情報が一目でわかる
- **スムーズなアニメーション**

## 🛠️ 技術構成

```yaml
Flutter: 3.24.4
Dart: 3.5.2
状態管理: Provider
ローカルDB: Hive + hive_flutter
日付処理: intl
UI: Material Design 3
```

### 主要パッケージ

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2          # 状態管理
  hive: ^2.2.3              # ローカルデータベース
  hive_flutter: ^1.1.0      # Flutter統合
  uuid: ^4.5.1              # ユニークID生成
  intl: ^0.19.0             # 日付フォーマット

dev_dependencies:
  build_runner: ^2.4.13     # コード生成
  hive_generator: ^2.0.1    # Hiveアダプター生成
```

## 📁 プロジェクト構造

```
lib/
├── main.dart                   # アプリエントリーポイント
├── models/
│   ├── todo_item.dart         # ToDoデータモデル
│   └── todo_item.g.dart       # Hive自動生成ファイル
├── providers/
│   ├── todo_provider.dart     # ToDoの状態管理
│   └── theme_provider.dart    # テーマの状態管理
└── screens/
    ├── home_screen.dart       # ホーム画面
    ├── add_edit_todo_screen.dart  # タスク追加・編集画面
    └── settings_screen.dart   # 設定画面
```

## 🚀 セットアップ

### 前提条件

- Flutter SDK 3.24以上
- Dart SDK 3.5以上

### インストール手順

1. **リポジトリのクローン**
```bash
git clone https://github.com/garyohosu/todo_sample1.git
cd todo_sample1
```

2. **依存関係のインストール**
```bash
flutter pub get
```

3. **Hiveアダプターの生成**
```bash
dart run build_runner build --delete-conflicting-outputs
```

4. **アプリの実行**

**Web版:**
```bash
flutter run -d chrome
```

**Android/iOS:**
```bash
flutter run
```

## 📦 ビルド

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle（Google Play推奨）
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 📱 対応プラットフォーム

- ✅ Android
- ✅ iOS
- ✅ Web
- ⚠️ macOS（未テスト）
- ⚠️ Windows（未テスト）
- ⚠️ Linux（未テスト）

## 🎯 今後の機能追加予定

- [ ] 通知機能
  - 締切時間のローカル通知
  - 朝の「今日のタスク」通知
- [ ] リマインダー設定
- [ ] 繰り返しタスク
- [ ] カレンダー表示
- [ ] タスクの並び替え（ドラッグ&ドロップ）
- [ ] クラウド同期（Firebase連携）
- [ ] サブタスク機能
- [ ] タスク共有機能

## 📝 使い方

### タスクの追加
1. ホーム画面右下の「+」ボタンをタップ
2. タイトル、詳細、締切、優先度、タグを入力
3. 「保存」ボタンをタップ

### タスクの編集
1. タスクをタップ
2. 内容を編集
3. 「保存」ボタンをタップ

### タスクの完了
- タスク左側のチェックボックスをタップ

### タスクの削除
1. タスクをタップ
2. 「削除」ボタンをタップ

### 検索・フィルタ
1. ホーム画面上部の検索アイコンをタップ
2. キーワード入力、優先度フィルタ、ソート順を選択

### データのバックアップ
1. 設定画面を開く
2. 「データをエクスポート」をタップ
3. JSONファイルがダウンロードされる

### データの復元
1. 設定画面を開く
2. 「データをインポート」をタップ
3. 保存したJSONファイルを選択

## 🧑‍💻 開発者情報

**作成者**: hantani（@garyohosu）
- AI時代の創作研究者
- 技術系ライター
- 元組み込みプログラマー

**作成環境**: Genspark
**開発時間**: 約15分（AI支援による高速開発）

## 📄 ライセンス

MIT License - 詳細は [LICENSE](LICENSE) ファイルを参照してください。

## 🙏 謝辞

このアプリは **Genspark** を使用して作成されました。
AI支援により、企画から実装、テストまでを短時間で完了することができました。

## 📮 フィードバック

バグ報告や機能リクエストは [Issues](https://github.com/garyohosu/todo_sample1/issues) からお願いします。

---

**Created with ❤️ by hantani using Genspark AI**