#!/usr/bin/env bash

ROLE_NAME="MyRole"
DESCRIPTION="My description"

# Roles

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
--output yaml >> Roles.yml