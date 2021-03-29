#!/usr/bin/env bash

# Single Policy creation

POLICY_NAME="my-policy"
DESCRIPTION="My description"

# Base configurations

OUTPUT_FILE="Policies-Short.yml"

# AWS CLI 2 Create Policy (Embed Policy)

aws iam create-policy \
--policy-name $POLICY_NAME \
--description "$DESCRIPTION" \
--tags Key=Author,Value=Kolibri Key=Project,Value='Kolibri AWS' \
--policy-document \
'{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                " : ",
                " : "
            ],
            "Resource": "arn:aws: ... "
        }
    ]
}' \
--output yaml >> $OUTPUT_FILE

# Test 

# echo ""
# echo "Variables Test: "
# echo ""
# echo "Policy Name: ${POLICY_NAME}"
# echo "Policy Description: ${DESCRIPTION}"
# echo ""
# echo "Output file: ${OUTPUT_FILE}"
# echo ""