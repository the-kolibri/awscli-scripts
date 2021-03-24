#!/usr/bin/env bash

POLICY_NAME="my-policy"
DESCRIPTION="My description"

# Policies

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
--output yaml >> Policies-Short.yml