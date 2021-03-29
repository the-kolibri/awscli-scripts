#!/usr/bin/env bash

# Single Role creation (Referenced  Policy)

ROLE_NAME="MyRole"
DESCRIPTION="My description"

# Base configurations

OUTPUT_FILE="./Role/Role-Referenced.yml"

# AWS CLI 2 Create Role (Referenced  Policy)

aws iam create-role \
--role-name $ROLE_NAME \
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
--description "$DESCRIPTION" \
--tags Key=Area,Value=DevOps Key=Project,Value=Test \
--output yaml >> $OUTPUT_FILE

# AWS CLI 2 Attach Role Policy Lambda Basic

aws iam attach-role-policy \
--role-name $ROLE_NAME \
--policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole >> $OUTPUT_FILE

# Echo Test

# echo ""
# echo "Variables Test: "
# echo ""
# echo "Role Name: ${ROLE_NAME}"
# echo "Role Description: ${DESCRIPTION}"
# echo ""
# echo "Output file: ${OUTPUT_FILE}"
# echo ""
