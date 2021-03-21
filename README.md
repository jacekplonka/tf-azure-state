# Terraform remote state on Azure

## What is it?

Quick snippet to create remote state on Azure for your Terraform project.

## Getting started

### Prerequisites

* Azure account with rights to create Resource Group, Storage Account and Storage Container.
* Configured authentication with Azure on your machine, which is compatible with Terraform e.g. Azure CLI.

### Usage

1. Clone the repo to your project. For example, create new directory  called state in it:

```bash
$ git clone https://github.com/jacekplonka/tf-azure-state state
```

2. Initialize the Terraform.

```bash
$ terraform init
```

3. Plan & Apply:

```bash
$ terraform plan
$ terraform apply
```

4. Create environment variable named ARM_ACCESS_KEY with the value of account_access_key output.

```bash
export ARM_ACCESS_KEY=account_access_key
```

5. Setup terraform backend in your other resources using the output from previous command:

```terraform
terraform {
  backend "azurerm" {
    resource_group_name   = "tf-state-rg"
    storage_account_name  = "tfstateYOUR_ID"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
```

6. Done. Your new remote state is ready to use.

#### Available variables
**resource_group_name**: Name for your resource group to store the storage account in.
*default = tf-state-rg*

**storage_account_prefix**: Prefix for your storage account.
*default = tfstate*

**container_name**: Name for your storage container.
*default = state*

**location**: Azure Region for your storage account.
*default = West Europe*

**environment**: Sets the environment tag.
*default = dev*

**protected**: Sets the protected tag. You can use it to prevent accidental deletion.
*default = true*

**state_id_seed**: Change this value if you want to generate a new state. Used to generate random name for storage account.
*default = 1*

##### Usage example

```bash
terraform apply -var="resource_group_name=tf-state-rg" -var="storage_account_prefix=tfstate" -var="container_name=state" -var="location=westeurope" -var="environment=dev" -var="protected=true" -var="state_id_seed=1"
```

## Remarks

All resources are created with the following tags:

    environment: var.environment # "dev" by default
    protected: var.protected # "true" by default



