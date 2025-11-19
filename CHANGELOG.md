# Changelog

## [Unreleased]

### Added
- Web deployment support via GitHub Actions to GitHub Pages
- FloatingActionButton functionality to add new todos with dialog input
- Todo list display with checkboxes to mark todos as complete
- Delete button for each todo item
- Strike-through styling for completed todos
- Persistent todo storage using Hive database
- PWA manifest and favicon files for web support

### Fixed
- Missing `web/index.html` required for Flutter Web builds
- Missing `web/manifest.json` for PWA support
- Missing `web/favicon.png` for web app icon
- GitHub Actions permissions for gh-pages deployment
- Flutter Web initialization code for proper app loading
- Empty FloatingActionButton onPressed callback implementation

### Changed
- Updated `web/index.html` with proper Flutter Web initialization
- Converted HomeScreen from StatelessWidget to StatefulWidget
- Enhanced HomeScreen to use Consumer widget for TodoProvider integration
- Improved UI to show initial welcome screen when no todos exist

### Infrastructure
- GitHub Actions workflow automatically builds and deploys Flutter Web app
- Added `permissions: contents: write` for GitHub Actions bot access
- Added `Generate Hive adapters` build step to CI/CD pipeline
- Configured GitHub Pages to serve from gh-pages branch

---

## Implementation Details

### Features Added
1. **Add Todo Dialog**: Click + button to open dialog for entering todo title
2. **Todo List**: Display all todos with checkbox for completion status
3. **Delete Todos**: Remove todos using delete button
4. **Persistent Storage**: All todos stored in Hive database
5. **Empty State**: Shows welcome screen when no todos exist

### Files Modified
- `lib/screens/home_screen.dart` - Implemented FloatingActionButton and todo list UI
- `web/index.html` - Added Flutter Web initialization code
- `web/manifest.json` - Created PWA manifest file
- `web/favicon.png` - Created web app icon
- `.github/workflows/deploy-gh-pages.yml` - Added build_runner and permissions

### Technologies Used
- Flutter Web for browser deployment
- Hive database for local storage
- Provider for state management
- UUID for generating unique todo IDs
