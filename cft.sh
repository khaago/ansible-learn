#!/usr/bin/env zsh

if [ $1 == 'create' ]; then
	aws cloudformation create-stack --stack-name ansible-course \
	--template-body file://setup-env.yml \
	--parameters ParameterKey=KeyName,ParameterValue=ansible-course-key-pair ParameterKey=NameOfService,ParameterValue=ansible-course

fi

if [ $1 == 'delete' ]; then
	aws cloudformation delete-stack --stack-name ansible-course
fi
