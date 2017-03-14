#!/bin/bash
for i in BackfillRecord BackfillTask CompoundActivityDefintion Upload2 TaskEvent Task SurveyElement Survey Subpopulation StudyConsent1 Study SchedulePlan ReportIndex ReportData ParticipantOptions NotificationTopicSubscription NotificationTopic NotificationRegistration HealthId HealthDataRecord3 HealthDataAttachment HealthCode FPHSExternalIdentifier ExternalIdentifier Criteria CompoundActivityDefinition; do
	a=$(($a+1))
	if [ "$a" -eq 9 ] || [ "$a" -eq 18 ]; then
		sleep 5
	fi
	aws dynamodb update-table --table-name dev-beholt-$i --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1
done
