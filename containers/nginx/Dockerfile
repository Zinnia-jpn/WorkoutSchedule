FROM nginx:1.19.6

# 設定ファイルの削除
RUN rm -f /etc/nginx/conf.d/*
# 用意したNginx設定ファイルをコンテナにコピー
ADD nginx.conf /etc/nginx/conf.d/nginx.conf

# ビルド完了後にNginxを起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
