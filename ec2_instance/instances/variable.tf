
#varibale for configuration

variable "instance_type"{
    description = "type of ec2"
    default =  "t2.micro"
}

variable "ami_id"{
    description = "AMI ID for the ec2 instance"
    default = "ami-001f2488b35ca8aad" #place the ami id here 
}