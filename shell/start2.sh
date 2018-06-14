#!/bin/bash -ilex


# 查看包是否存在
jar=$1/tmp/$1.jar

if [ ! -f $jar ];then
 echo "Can't found the jar to begin."
 exit 0
fi

pw=`pwd`
index='/'
pd=${pw##*$index}-$1
echo "new jar name = $pd"

# 查看进程是否被占用
pids=`ps -aef | grep "$pd" | awk '{ print $2 }' `
echo "pids=[ $pids ]"

for pid in $pids;
do
 if [ ! -z $pid ];then
  kill -9 $pid
 fi
done

jarR=$1/release/$pd.jar
parent=`dirname $jarR`

if [ ! -d "$parent" ];then
 echo "create $parent"
 mkdir $parent
fi


cp -rf $jar $jarR

log=$1/$1.log

if [ -f $jarR ];then
 nohup java -jar  $jarR > $log 2>&1 &
fi
