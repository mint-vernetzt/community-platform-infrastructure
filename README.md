# Community Platform Infrastructure

## Prerequisite

### Terraform
    
[Install Instructions](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform)

### Ansible

[Install Instructions (using pip)](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#id15)

## Instructions

- create `terraform/terraform.tfvars` (from `terraform/terraform.tfvars.dist`) and set API Token
- create `ansible/vars/main.yml` (from `ansible/vars/main.yml.dist`) and set API Token, email for Let's Encrypt, network name for docker and domain
- create `ansible/inventory/digitaloceanmain.yml` (from `ansible/inventory/digitalocean.yml.dist`) and set API Token
- add applications `.env` to `ansible/playbooks/roles/community/files/`

**IMPORTANT**: if infrastructure still exist get `terraform.tfstate` from the machine previously applied the terraform configuration and paste it to the `terraform/` folder

## Commands

### Terraform

`terraform apply` - Create infrastructure or apply changes

### Ansible

`ansible-playbook -i inventory/digitalocean.yml playbooks/site.yml -u root` - Run playbooks on hosts