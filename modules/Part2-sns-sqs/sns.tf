resource "aws_sns_topic" "topic1" {
    name = "my-topic-1"
    tags = {
      Name="My-topic-1"
    }
  
}
resource "aws_sns_topic_subscription" "topic_subscription" {
    protocol = "sqs"
    raw_message_delivery = true
    topic_arn = aws_sns_topic.topic1.arn
    endpoint = aws_sqs_queue.queue1.arn
}