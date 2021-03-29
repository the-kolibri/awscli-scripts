#!/usr/bin/env bash

# Single Lambda Function creation

LAMBDA_NAME="my-lambda-name"
LAMBDA_ROLE="MyRole"
LAMBDA_DESCRIPTION="My Lambda Description"

# Base configurations

RUNTIME="nodejs14.x"
BUCKET="bucket-name"
BUCKET_PATH="bucket-path/index.js.zip"
ACCOUNT_ID="0000000000"
OUTPUT_FILE="./Lambda/Lambdas.yml"

# AWS CLI 2 Lambda Create Function

aws lambda create-function \
--function-name $LAMBDA_NAME \
--runtime $RUNTIME \
--handler index.handler \
--code S3Bucket=$BUCKET,S3Key=$BUCKET_PATH \
--role arn:aws:iam::${ACCOUNT_ID}:role/${LAMBDA_ROLE} \
--description "${LAMBDA_DESCRIPTION}" \
--tags Author=Kolibri,Project='Kolibri AWS' \
--output yaml >> $OUTPUT_FILE

# Echo Test

# echo ""
# echo "Variables Test: "
# echo ""
# echo "Lambda Name: ${LAMBDA_NAME}"
# echo "Lambda Role: ${LAMBDA_ROLE}"
# echo "Lambda Description: ${LAMBDA_DESCRIPTION}"
# echo ""
# echo "ARN Role: arn:aws:iam::${ACCOUNT_ID}:role/${LAMBDA_ROLE}"
# echo ""
# echo "Lambda Runtime: ${RUNTIME}"
# echo "Bucket Name: ${BUCKET}"
# echo "Bucket Path: ${BUCKET_PATH}"
# echo "Account ID: ${ACCOUNT_ID}"
# echo "Output file: ${OUTPUT_FILE}"
# echo ""
