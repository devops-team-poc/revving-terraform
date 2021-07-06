resource "aws_sns_topic" "test_sns" {
  name = var.sns_topic_name
}


resource "aws_sns_topic" "stage_sns" {
  name = "stage-sns-topic"
}


resource "aws_sns_topic" "prod_sns" {
  name = "prod-sns-topic"
}
