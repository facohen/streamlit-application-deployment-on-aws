#!/bin/bash

athena_stack_name="streamlit-dashboard-athena"
glue_stack_name="streamlit-dashboard-glue"
syd_stack_name="streamlit-dashboard-syd"
S3_BUCKET_NAME="streamlit-dashboard-85c08ed05189"

echo "deleting ${athena_stack_name}"
aws cloudformation delete-stack --stack-name ${athena_stack_name} > /dev/null

echo "deleting ${glue_stack_name}"
aws cloudformation delete-stack --stack-name ${glue_stack_name} > /dev/null

echo "deleting ${syd_stack_name}"
aws cloudformation delete-stack --stack-name "${syd_stack_name}" > /dev/null

# not recommended but will use this for now
echo "deleting s3://${S3_BUCKET_NAME}"
aws s3 rb s3://${S3_BUCKET_NAME} --force > /dev/null

echo "restore delete_resources.sh"
git checkout -- delete_resources.sh

echo "restore config.py"
git checkout -- deployment/sagemaker-dashboards-for-ml/examples/yahoo-finance/dashboard/script/config.py
