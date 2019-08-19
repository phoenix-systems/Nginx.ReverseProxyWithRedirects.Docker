FROM nginx:1.15.12
COPY nginx.tmpl /etc/nginx/conf.d/default.tmpl
CMD /bin/sh -c "envsubst < /etc/nginx/conf.d/default.tmpl > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
