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
ACCOUNT_ID="000000000"
OUTPUT_FILE="./Lambda/Lambdas-Full.yml"

# AWS CLI 2 Roles Creation

echo "Beginning Roles Creation and Policies assignations"

for lambda_roles in ${!roles[@]}; do
    aws iam create-role \
    --role-name ${roles[$lambda_roles]} \
    --assume-role-policy-document \
    '{
        "Version": "2012-10-17",
        "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
            }
        ]
    }' \
    --description "${descriptions[$lambda_roles]}" \
    --tags Key=Author,Value=Kolibri Key=Project,Value="Kolibri AWS" \
    --output yaml >> $OUTPUT_FILE

    aws iam attach-role-policy \
    --role-name ${roles[$lambda_roles]} \
    --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole >> $OUTPUT_FILE
done

echo "Roles created"

sleep 60

echo "Beginning Lambda Creation"

# AWS CLI 2 Lambda Functions Creation

for lambda_functions in ${!lambdas[@]}; do
    aws lambda create-function \
    --function-name ${lambdas[$lambda_functions]} \
    --runtime $RUNTIME \
    --handler index.handler \
    --code S3Bucket=$BUCKET,S3Key=$BUCKET_PATH \
    --role arn:aws:iam::${ACCOUNT_ID}:role/${roles[$lambda_functions]} \
    --description "${descriptions[$lambda_functions]}" \
    --tags Author=Kolibri,Project="Kolibri AWS" \
    --output yaml >> $OUTPUT_FILE
done

echo "Done"
