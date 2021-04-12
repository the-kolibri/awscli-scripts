#!/usr/bin/env bash

# Single Group creation

# Base configurations

GROUP_NAME="my-group-name"
PROFILE="account-profile"

# AWS CLI 2 IAM create group

aws iam create-group \
--profile "${PROFILE}" \
--group-name "${GROUP_NAME}"

# Echo Test

# echo ""
# echo "Variables Test: "
# echo ""
# echo "Profile selected: ${PROFILE}"
# echo "Group name selected: ${GROUP_NAME}"
# echo ""