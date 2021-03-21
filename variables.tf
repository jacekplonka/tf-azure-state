variable "resource_group_name" {
  description = "Name for your resource group to store the storage account in."
  type = string
  default = "tf-state-rg"
}

variable "storage_account_prefix" {
  description = "Prefix for your storage account."
  type = string
  default = "tfstate"
}

variable "container_name" {
  description = "Name for your storage container."
  type = string
  default = "state"
}

variable "location" {
  description = "Azure Region for your storage account."
  type = string
  default = "West Europe"
}

variable "environment" {
  description = "Sets the environment tag."
  type = string
  default = "dev"
}

variable "protected" {
  description = "Sets the protected tag. You can use it to prevent accidental deletion."
  type = string
  default = "true"
}

variable "state_id_seed" {
    description = "Change this value if you want to generate new state. Used to generate random name for storage account."
    type = number
    default = 1
}


locals {
  tags = {
    environment = var.environment,
    protected = "true"
  }
}
