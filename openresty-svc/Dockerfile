# starting from openresty, install lua package
FROM openresty/openresty:alpine-fat
RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-openidc

# move lua, conf, and static content
COPY ./nginx_lua/ /opt/app/
COPY ./nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY ./static /usr/local/openresty/nginx/html
