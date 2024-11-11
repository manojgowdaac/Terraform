# project/main.tf

# Calling the cloudwatch module
module "ec2_cpu_alarm" {
  source            = "/home/project/cloudwatch-metric/cloudwatch"        # Path to the module folder
  instance_id       = "i-0c3cfdbb9f0c839af"           # Replace with your EC2 instance ID
  sns_topic_name    = "high-cpu-usage-topic"
  notification_email = "manojgowdaac@gmail.com"       # Replace with your email address
  cpu_threshold     = 80
  alarm_name        = "High-CPU-Utilization-Alarm"
}

#cloud provider
provider "aws" {
  region     = "ap-southeast-2"    #your region
}
