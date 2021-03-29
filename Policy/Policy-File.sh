#!/usr/bin/env bash

# Single Policy creation

POLICY_NAME="my-policy"
DESCRIPTION="My description"

# Base configurations

OUTPUT_FILE="./Policy/Policies-File.yml"

# Policies

aws iam create-policy \
--policy-name $POLICY_NAME \
--description "$DESCRIPTION" \
--tags Key=Author,Value=Kolibri Key=Project,Value='Kolibri AWS' \
--policy-document file://Policy.json \
--output yaml >> $OUTPUT_FILE

# Echo Test

# echo ""
# echo "Variables Test: "
# echo ""
# echo "Policy Name: ${POLICY_NAME}"
# echo "Policy Description: ${DESCRIPTION}"
# echo ""
# echo "Output file: ${OUTPUT_FILE}"
# echo ""
