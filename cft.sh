#!/bin/bash
if [ $1 == 'create' ]; then
	aws cloudformation create-stack --stack-name ansible-course --template-body file://setup-env.yml 
fi

if [ $1 == 'delete' ]; then
	aws cloudformation delete-stack --stack-name ansible-course
fi
