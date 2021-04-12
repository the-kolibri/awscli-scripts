#!/usr/bin/env bash

# Single User creation

# Base configurations

USER_NAME="my-user-name"
PROFILE="account-profile"

# AWS CLI 2 IAM create user

aws iam create-user \
--profile "${PROFILE}" \
--user-name "${USER_NAME}" \
-tags Key=Author,Value=Kolibri Key=Project,Value='Kolibri AWS' \
--permissions-boundary "arn:aws:iam::aws:policy/IAMUserChangePassword"

# Echo Test

# echo ""
# echo "Variables Test: "
# echo ""
# echo "Profile selected: ${PROFILE}"
# echo "User name selected: ${USER_NAME}"
# echo ""
