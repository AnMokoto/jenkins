#!/bin/bash -ilex

# Jenkins环境内使用服务器环境
export JAVA_HOME=/usr/local/java
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

# 查询端口占用情况
pidinfo=`sudo netstat -tunlp | grep $1 | awk '{print $7}'`
echo $pidindo
index="/"
pid=${pidinfo%$index*}
echo "it will be kill the pid with $pid"
if [ ! -z $pid ];then
 sudo kill -9 $pid
fi
# 运行sprint boot项目
tmp="$2/tmp/$2.jar"

if [ -f $tmp ];then
 echo "start service with $tmp"

 log="$2/$2.log"
# if [ ! -f $log ];then
#  sudo touch $log
#  sudo chmod 777 $log
# fi

 nohup java -jar "$tmp" > $log 2>&1 &
fi