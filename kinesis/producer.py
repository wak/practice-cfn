import boto3
import pprint

client = boto3.client('kinesis')
response = client.put_record(
    StreamName='practice-kinesis-KinesisStream-QE4EVPUVI32N',
    Data=b'hello',
    PartitionKey='sample'
)

pprint.pprint(response)
