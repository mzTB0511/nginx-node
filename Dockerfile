# 使用node 6.10.3-slim 精简版为基础镜像
FROM node:12.7-slim

#安装阿里镜像，安装 nginx
RUN sed -i "s/archive.ubuntu./mirrors.aliyun./g" /etc/apt/sources.list \
    && sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y nginx

# 生命容器运行时提供的服务端口
EXPOSE 80

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

# 以前台方式运行nginx
CMD ["nginx","-g","daemon off;"]