

provider "aws" {
  region = "us-east-1"    
}

variable "image" {
  type = string
  default = "ami-052efd3df9dad4825"
}

variable "hw" {
  default = "t2.micro"
}

variable "name" {
  default = "naveen-manual-tf"
}

variable "env" {
  default = "prod"
}

/*variable "bucket-name" {
    default = "naveen-default-bucket-name"
}*/

resource "aws_instance" "myawsserver" {
  ami = var.image
  instance_type = var.hw
#   key_name = "gagan-new"
  tags = {
    Name = lower (var.name)
    ENV = upper (var.env)
    owner = upper ("Naveen")
  }
}

/*resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket-name
  tags = {
    Name = var.bucket-name
  }
}*/

output "myawsserver-ip" {
  value = aws_instance.myawsserver.public_ip
}

output "myserver-PrivateIP" {
  value = aws_instance.myawsserver.private_ip
}
