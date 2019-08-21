FROM nginx:1.17.3

ENV host="\$host"
ENV remote_addr="\$remote_addr"
ENV proxy_add_x_forwarded_for="\$proxy_add_x_forwarded_for"

ENV REDIRECT_1_PATH="/REDIRECT_1_PATH_NOT_EXIST_XXX"
ENV REDIRECT_1_TARGET_URL="http://google.com/REDIRECT_1_TARGET_URL_NOT_EXIST_XXX"
ENV REDIRECT_2_PATH="/REDIRECT_2_PATH_NOT_EXIST_XXX"
ENV REDIRECT_2_TARGET_URL="http://google.com/REDIRECT_2_TARGET_URL_NOT_EXIST_XXX"
ENV REDIRECT_3_PATH="/REDIRECT_3_PATH_NOT_EXIST_XXX"
ENV REDIRECT_3_TARGET_URL="http://google.com/REDIRECT_3_TARGET_URL_NOT_EXIST_XXX"
ENV REDIRECT_4_PATH="/REDIRECT_4_PATH_NOT_EXIST_XXX"
ENV REDIRECT_4_TARGET_URL="http://google.com/REDIRECT_4_TARGET_URL_NOT_EXIST_XXX"
ENV REDIRECT_5_PATH="/REDIRECT_5_PATH_NOT_EXIST_XXX"
ENV REDIRECT_5_TARGET_URL="http://google.com/REDIRECT_5_TARGET_URL_NOT_EXIST_XXX"

ENV PROXY_1_PATH="/PROXY_1_PATH_NOT_EXIST_XXX"
ENV PROXY_1_TARGET_URL="http://google.com/PROXY_1_TARGET_URL_NOT_EXIST_XXX"
ENV PROXY_2_PATH="/PROXY_2_PATH_NOT_EXIST_XXX"
ENV PROXY_2_TARGET_URL="http://google.com/PROXY_2_TARGET_URL_NOT_EXIST_XXX"
ENV PROXY_3_PATH="/PROXY_3_PATH_NOT_EXIST_XXX"
ENV PROXY_3_TARGET_URL="http://google.com/PROXY_3_TARGET_URL_NOT_EXIST_XXX"
ENV PROXY_4_PATH="/PROXY_4_PATH_NOT_EXIST_XXX"
ENV PROXY_4_TARGET_URL="http://google.com/PROXY_4_TARGET_URL_NOT_EXIST_XXX"
ENV PROXY_5_PATH="/PROXY_5_PATH_NOT_EXIST_XXX"
ENV PROXY_5_TARGET_URL="http://google.com/PROXY_5_TARGET_URL_NOT_EXIST_XXX"

COPY nginx.tmpl /etc/nginx/conf.d/default.tmpl
CMD /bin/sh -c "envsubst < /etc/nginx/conf.d/default.tmpl > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
