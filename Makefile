.PHONY: main kinesis cognito

main:
	aws cloudformation deploy --stack-name cfn-practice --template-file main.cf.yml --no-execute-changeset

kinesis:
	aws cloudformation deploy --stack-name practice-kinesis --template-file kinesis.cf.yml --no-execute-changeset --capabilities CAPABILITY_NAMED_IAM

cognito:
	aws cloudformation deploy --stack-name practice-cognito --template-file cognito.cf.yml --no-execute-changeset
