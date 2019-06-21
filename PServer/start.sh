#! /bin/sh -e

echo '即将启动服务'
nohup java -jar /data/wwwroot/pa/server.jar >> /data/logs/pa/pa.infinitydigital.cn.log 2>&1 &
echo '已启动服务'
echo '日志文件为：/data/logs/pa/pa.infinitydigital.cn.log'