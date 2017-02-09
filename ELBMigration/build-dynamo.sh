#!/bin/bash
# Suss out variables from ~/.bridge/bridge-server.conf
BRIDGEENV=$(cat ~/.bridge/bridge-server.conf | grep bridge.env | cut -d'=' -f2)
BRIDGEUSER=$(cat ~/.bridge/bridge-server.conf | grep bridge.user | cut -d'=' -f2)
#ENDPOINT="--endpoint-url http://localhost:8000"
ENDPOINT=""

# Download and install
echo `date`: Bridge dynamo install starting
#pkill -9 java
#rm -rf ~/dynamodb/
#mkdir -p ~/dynamodb/
#cd ~/dynamodb
#curl -O https://dynamodb-local.s3-accelerate.amazonaws.com/dynamodb_local_latest.tar.gz
#tar -zxvf dynamodb_local_latest.tar.gz
# Start dynamo db
#java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar 2>&1 >> ./dynamo.log&

aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-BackfillRecord
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-BackfillTask
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-CompoundActivityDefinition
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Criteria
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-ExternalIdentifier
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-FPHSExternalIdentifier
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-HealthCode
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-HealthDataAttachment
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-HealthDataRecord3
sleep 10
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-HealthId
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-NotificationRegistration
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-NotificationTopic
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-NotificationTopicSubscription
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-override-SynapseMetaTables
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-override-SynapseTables
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-ParticipantOptions
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-ReportData
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-ReportIndex
sleep 10
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-SchedulePlan
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Study
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-StudyConsent1
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Subpopulation
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Survey
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-SurveyElement
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-SynapseMetaTables
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-SynapseTables
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Task
sleep 10
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-TaskEvent
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Upload2
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-UploadSchema
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-UploadDedupe2


# Create tables
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-BackfillRecord \
    --attribute-definitions AttributeName=taskId,AttributeType=S AttributeName=timestamp,AttributeType=N \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=taskId,KeyType=HASH AttributeName=timestamp,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-BackfillTask \
    --attribute-definitions AttributeName=name,AttributeType=S AttributeName=timestamp,AttributeType=N \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=name,KeyType=HASH AttributeName=timestamp,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table\
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-CompoundActivityDefinition \
    --attribute-definitions AttributeName=studyId,AttributeType=S AttributeName=taskId,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=studyId,KeyType=HASH AttributeName=taskId,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-Criteria \
    --attribute-definitions AttributeName=key,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=key,KeyType=HASH
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-ExternalIdentifier \
    --attribute-definitions AttributeName=studyId,AttributeType=S AttributeName=identifier,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=studyId,KeyType=HASH AttributeName=identifier,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-FPHSExternalIdentifier \
    --attribute-definitions AttributeName=externalId,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=externalId,KeyType=HASH
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-HealthCode \
    --attribute-definitions AttributeName=code,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=code,KeyType=HASH
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-HealthDataAttachment \
    --attribute-definitions AttributeName=id,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=id,KeyType=HASH
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-HealthDataRecord3 \
    --attribute-definitions AttributeName=id,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=id,KeyType=HASH
sleep 10
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-HealthId \
    --attribute-definitions AttributeName=id,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=id,KeyType=HASH
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-NotificationRegistration \
    --attribute-definitions AttributeName=healthCode,AttributeType=S AttributeName=guid,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=healthCode,KeyType=HASH AttributeName=guid,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-NotificationTopic \
    --attribute-definitions AttributeName=studyId,AttributeType=S AttributeName=guid,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=studyId,KeyType=HASH AttributeName=guid,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-NotificationTopicSubscription \
    --attribute-definitions AttributeName=registrationGuid,AttributeType=S AttributeName=topicGuid,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=registrationGuid,KeyType=HASH AttributeName=topicGuid,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-override-SynapseMetaTables \
    --attribute-definitions AttributeName=tableName,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=tableName,KeyType=HASH
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-override-SynapseTables \
    --attribute-definitions AttributeName=schemaKey,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=schemaKey,KeyType=HASH
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-ParticipantOptions \
    --attribute-definitions AttributeName=healthDataCode,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=healthDataCode,KeyType=HASH
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-ReportData \
    --attribute-definitions AttributeName=key,AttributeType=S AttributeName=date,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=key,KeyType=HASH AttributeName=date,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-ReportIndex \
    --attribute-definitions AttributeName=key,AttributeType=S AttributeName=identifier,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=key,KeyType=HASH AttributeName=identifier,KeyType=RANGE
sleep 15
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-SchedulePlan \
    --attribute-definitions AttributeName=studyKey,AttributeType=S AttributeName=createdOn,AttributeType=N \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=studyKey,KeyType=HASH AttributeName=createdOn,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-Study \
    --attribute-definitions AttributeName=identifier,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=identifier,KeyType=HASH
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-StudyConsent1 \
    --attribute-definitions AttributeName=studyKey,AttributeType=S AttributeName=createdOn,AttributeType=N \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=studyKey,KeyType=HASH AttributeName=createdOn,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-Subpopulation \
    --attribute-definitions AttributeName=studyIdentifier,AttributeType=S AttributeName=guid,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=studyIdentifier,KeyType=HASH AttributeName=guid,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-Survey \
    --attribute-definitions AttributeName=guid,AttributeType=S AttributeName=versionedOn,AttributeType=N \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=guid,KeyType=HASH AttributeName=versionedOn,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-SurveyElement \
    --attribute-definitions AttributeName=surveyCompoundKey,AttributeType=S AttributeName=order,AttributeType=N \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=surveyCompoundKey,KeyType=HASH AttributeName=order,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-SynapseMetaTables \
    --attribute-definitions AttributeName=tableName,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=tableName,KeyType=HASH
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-SynapseSurveyTables \
    --attribute-definitions AttributeName=tableName,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=tableName,KeyType=HASH
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-SynapseTables \
    --attribute-definitions AttributeName=schemaKey,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=schemaKey,KeyType=HASH
sleep 15
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-Task \
    --attribute-definitions AttributeName=healthCode,AttributeType=S AttributeName=guid,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=healthCode,KeyType=HASH AttributeName=guid,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-TaskEvent \
    --attribute-definitions AttributeName=healthCode,AttributeType=S AttributeName=eventId,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=healthCode,KeyType=HASH AttributeName=eventId,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-Upload2 \
    --attribute-definitions AttributeName=uploadId,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=uploadId,KeyType=HASH
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-UploadDedupe2 \
    --attribute-definitions AttributeName=ddbKey,AttributeType=S AttributeName=uploadRequestedOn,AttributeType=N \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=ddbKey,KeyType=HASH AttributeName=uploadRequestedOn,KeyType=RANGE
aws dynamodb ${ENDPOINT} create-table \
    --table-name=${BRIDGEENV}-${BRIDGEUSER}-UploadSchema \
    --attribute-definitions AttributeName=key,AttributeType=S AttributeName=revision,AttributeType=N \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --key-schema AttributeName=key,KeyType=HASH AttributeName=revision,KeyType=RANGE

echo `date`: Dynamo ready for use