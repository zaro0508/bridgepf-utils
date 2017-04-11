BRIDGEENV=${1:-dev}
PROFILE=${2:-museborn}

aws s3 cp /Users/beholt/PycharmProjects/BridgePF/target/universal/bridgepf-0.1-SNAPSHOT.zip s3://com-museborn-deployment-${BRIDGEENV}/elasticbeanstalk.zip --profile=${PROFILE}
