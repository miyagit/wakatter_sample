## 必要な環境

- **Ruby**: バージョン `3.1.2`
- **Rails**: バージョン `7.0.3.1`
- **MySQL**: バージョン `5.7` 以上
- **Node.js**: 推奨バージョン `16.x`
- **Yarn**: 推奨バージョン `1.x`

## セットアップ手順

### 1. リポジトリをクローンする

まず、以下のコマンドを実行してリポジトリをローカルにクローンします。

```bash
git clone git@github.com:miyagit/wakatter_sample.git
cd wakatter_sample
```

### 2. 必要なGemをインストールする

Bundlerを使用してGemをインストールします。

```bash
gem install bundler
bundle install
```

### 3. データベースをセットアップする

以下のコマンドを順番に実行してデータベースを作成し、初期データを投入します。

```bash
rails db:create
rails db:migrate
rails db:seed
```

### 4. Webpackerをセットアップする

Webpackerをインストールしてフロントエンドの依存関係をセットアップします。

```bash
yarn install
```

### 5. サーバーを起動する

以下のコマンドを実行してRailsサーバーを起動します。

```bash
rails s
```

ターミナルの別タブでWebpackerを起動します。

```bash
./bin/webpack-dev-server
```

### 6. アプリケーションを表示する

ブラウザを開き、以下のURLにアクセスしてください。

```
http://localhost:3000
```

トップページが表示されればセットアップは完了です。
