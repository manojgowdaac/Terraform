#variable file

variable "instance_id"{
    description = "this is EC2 instance to monitor"
    type = string
}

variable "sns_topic_name"{
    description = "the name of the SNS topic for CPU utilization alarm"
    type = string
    default = "cpu-utilization-alarm-topic"
}

variable "notification_email"{
    description = "the email address to send notification to"
    type = string
}

variable "cpu_threshold"{
    description = "the CPU utilization threshould for the alarm"
    type = number
    default = 80
}

variable "alarm_name"{
    description = "the name of the cloudwatch alarm"
    type = string
    default = "High-CPU-utilization-alarm"
}