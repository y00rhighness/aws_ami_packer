variable "ami_id" {
  type    = string
  default = "ami-03d5c68bab01f3496"
}

variable "ssh-user" {
  type    = string
  default = "ubuntu"
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "ec2_size" {
  type    = string
  default = "t2.micro"
}

variable "environment" {
  type    = string
  default = "DEMO"
}

variable "app_name" {
  type    = string
  default = "jenkins"
}

locals {
    app_name = "jenkins"
}

source "amazon-ebs" "jenkins" {
  ami_name      = "PACKER-DEMO-${local.app_name}"
  instance_type = "${var.ec2_size}"
  region        = "${var.region}"
  source_ami    = "${var.ami_id}"
  ssh_username  = "${var.ssh-user}"
  tags = {
    Env  = "${var.environment}"
    Name = "PACKER-${var.environment}-${var.app_name}"
  }
}

build {
  sources = ["source.amazon-ebs.jenkins"]

  provisioner "shell" {
    script = "script/script.sh"
  }

  post-processor "shell-local" {
    inline = ["echo Finished-with-Jenkins"]
  }
}
