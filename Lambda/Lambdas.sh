#!/usr/bin/env bash

FUNCTION_NAME="sd_calendartournamentsactive-test"
DESCRIPTION_OO="Lambda for obtain active tournaments from Opta"
ROLE_00="SportData-CalendarTournamentsActive-Role"

RUNTIME="nodejs14.x"
BUCKET="devops-cloudprojects"
BUCKET_DIR="Lambda-Placeholder/index.js.zip"
ACCOUNT_ID="528662748254"

aws lambda create-function \
    --function-name $FUNCTION_NAME \
    --runtime $RUNTIME \
    --handler index.handler \
    --code S3Bucket=$BUCKET,S3Key=$BUCKET_DIR \
    --role arn:aws:iam::${ACCOUNT_ID}:role/$ROLE_00 \
    --description "${DESCRIPTION_00}" \
    --tags Area=DevOps,Branch=TUDN,CodeName='Third Party',Environment=All,Project=Sport-Data,Service=Calendar


