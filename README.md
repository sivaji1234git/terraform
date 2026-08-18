# Terraform Azure Infrastructure Automation

## Overview

This repository contains a hands-on Infrastructure as Code (IaC) project using **Terraform to provision and manage Microsoft Azure infrastructure**.

The project demonstrates production-oriented Terraform practices including:

* Reusable Terraform modules
* Azure infrastructure automation
* Remote Terraform state using Azure Storage
* Azure networking and security components
* AKS and container infrastructure
* Azure DevOps CI/CD integration
* Version-controlled infrastructure configuration

The repository is maintained as a technical portfolio project to demonstrate practical **Azure, Terraform and DevOps engineering capabilities**.

---

## Technologies Used

* **Terraform**
* **Microsoft Azure**
* **Azure DevOps**
* **Azure Kubernetes Service (AKS)**
* **Azure Container Registry (ACR)**
* **Azure Virtual Network (VNet)**
* **Network Security Groups (NSG)**
* **Azure Application Gateway**
* **Web Application Firewall (WAF)**
* **Azure Storage**
* **Azure Key Vault**
* **Azure Monitor**
* **Log Analytics**
* **Application Insights**
* **Microsoft Entra ID**
* **Azure RBAC**
* **Git / GitHub**
* **YAML Pipelines**

---

## Key Features

### Infrastructure as Code

* Automated Azure infrastructure provisioning using Terraform
* Reusable Terraform modules
* Variable-driven infrastructure configuration
* Version-controlled infrastructure code
* Consistent infrastructure deployment through automation

### Azure Networking

* Virtual Networks
* Subnets
* Network Security Groups
* Route Tables
* Private Endpoints
* Application Gateway
* Web Application Firewall

### Compute & Containers

* Azure Virtual Machines
* Azure Kubernetes Service (AKS)
* Azure Container Registry (ACR)
* Container-based workload deployment

### Security

* Microsoft Entra ID
* Azure RBAC
* Privileged Identity Management (PIM)
* Conditional Access
* Network Security Groups
* Private Endpoints
* Web Application Firewall
* Secure handling of sensitive configuration values

### Monitoring

* Azure Monitor
* Log Analytics Workspace
* Application Insights
* Azure Alerts
* Infrastructure and application monitoring

---

# Architecture

```text
                         Users / Clients
                               |
                               v
                  +-------------------------+
                  | Azure Application       |
                  | Gateway + WAF            |
                  +------------+------------+
                               |
                               v
                    +----------------------+
                    | Azure Virtual        |
                    | Network (VNet)       |
                    +----------+-----------+
                               |
              +----------------+----------------+
              |                                 |
              v                                 v
      +---------------+                  +---------------+
      | AKS Cluster   |                  | Azure VMs     |
      +-------+-------+                  +---------------+
              |
              v
      +---------------+
      | Azure         |
      | Container     |
      | Registry      |
      +---------------+

              Azure Infrastructure
                       |
                       v
              +-------------------+
              | Azure Storage     |
              | Terraform State   |
              +-------------------+
                       |
                       v
              +-------------------+
              | Azure Monitor /   |
              | Log Analytics     |
              +-------------------+
                       |
                       v
              Monitoring & Alerts
```

---

# Repository Structure

The current repository uses a root Terraform configuration with reusable modules.

```text
terraform/
│
├── Modules/
│   ├── Azure VNet
│   ├── Azure NSG
│   ├── Azure Private Endpoint
│   ├── Azure VM
│   ├── Azure VMSS
│   ├── Azure SQL Database
│   ├── Azure Storage
│   ├── Azure Key Vault
│   ├── Azure AKS
│   ├── Azure ACR
│   ├── Application Gateway
│   ├── WAF
│   ├── Route Table
│   ├── Azure Firewall
│   └── Monitoring components
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── azure-pipelines.yml
├── .gitignore
└── README.md
```

> The module list represents the reusable Azure infrastructure components maintained in this project.

---

# Azure Resources

The Terraform modules in this project cover Azure services including:

* Resource Groups
* Virtual Networks
* Subnets
* Network Security Groups
* Route Tables
* Azure Kubernetes Service
* Azure Container Registry
* Storage Accounts
* Application Gateway
* Web Application Firewall
* Private Endpoints
* Virtual Machines
* Virtual Machine Scale Sets
* Azure SQL Database
* Key Vault
* Azure Monitor
* Log Analytics
* Azure Firewall

---

# Terraform Remote State

The project demonstrates using **Azure Storage Account as the Terraform remote backend**.

Remote state provides:

* Centralized Terraform state management
* Team collaboration
* State locking
* Consistent infrastructure management
* Separation of Terraform configuration from local state

