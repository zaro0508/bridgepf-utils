export BRIDGEENV=$1
export BRIDGEUSER=$2
export PROFILE=museborn

# Clean dynamo
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-BackfillRecord --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-BackfillTask --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-CompoundActivityDefinition --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Criteria --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-ExternalIdentifier --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-FPHSExternalIdentifier --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-HealthCode --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-HealthDataAttachment --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-HealthDataRecord3 --profile=${PROFILE}
sleep 10
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-HealthId --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-NotificationRegistration --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-NotificationTopic --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-NotificationTopicSubscription --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-override-SynapseMetaTables --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-override-SynapseTables --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-ParticipantOptions --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-ReportData --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-ReportIndex --profile=${PROFILE}
sleep 10
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-SchedulePlan --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Study --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-StudyConsent1 --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Subpopulation --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Survey --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-SurveyElement --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-SynapseMetaTables --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-SynapseTables --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Task --profile=${PROFILE}
sleep 10
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-TaskEvent --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-Upload2 --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-UploadSchema --profile=${PROFILE}
aws dynamodb delete-table --table-name ${BRIDGEENV}-${BRIDGEUSER}-UploadDedupe2 --profile=${PROFILE}
