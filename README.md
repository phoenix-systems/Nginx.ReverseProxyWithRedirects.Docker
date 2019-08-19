# Nginx.ReverseProxyWithRedirects.Docker
The purpose of that docker container is to proxy traffic up to 5 url's and support up to 5 redirects. It can be used to automate/simplify deployments with traefik + docker-compose for services without high load.

## Params
The following environment params are supported
```
- REDIRECT_1_PATH: path from where redirect will occur to REDIRECT_1_TARGET_URL
- REDIRECT_1_TARGET_URL: url to where request will be redirected with 301 http code

- PROXY_1_PATH: path from where request will be proxied to PROXY_1_TARGET_URL
- PROXY_1_TARGET_URL: url to where request will be proxied
```
Up to 5 redirects and proxies are supported. Just change the number in env variable, like REDIRECT_2_PATH, etc...

## Pre-built docker image
Sample docker-compose.yaml with traefik:
```
version: '3'
services:
  reverse-proxy:
    image: phoenixsystemsag/nginx-reverse-proxy-with-redirects:1.0.0
    restart: unless-stopped
    expose:
      - 80
    networks:
      - web
      - default
    environment:
      - "REDIRECT_1_PATH=/path1"
      - "REDIRECT_1_TARGET_URL=http://dummy.com/path1"
      - "PROXY_1_PATH=/path2"
      - "REDIRECT_1_TARGET_URL=http://internal.local/path2"
    labels:
      - "traefik.docker.network=web"
      - "traefik.enable=true"
      - "traefik.port=80"
      - "traefik.frontend.redirect.entryPoint=https"
      - "traefik.frontend.rule=Host:example.com"
networks:
  web:
    external: true
```

## Build docker image
Pull code from repository and run the following command:
```
docker build --pull -t nginx-reverse-proxy-with-redirects .
```
