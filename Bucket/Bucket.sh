#!/usr/bin/env bash

# Single Bucket creation

# Base configurations

BUCKET_NAME="my-bucket-name"
PROFILE="account-profile"

# AWS CLI 2 S3 Bucket creation

aws s3 create-bucket \
--profile "${PROFILE}" \
--bucket "${BUCKET_NAME}"

# Echo Test

# echo ""
# echo "Variables Test: "
# echo ""
# echo "Profile selected: ${PROFILE}"
# echo "Bucket name selected: ${BUCKET_NAME}"
# echo ""