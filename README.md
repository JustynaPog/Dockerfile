# Repository Overview

This repository contains a Dockerfile designed to create a Docker image with a pre-configured environment based on Ubuntu 24.04. The image includes tools such as Ansible and Packer, which are commonly used for infrastructure automation and provisioning.

## Prerequisites

- Docker installed on your local machine.

## Building the Docker Image

 1.Clone this repository:
 
  `git clone <repository-url>`  

  `cd <repository-directory>`
- Build the Docker image

  `docker build -t ubuntu-ansible-packer .`

## Running the Container

  `docker run -it ubuntu-ansible-packer`  
## Use Cases
This image can be used for:
- Testing and developing Ansible playbooks.
- Automating image creation workflows with Packer.
- Creating a portable development or CI/CD environment.

