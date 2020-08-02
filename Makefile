.PHONY: main kinesis cognito apigateway

OPT := --no-fail-on-empty-changeset --no-execute-changeset

infra:
	aws cloudformation deploy ${OPT} --stack-name practice-$@ --template-file infra.cf.yml

kinesis:
	aws cloudformation deploy ${OPT} --stack-name practice-$@ --template-file kinesis.cf.yml --capabilities CAPABILITY_NAMED_IAM

kinesis-firehose:
	aws cloudformation deploy ${OPT} --stack-name practice-$@ --template-file kinesis-firehose.cf.yml --capabilities CAPABILITY_NAMED_IAM

cognito:
	aws cloudformation deploy ${OPT} --stack-name practice-$@ --template-file cognito.cf.yml

apigateway:
	aws cloudformation deploy ${OPT} --stack-name practive-$@ --template-file apigateway.cf.yml --capabilities CAPABILITY_NAMED_IAM

apigatewayV2:
	aws cloudformation deploy ${OPT} --stack-name practive-$@ --template-file apigateway_v2.cf.yml --capabilities CAPABILITY_NAMED_IAM

waf:
	aws cloudformation deploy ${OPT} --stack-name practive-$@ --template-file waf.cf.yml --capabilities CAPABILITY_NAMED_IAM --parameter-override MyIpAddress=`curl --silent https://ifconfig.me/`
