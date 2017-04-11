export BRIDGEENV=$1
export BRIDGEUSER=$2
export PROFILE=museborn

# Clean dynamo
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-BackfillRecord --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-BackfillTask --profile=${PROFILE}  2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-CompoundActivityDefinition --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Criteria --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-ExternalIdentifier --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-FPHSExternalIdentifier --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-HealthCode --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-HealthDataAttachment --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-HealthDataRecord3 --profile=${PROFILE} 2>&1 1>> /dev/null
if [ -z $? ]; then
	sleep 10
fi
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-HealthId --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-NotificationRegistration --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-NotificationTopic --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-NotificationTopicSubscription --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-ParticipantOptions --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-ReportData --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-ReportIndex --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-SchedulePlan --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Study --profile=${PROFILE} 2>&1 1>> /dev/null
if [ -z $? ]; then
	sleep 10
fi
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-StudyConsent1 --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Subpopulation --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Survey --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-SurveyElement --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Task --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-TaskEvent --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Upload2 --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-UploadSchema --profile=${PROFILE} 2>&1 1>> /dev/null
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-UploadDedupe2 --profile=${PROFILE} 2>&1 1>> /dev/null
