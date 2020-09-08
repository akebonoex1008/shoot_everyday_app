FROM nginx:1.16

RUN rm -f /etc/nginx/conf.d/*
# 初期状態の設定ファイル
ADD nginx.conf /etc/nginx/conf.d/app.conf

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf