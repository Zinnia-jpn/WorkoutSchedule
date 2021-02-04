# ベースとなるイメージ
FROM ruby:2.7.1-alpine

# 作業ディレクトリを作成・指定
RUN mkdir /WorkoutSchedule
WORKDIR /WorkoutSchedule

# 環境設定
ENV TZ=Asia/Tokyo

# ローカル環境下でコンテナ化する際はコメントアウト
# マスターキーの設定(CircleCIからECRへプッシュする際に必要)
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}
 # 実行環境の設定
ARG RAILS_ENV
ENV RAILS_ENV ${RAILS_ENV}

# ローカルにあるアプリを追加
ADD . /WorkoutSchedule

# puma.sockを配置するディレクトリとログファイルを作成
RUN mkdir -p tmp/sockets log && \
    touch log/puma.stderr.log log/puma.stdout.log

VOLUME /WorkoutSchedule/public
VOLUME /WorkoutSchedule/tmp

# リポジトリを更新し依存モジュールをインストール
RUN apk update -qq && \
    apk add --no-cache yarn tzdata libxml2-dev curl-dev make gcc libc-dev nodejs g++ mariadb-dev imagemagick6-dev && \
    # Gemライブラリのインストール
    bundle install && \
    # アセットパイプラインのプリコンパイル
    rails assets:precompile RAILS_ENV=test && \
    rails assets:precompile RAILS_ENV=production && \
    # 不要なデータを削除
    rm -rf /usr/local/bundle/cache/* /usr/local/share/.cache/* /var/cache/* /tmp/* && \
    apk del libxml2-dev curl-dev make gcc libc-dev g++
