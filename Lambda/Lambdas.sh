#!/usr/bin/env bash

# Services lists

# Lambdas

lambdas=(
    # Lambdas List
)

# Roles

roles=(
    # Roles List
)

# Descriptions

descriptions=(
    # Descriptions Lists
)

# Base configurations

RUNTIME="nodejs14.x"
BUCKET="bucket-name"
BUCKET_DIR="bucket-path/index.js.zip"
ACCOUNT_ID="0000000000"

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
