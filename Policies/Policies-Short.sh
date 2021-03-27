#!/usr/bin/env bash

# Services List

# Policies

policies=(
    # Policies List
)

# Descriptions

descriptions=(
    # Descriptions List
)

AWS CLI 2 Policy Create Function

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
    --output yaml >> Policies-Short.yml
done

# Echo test:

# for policy_rules in ${!policies[@]}; do
#     echo ${policies[$policy_rules]}
#     echo ${descriptions[$policy_rules]}
#     echo ""
# done