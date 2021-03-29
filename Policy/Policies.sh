#!/usr/bin/env bash

# Multiple Policies creation

policies=(
    # Policies List
)

# Descriptions

descriptions=(
    # Descriptions List
)

# Base configurations

OUTPUT_FILE="./Policy/Policies-Short.yml"

# AWS CLI 2 Policy Create Function

for policy_rules in ${!policies[@]}; do
    aws iam create-policy \
    --policy-name ${policies[$policy_rules]} \
    --description "${descriptions[$policy_rules]}" \
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
done

# Echo Test

# for policy_rules in ${!policies[@]}; do
#     echo ${policies[$policy_rules]}
#     echo ${descriptions[$policy_rules]}
#     echo ""
# done
