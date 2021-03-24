#!/usr/bin/env bash

POLICY_NAME="my-policy"
DESCRIPTION="My description"

# Policies

aws iam create-policy \
--policy-name $POLICY_NAME \
--description "$DESCRIPTION" \
--tags Key=Author,Value=Kolibri Key=Project,Value='Kolibri AWS' \
--policy-document file://Policy.json \
--output yaml >> Policies.yml