#output

output "instance_id"{
    description = "ID fo the ec2 instance"
    value = aws_instance.project.id
}