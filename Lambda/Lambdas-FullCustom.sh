#!/usr/bin/env bash

# Multiple Lambda Functions creation

# Lambdas

lambdas=(
    # Lambdas List
)

# Roles

roles=(
    # Roles List
)

# Policies

policies=(
    # Policies List
)

# Lambdas descriptions

lambdas_descriptions=(
    # Descriptions descriptions list
)

# Roles descriptions

roles_descriptions=(
    # Roles descriptions list
)

# Policies descriptions

policies_descriptions=(
    # Policies descriptions list
)

# Base configurations

RUNTIME="nodejs14.x" # python3.8 nodejs14.x
BUCKET="bucket-name"
BUCKET_PATH="bucket-path/index.js.zip"
ACCOUNT_ID="000000000"
OUTPUT_FILE="./Lambda/Lambdas-FullService.yml"

# AWS CLI 2 Policies Creation

echo "Beginning of the Policies creation"

for lambda_policies in ${!policies[@]}; do
    aws iam create-policy \
    --policy-name ${policies[$lambda_policies]} \
    --description "${policies_descriptions[$lambda_policies]}" \
    --tags Key=Author,Value=Kolibri Key=Project,Value='Kolibri AWS' \
    --policy-document \
    '{
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "VisualEditor0",
                "Effect": "Allow",
                "Action": [
                    "lambda:ListFunctions"
                ],
                "Resource": "*"
            }
        ]
    }' \
    --output yaml >> $OUTPUT_FILE
done

echo "Policies created"

sleep 5

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
    --description "${roles_descriptions[$lambda_roles]}" \
    --tags Key=Author,Value=Kolibri Key=Project,Value="Kolibri AWS" \
    --output yaml >> $OUTPUT_FILE

    aws iam attach-role-policy \
    --role-name ${roles[$lambda_roles]} \
    --policy-arn arn:aws:iam::${ACCOUNT_ID}:policy/${policies[$lambda_roles]} >> $OUTPUT_FILE
done

echo "Roles created"

sleep 30

echo "Beginning Lambda Creation"

# AWS CLI 2 Lambda Functions Creation

for lambda_functions in ${!lambdas[@]}; do
    aws lambda create-function \
    --function-name ${lambdas[$lambda_functions]} \
    --runtime $RUNTIME \
    --handler index.handler \
    --code S3Bucket=$BUCKET,S3Key=$BUCKET_PATH \
    --role arn:aws:iam::${ACCOUNT_ID}:role/${roles[$lambda_functions]} \
    --description "${lambdas_descriptions[$lambda_functions]}" \
    --tags Author=Kolibri,Project="Kolibri AWS" \
    --output yaml >> $OUTPUT_FILE
done

echo "Lambdas created"

echo "Done"
