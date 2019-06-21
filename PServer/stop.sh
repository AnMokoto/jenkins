#! /bin/sh -e

echo '查询运行中的服务'
pid=$(ps -aux | grep server.jar | grep -v grep | awk '{print $2}')
echo '运行中的服务PID为：' $pid
echo '即将结束进程'
kill -9 $pid
echo '已结束进程'