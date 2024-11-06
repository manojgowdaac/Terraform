#output 

output "sns_topic_arn"{
    description = "the ARN of SNS topic used for the CPU alarm notification"
    value = aws_sns_topic.cpu_alarm_topic.arn
}

output "cloudwatch_alarm_name"{
    description = "this name of the cloudwatch alarm for high cpu utilization"
    value = aws_cloudwatch_metric_alarm.cpu_high_alarm.alarm_name
}   
