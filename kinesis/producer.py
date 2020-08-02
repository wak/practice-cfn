import boto3
import pprint
import sys

stream_name = sys.argv[1]
if stream_name is None:
    print('StreamName required.', file=sys.stderr)
    exit(1)

client = boto3.client('kinesis')
response = client.put_record(
    StreamName=stream_name,
    Data=b'test message',
    PartitionKey='sample'
)

pprint.pprint(response)
