archive=${JENKINS_HOME}/Archive/${JOB_NAME}/${Version}/

if [ ! -d "$archive" ];then
   sudo mkdir -p $archive
fi

sudo chown jenkins:jenkins -R ${JENKINS_HOME}/Archive

sudo cp -Rf ${JENKINS_HOME}/workspace/${JOB_NAME}/zeus-api/target/* $archive
