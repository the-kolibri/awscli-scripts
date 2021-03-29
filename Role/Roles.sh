#!/usr/bin/env bash

# Multiple Roles creation

roles=(
    # Roles List
    MyRole_One
    MyRole_Two
    MyRole_Three

)

# Descriptions

descriptions=(
    # Descriptions List
    "MyRole_One Des"
    "MyRole_Two Des"
    "MyRole_Three Des"
)

# Base configurations

OUTPUT_FILE="./Role/Roles.yml"

# AWS CLI 2 Create Role

for roles_profiles in ${!roles[@]}; do
    aws iam create-role \
    --role-name ${roles[$roles_profiles]} \
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
    --description "${descriptions[$roles_profiles]}" \
    --tags Key=Area,Value=DevOps Key=Project,Value=Test \
    --output yaml >> $OUTPUT_FILE

    # AWS CLI 2 Attach Role Policy Lambda Basic

    aws iam attach-role-policy \
    --role-name ${roles[$roles_profiles]} \
    --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole >> $OUTPUT_FILE
done

# Echo Test

# for roles_profiles in ${!roles[@]}; do
#     echo ${roles[$roles_profiles]}
#     echo ${descriptions[$roles_profiles]}
#     echo ""
# done
