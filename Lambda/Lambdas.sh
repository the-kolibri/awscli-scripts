#!/usr/bin/env bash

# Multiple Lambda Functions creation

lambdas=(
    # Lambdas List
)

# Roles

roles=(
    # Roles List
)

# Descriptions

descriptions=(
    # Descriptions List
)

# Base configurations

RUNTIME="nodejs14.x"
BUCKET="bucket-name"
BUCKET_PATH="bucket-path/index.js.zip"
ACCOUNT_ID="0000000000"
OUTPUT_FILE="./Lambda/Lambdas.yml"

# AWS CLI 2 Lambda Create Function

for lambda_services in ${!lambdas[@]}; do
    aws lambda create-function \
    --function-name ${lambdas[$lambda_services]} \
    --runtime $RUNTIME \
    --handler index.handler \
    --code S3Bucket=$BUCKET,S3Key=$BUCKET_PATH \
    --role arn:aws:iam::${ACCOUNT_ID}:role/${roles[$lambda_services]} \
    --description "${descriptions[$lambda_services]}" \
    --tags Author=Kolibri,Project='Kolibri AWS' \
    --output yaml >> $OUTPUT_FILE
done

# Echo Test

# for lambda_services in ${!lambdas[@]}; do
#     echo ${lambdas[$lambda_services]}
#     echo ${roles[$lambda_services]}
#     echo ${descriptions[$lambda_services]}
#     echo ""
# done
