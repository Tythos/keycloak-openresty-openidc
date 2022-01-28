FROM openresty/openresty:alpine-fat
RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-openidc
COPY ./nginx_lua/ /opt/app/
COPY ./nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY ./static /usr/local/openresty/nginx/html
EXPOSE 80
