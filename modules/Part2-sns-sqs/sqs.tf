resource "aws_sqs_queue" "queue1" {
    name="my-sqs-12"
    receive_wait_time_seconds = 20
  
}
resource "aws_sqs_queue_policy" "policy1" {
    name=aws_sqs_queue.queue1.id 
    policy    = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "sns.amazonaws.com"
      },
      "Action": [
        "sqs:SendMessage"
      ],
      "Resource": [
        "${aws_sqs_queue.queue1.arn}"
      ],
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.topic1.arn}"
        }
      }
    }
  ]
}
EOF
}