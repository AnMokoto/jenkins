#!/bin/bash -ilex

# Jenkins环境内使用服务器环境
export JAVA_HOME=/usr/local/java
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

# 查询端口占用情况
pidinfo=`sudo netstat -tunlp | grep '8081' | awk '{print $7}'`
echo $pidindo
index="/"
pid=${pidinfo%$index*}
echo "it will be kill the pid with $pid"
if [ ! -z $pid ];then
 sudo kill -9 $pid
fi

# 运行sprint boot项目
tmp="/home/projects/$1/tmp/$1.jar"

if [ -f $tmp ];then
 echo "start service with $tmp"
 nohup java -jar "$tmp" > ./$2.log 2>&1 &
fi