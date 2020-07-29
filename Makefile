.PHONY: main kinesis cognito apigateway

infra:
	aws cloudformation deploy --stack-name practice-$@ --template-file infra.cf.yml --no-execute-changeset

kinesis:
	aws cloudformation deploy --stack-name practice-$@ --template-file kinesis.cf.yml --no-execute-changeset --capabilities CAPABILITY_NAMED_IAM

cognito:
	aws cloudformation deploy --stack-name practice-$@ --template-file cognito.cf.yml --no-execute-changeset

apigateway:
	aws cloudformation deploy --stack-name practive-$@ --template-file apigateway.cf.yml --no-execute-changeset --capabilities CAPABILITY_NAMED_IAM
