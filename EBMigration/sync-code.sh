#!/bin/bash 
#echo 'Clearing env'
#bash ./clear-env.sh dev beholt museborn 2>&1 > /dev/null
echo 'Building code'
cd ~/PycharmProjects/BridgePF
git stash && git pull
rsync -av ~/PycharmProjects/bridgepf-utils/EBMigration/BridgePF/ ~/PycharmProjects/BridgePF/
sbt clean dist
if [ -n "$1" ]; then
    MYVER=$1-`date +%s`
	echo Pushing to eb, version ${MYVER}
	eb deploy -l ${MYVER}
else
	echo 'Pushing to s3'
	/Users/beholt/PycharmProjects/bridgepf-utils/EBMigration/push-app.sh dev museborn
fi
