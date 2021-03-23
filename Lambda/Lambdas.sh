#!/usr/bin/env bash

# Services lists

# Lambdas

lambdas=(
    sd_calendartournamentsactive-test
    sd_calendarmatchbyyear-test
    sd_calendarnormalize-test
    sd_calendartournamentsbymonth-test
    sd_calendarstorage-test
    sd_calendargetcalendarbymonth-test
)

# Roles

roles=(
    SportData-CalendarTournamentsActive-Role
    SportData-CalendarMatchByYear-Role			
    SportData-CalendarNormalize-Role					
    SportData-CalendarTournamentsByMonth-Role
    SportData-CalendarStorage-Role		
    SportData-CalendarGetCalendarByMonth-Role
)

# Descriptions

descriptions=(
    "Lambda for obtain active tournaments from Opta"
    "Lambda to get matches by year"		
    "Lambda for normalize calendar data"					
    "Lambda to get calendar data by month"
    "Lambda to get data from S3 Bucket"		
    "Lambda to get Api Gateway endpoints"
)

# Base configurations

RUNTIME="nodejs14.x"
BUCKET="devops-cloudprojects"
BUCKET_DIR="Lambda-Placeholder/index.js.zip"
ACCOUNT_ID="528662748254"

# AWS CLI 2 Lambda Create Function

for lambda_services in ${!lambdas[@]}; do
    aws lambda create-function \
    --function-name ${lambdas[$lambda_services]} \
    --runtime $RUNTIME \
    --handler index.handler \
    --code S3Bucket=$BUCKET,S3Key=$BUCKET_DIR \
    --role arn:aws:iam::${ACCOUNT_ID}:role/${roles[$lambda_services]} \
    --description "${descriptions[$lambda_services]}" \
    --tags Area=DevOps,Branch=TUDN,CodeName='Third Party',Environment=All,Project=Sport-Data,Service=Calendar \
    --output yaml >> Lambdas.txt
done

# Echo test:

# for lambda_services in ${!lambdas[@]}; do
#     echo ${lambdas[$lambda_services]}
#     echo ${roles[$lambda_services]}
#     echo ${descriptions[$lambda_services]}
#     echo ""
# done
