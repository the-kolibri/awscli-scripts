#!/usr/bin/env bash

# Multiple Alias and Version creation

# Lambdas to process

lambdas=(
    # Lambdas List
)

versions_descriptions=(
    # Lambdas Version Descriptions
)

alias_stg_descriptions=(
    # Lambdas Alias Descriptions (STG)
)

alias_prod_descriptions=(
    # Lambdas Alias Descriptions (PROD)
)

# Base configurations

OUTPUT_FILE="./Output.yml"

# AWS CLI 2 Version and Alias Creation

for lambda_alias in ${!lambdas[@]}; do

    aws lambda publish-version \
    --function-name "${lambdas[$lambda_alias]}" \
    --description "${versions_descriptions[$lambda_alias]}" >> $OUTPUT_FILE

    aws lambda create-alias \
    --function-name "${lambdas[$lambda_alias]}" \
    --description "${alias_stg_descriptions[$lambda_alias]}" \
    --function-version 1 \
    --name stg >> $OUTPUT_FILE

    aws lambda create-alias \
    --function-name "${lambdas[$lambda_alias]}" \
    --description "${alias_prod_descriptions[$lambda_alias]}" \
    --function-version 1 \
    --name prod >> $OUTPUT_FILE
done
