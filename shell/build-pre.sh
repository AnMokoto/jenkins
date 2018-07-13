case $BuildType in
    deploy)
        echo "deploy:$BuildType"
        ;;
    rollback)
        echo "rollback:$BuildType"
        echo "version:$Version"
        cd ./zeus-api
        rm -rf target/*
        cp -R ${JENKINS_HOME}/Archive/${JOB_NAME}/${Version}/* target
        pwd && ls
        ;;
     *)
     exit
        ;;
esac
