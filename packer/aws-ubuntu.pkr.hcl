packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
    ansible = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/ansible"
    }
  }
}
variable "build_number" {
  default = env("BUILD_NUMBER")
}
source "amazon-ebs" "ubuntu_nginx" {
  ami_name      = "ubuntu-${var.build_number}"  

  instance_type = "t2.micro"
  region        = "ca-central-1"

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["#######"]
  }
  ssh_username = "ubuntu"
}
build {
  name    = "nginx-ami"
  sources = ["source.amazon-ebs.ubuntu_nginx"]
  provisioner "ansible" {

    playbook_file = "/workspace/docker/ansible/playbook.yml"
    
       
  }
}
