import { SQS } from 'aws-sdk';
import { SNSEvent, Context, Callback } from 'aws-lambda';

const sqs = new SQS({
    endpoint: 'http://localstack:4566',
    region: 'us-east-1',
    accessKeyId: 'test',
    secretAccessKey: 'test',
});

export const snsHandler = async (event: SNSEvent, context: Context, callback: Callback) => {
    const message = event.Records[0].Sns.Message;

    const params = {
        QueueUrl: 'http://localstack:4566/000000000000/my-queue',
        MessageBody: message,
    };

    try {
        await sqs.sendMessage(params).promise();
        callback(null, `Message sent to SQS: ${message}`);
    } catch (e) {
        callback(JSON.stringify(e));
    }
};
