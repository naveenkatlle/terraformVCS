variable "image" {
  type = string
  default = "ami-02f3416038bdb17fb"
}

variable "hw" {
  default = "t2.micro"
}

variable "name" {
  default = "gagan-manual-tf"
}

variable "env" {
  default = "prod"
}

variable "bucket-name" {
  default = "gagandefaultbucket"
}

resource "aws_instance" "myawsserver" {
  ami = var.image
  instance_type = var.hw
  key_name = "gagan-new"
  tags = {
    Name = lower (var.name)
    env = upper (var.env)
    owner = upper ("Gagandeep")
    dept = "eng"
    client = "jpmc"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket-name

  tags = {
    Name        = var.bucket-name
    Environment = var.env
    owner = "Gagandeep"
    
  }
}

output "public-ip" {
  value = aws_instance.myawsserver.public_ip
}

output "private-ip" {
  value = aws_instance.myawsserver.private_ip
}