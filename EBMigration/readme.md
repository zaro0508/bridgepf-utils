
	1.	Assumes presence of properly named s3 buckets for config, including
	⁃	deployment bucket (on mine I used com-museborn-deployment-dev)
	⁃	Other standard buckets are specified at launch time of cloudformation
	2.	Assumes cert for domains are created in AWS->Cert manager (recommend wildcard cert like *.sagebase.org)
	3.	Pull BridgePF code:
	⁃	cd BridgePF
	⁃	Sbt clean dist
	⁃	aws s3 cp target/universal/bridgepf-0.1-SNAPSHOT.zip s3://DEPLOYMENTBUCKET/
	4.	Clone Repos: git@github.com:consolecowboy/bridgepf-utils.git
	5.	Go to AWS->Cloudformation and create new stack
	⁃	Use template from bridgepf-utils/BridgePF-env.template
	⁃	AppDeployBucket should be above bucket. 
	⁃	AppDeployFile is bridgepf-0.1-SNAPSHOT.zip
	⁃	SSLCertArn is ARN from certificate manager for proper cert
	⁃	DNS Hostname and domain set up Route 53 mapping to load balancer
	⁃	Bridge env and user match settings in config file
	⁃	All other setting should match desired production/dev environment. Defaults are currently for my environment, but easy to set to appropriate Sage settings
	6.	On launch, app should be accessible via https://HOSTNAME.DOMAINNAME as expected
	7.	In code .travis.yml, add stanza for elastic beanstalk deployment:
	⁃	To env steps add: (only necessary if settings vary significantly from defaults in code, specifically s3 buckets.)
	⁃	mkdir -p $HOME/bridge
	⁃	bash $TRAVIS_BUILD_DIR/dist/create_bridge_config.sh
	⁃	Add second deploy stanza (with appropriate settings) (Outputs tab of Cloudformation stack should provide env string)
	⁃	deploy:
	⁃	provider: elasticbeanstalk 
	⁃	skip_cleanup: true
	⁃	bucket_name: DEPLOYMENTBUCKET
	⁃	zip_file: target/universal/bridgepf-0.1-SNAPSHOT.zip
	⁃	access_key_id: ACCESS_KEY
	⁃	secret_access_key: SECURED_SECRET_ACCESS_KEY
	⁃	region: us-east-1
	⁃	app: BridgePF-USER-ENV
	⁃	env: EBEnv
	⁃	on:
	⁃	    repo: consolecowboy/BridgePF
	⁃	    branch: develop
	⁃	Pushing to travis should test and push to both heroku and elastic beanstalk now
	8.	Suggest testing reds on travis itself instead of remotely:
	⁃	At top of travis.yml add
	⁃	services:
	⁃	redis-server
	⁃	Specify REDIS_URL as redis://AWS:AWS@localhost:6379 in travis ENV