Example backend configuration:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "terraformstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
```

> Backend values shown above are examples. Actual credentials and sensitive configuration values are not stored in the repository.

---

# Security and Secrets Management

Sensitive credentials should **never be hardcoded in Terraform source code or committed to Git**.

The recommended approach for this project is:

```text
Azure Key Vault / Azure DevOps Secret Variables
                    |
                    v
             TF_VAR_* variables
                    |
                    v
                Terraform
                    |
                    v
             Azure Resources
```

Sensitive Terraform variables should be declared using:

```hcl
variable "vm_admin_password" {
  description = "Administrator password for the virtual machine"
  type        = string
  sensitive   = true
}
```

Sensitive `.tfvars` files should not be committed to the repository.

---

# Azure DevOps CI/CD

The project includes an Azure DevOps YAML pipeline for Terraform automation.

The intended workflow is:

```text
Developer
    |
    v
Git / GitHub
    |
    v
Azure DevOps Pipeline
    |
    +--> Terraform Init
    |
    +--> Terraform Format Check
    |
    +--> Terraform Validate
    |
    +--> Terraform Plan
    |
    +--> Terraform Apply
    |
    v
Azure Infrastructure
```

The pipeline can be extended with additional controls such as:

* Security scanning
* Manual approval
* Terraform plan artifact
* Environment-specific deployment
* Post-deployment validation

---

# Terraform Workflow

## 1. Clone the repository

```bash
git clone https://github.com/sivaji1234git/terraform.git
cd terraform
```

## 2. Authenticate to Azure

```bash
az login
```

Select the required subscription:

```bash
az account set --subscription "<SUBSCRIPTION_ID>"
```

## 3. Initialize Terraform

```bash
terraform init
```

## 4. Format Terraform configuration

```bash
terraform fmt -recursive
```

## 5. Validate configuration

```bash
terraform validate
```

## 6. Review execution plan

```bash
terraform plan
```

## 7. Apply infrastructure

```bash
terraform apply
```

Review the Terraform plan carefully before applying infrastructure changes.

---

# Recommended CI/CD Quality Gates

For production-oriented usage, the pipeline can implement the following controls:

```text
Terraform Code
      |
      v
terraform fmt
      |
      v
terraform validate
      |
      v
Security Scan
(Checkov / tfsec)
      |
      v
terraform plan
      |
      v
Approval
      |
      v
terraform apply
      |
      v
Post-Deployment Validation
```

---

# Infrastructure Modules

The project follows a modular Terraform approach.

Each Azure service is implemented as a reusable module where appropriate.

Examples include:

* Networking
* NSG
* VM
* VMSS
* AKS
* ACR
* Storage
* SQL Database
* Key Vault
* Application Gateway
* WAF
* Private Endpoint
* Route Table
* Azure Firewall
* Monitoring

This approach helps reduce duplication and improves infrastructure maintainability.

---

# Engineering Practices Demonstrated

This project demonstrates practical knowledge of:

* Infrastructure as Code
* Terraform modules
* Terraform variables
* Terraform remote state
* Azure Storage backend
* Azure infrastructure provisioning
* Azure networking
* Azure security
* AKS
* ACR
* Application Gateway
* WAF
* Private Endpoints
* Azure Monitor
* Log Analytics
* Azure DevOps YAML pipelines
* CI/CD automation
* Git/GitHub
* Infrastructure validation
* Secure secret handling

---

# Production-Oriented Improvements

The repository can be further extended with:

* Separate DEV, QA and PROD environment directories
* Environment-specific Terraform state
* Azure Key Vault integration
* Terraform security scanning
* Manual approval gates
* Terraform plan artifacts
* Post-deployment validation
* Policy as Code
* Azure Policy integration
* Remote state security hardening
* CI pull-request validation
* Automated dependency updates

These improvements can be introduced incrementally as the infrastructure platform evolves.

---

# Business Benefits

Terraform automation provides:

* Reduced manual infrastructure provisioning
* Consistent infrastructure deployments
* Repeatable infrastructure changes
* Version-controlled infrastructure
* Improved deployment consistency
* Faster environment provisioning
* Better infrastructure visibility
* Improved operational reliability

---

# Certification

**Microsoft Certified: Azure Administrator Associate (AZ-104)**

---

# Author

**Sivaji Pallem**

Azure DevOps / Cloud Engineer

GitHub: https://github.com/sivaji1234git

---

## Disclaimer

This repository is a **hands-on technical portfolio project** demonstrating Azure Infrastructure as Code, Terraform modularization and Azure DevOps automation patterns.

It is intended for learning, demonstration and interview purposes. Production deployments should be adapted to the organization's security, networking, governance, compliance and operational requirements.
