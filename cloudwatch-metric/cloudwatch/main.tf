# SNS topic to send notification
# we get this from: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic
resource "aws_sns_topic" "cpu_alarm_topic" {
  name = "${var.sns_topic_name}"
}

# SNS topic subscription (eg. email)
#this from: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription
resource "aws_sns_topic_subscription" "cpu_alarm_email_subscription" {
  topic_arn = aws_sns_topic.cpu_alarm_topic.arn
  # change this to "SMS" for SMS notifications
  protocol  = "email" 
  endpoint  = var.notification_email #email address for alerts
}

#cloudwatch alarm for EC2 CPU utilization
# this from: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm
resource "aws_cloudwatch_metric_alarm" "cpu_high_alarm" {
  alarm_name                = "${var.alarm_name}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 60  # 1 minutes
  statistic                 = "Average"
  threshold                 = var.cpu_threshold
  alarm_description         = "This metric monitors ec2 cpu utilization and tiggers if it exceeds 80%"
  
  #the EC2 instance ID
  dimensions = {
        InstanceId = var.instance_id
      }
   #send a notification to SNS topic when the alarm is in "ALARM" state
    alarm_actions     = [aws_sns_topic.cpu_alarm_topic.arn]
}