#!/bin/bash 
echo 'Clearing env'
bash ./clear-env.sh dev beholt museborn 2>&1 > /dev/null
echo 'Building code'
cd ~/PycharmProjects/BridgePF
git stash && git pull
rsync -av ~/PycharmProjects/bridgepf-utils/ELBMigration/BridgePF/ ~/PycharmProjects/BridgePF/
activator clean dist
if [ -n "$1" ]; then
	echo Pushing to eb, version $1
	eb deploy -l $1
else
	echo 'Pushing to s3'
	/Users/beholt/PycharmProjects/bridgepf-utils/ELBMigration/push-app.sh dev museborn
fi
