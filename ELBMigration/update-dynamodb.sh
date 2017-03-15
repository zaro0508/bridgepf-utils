#!/bin/bash
export MYENV=${1:-dev}
export MYUSER=${2:-beholt}

for i in BackfillRecord BackfillTask CompoundActivityDefinition Upload2 TaskEvent Task SurveyElement Survey Subpopulation StudyConsent1 Study SchedulePlan ReportIndex ReportData ParticipantOptions NotificationTopicSubscription NotificationTopic NotificationRegistration HealthId HealthDataRecord3 HealthDataAttachment HealthCode FPHSExternalIdentifier ExternalIdentifier Criteria CompoundActivityDefinition; do
	a=$(($a+1))
	if [ "$a" -eq 5 ] || [ "$a" -eq 10 ] || [ "$a" -eq 15 ]; then
		sleep 10
	fi
	aws dynamodb update-table --table-name ${MYENV}-${MYUSER}-$i --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1
done

sleep 10

aws dynamodb update-table  --table-name ${MYENV}-${MYUSER}-HealthDataAttachment --global-secondary-index-updates \
  "Update={"IndexName"="recordId-index", "ProvisionedThroughput"= {"ReadCapacityUnits"=1, "WriteCapacityUnits"=1}   }"

aws dynamodb update-table  --table-name ${MYENV}-${MYUSER}-HealthDataRecord3 --global-secondary-index-updates \
  "Update={"IndexName"="study-uploadedOn-index", "ProvisionedThroughput"= {"ReadCapacityUnits"=1, "WriteCapacityUnits"=1}   }"

aws dynamodb update-table  --table-name ${MYENV}-${MYUSER}-HealthDataRecord3 --global-secondary-index-updates \
  "Update={"IndexName"="healthCode-createdOn-index", "ProvisionedThroughput"= {"ReadCapacityUnits"=1, "WriteCapacityUnits"=1}   }"

aws dynamodb update-table  --table-name ${MYENV}-${MYUSER}-HealthDataRecord3 --global-secondary-index-updates \
  "Update={"IndexName"="uploadDate-index", "ProvisionedThroughput"= {"ReadCapacityUnits"=1, "WriteCapacityUnits"=1}   }"

aws dynamodb update-table  --table-name ${MYENV}-${MYUSER}-Survey --global-secondary-index-updates \
  "Update={"IndexName"="studyKey-index", "ProvisionedThroughput"= {"ReadCapacityUnits"=1, "WriteCapacityUnits"=1}   }"

aws dynamodb update-table  --table-name ${MYENV}-${MYUSER}-Task --global-secondary-index-updates \
  "Update={"IndexName"="healthCodeActivityGuid", "ProvisionedThroughput"= {"ReadCapacityUnits"=1, "WriteCapacityUnits"=1}   }"

sleep 10

aws dynamodb update-table  --table-name ${MYENV}-${MYUSER}-Task --global-secondary-index-updates \
  "Update={"IndexName"="schedulePlanGuid-index", "ProvisionedThroughput"= {"ReadCapacityUnits"=1, "WriteCapacityUnits"=1}   }"

aws dynamodb update-table  --table-name ${MYENV}-${MYUSER}-Upload2 --global-secondary-index-updates \
  "Update={"IndexName"="healthCode-requestedOn-index", "ProvisionedThroughput"= {"ReadCapacityUnits"=1, "WriteCapacityUnits"=1}   }"

aws dynamodb update-table  --table-name ${MYENV}-${MYUSER}-UploadDedupe2 --global-secondary-index-updates \
  "Update={"IndexName"="uploadRequestedDate-index", "ProvisionedThroughput"= {"ReadCapacityUnits"=1, "WriteCapacityUnits"=1}   }"

aws dynamodb update-table  --table-name ${MYENV}-${MYUSER}-UploadSchema --global-secondary-index-updates \
  "Update={"IndexName"="studyId-index", "ProvisionedThroughput"= {"ReadCapacityUnits"=1, "WriteCapacityUnits"=1}   }"

