# ベースとして使用するイメージ名（DockerHubからダウンロードされる）
FROM ruby:3.2.2-alpine

# 本番環境にアップロードする時のみコメントアウトを外す
# ENV RAILS_ENV=production

# 利用可能なパッケージのリストを更新するコマンドを実行
RUN apk update

# パッケージをインストールするコマンドを実行
RUN apk add g++ make mysql-dev tzdata

# コンテナを起動した時の作業ディレクトリを/appにする
WORKDIR /app

COPY . /app

# bundle installでGemfileに記述されているgemをインストール
# railsサーバー起動前にGemfile.lockに存在するgemがインストールしておく必要がある
RUN bundle install

CMD ["sh", "/app/start.sh"]