# AGENTS - Claude Code Integration

このプロジェクトはClaude Codeで開発・保守されています。

## Claude Codeの役割

Claude Codeは以下のタスクを自動的に処理します：

- **コード生成**: 新機能の実装
- **バグ修正**: 報告されたエラーの解決
- **テスト**: ユニットテストと統合テストの実行
- **デプロイメント**: GitHub Actionsを通じた自動ビルド・デプロイ
- **ドキュメント更新**: CHANGELOG.mdの自動更新

## 開発ワークフロー

1. **タスク報告**: ユーザーが新機能やバグ修正を依頼
2. **実装**: Claude Codeが変更を加える
3. **テスト**: 自動テストでコード品質を確認
4. **コミット**: `git commit`で変更を記録
5. **プッシュ**: `git push`でリモートリポジトリに反映
6. **自動デプロイ**: GitHub Actionsで自動ビルド・デプロイ
7. **ドキュメント**: CHANGELOG.mdに変更内容を追記

## ドキュメント更新ルール

すべての変更は**CHANGELOG.md**に追記してください：

```markdown
### Added
- 新機能の説明

### Fixed
- バグ修正の説明

### Changed
- 既存機能の変更説明
```

## コミットメッセージの形式

Claude Codeは以下の形式でコミットメッセージを作成します：

```
Feat: 新機能の説明
Fix: バグ修正の説明
Docs: ドキュメント変更の説明
Refactor: コードの整理説明

本文：
詳細な説明

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

## リポジトリへのアクセス

- **リモート**: `https://github.com/garyohosu/todo_sample1.git`
- **ブランチ**: `main` (開発用)、`gh-pages` (Web デプロイ用)
- **CI/CD**: GitHub Actions

## 次のステップ

- [ ] Windows用exeファイルの生成
- [ ] モバイル対応の改善
- [ ] テストカバレッジの拡大
- [ ] パフォーマンス最適化
