# Terraform Azure Infrastructure Automation

## Overview

This repository contains Infrastructure as Code (IaC) solutions built using Terraform for provisioning and managing Microsoft Azure resources.

The project demonstrates enterprise-grade Azure infrastructure automation following Terraform best practices, including reusable modules, remote state management, environment segregation, and CI/CD integration with Azure DevOps.

The infrastructure supports scalable, secure, and production-ready Azure environments.

---
<img width="1536" height="1024" alt="terraform-design" src="https://github.com/user-attachments/assets/2d24243c-889a-41a7-acc8-30d0714c0890" />

## Technologies Used

- Terraform
- Microsoft Azure
- Azure DevOps
- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- Azure Virtual Network (VNet)
- Network Security Groups (NSG)
- Azure Application Gateway
- Azure Monitor
- Log Analytics Workspace
- Azure Storage Account
- Microsoft Entra ID

---

## Key Features

### Infrastructure as Code

- Automated Azure resource provisioning using Terraform
- Reusable Terraform modules
- Environment-specific deployments
- Version-controlled infrastructure

### Networking

- Virtual Networks (VNets)
- Subnets
- Network Security Groups (NSGs)
- Private Endpoints
- Application Gateway
- Web Application Firewall (WAF)

### Compute & Containers

- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- Virtual Machines

### Monitoring & Security

- Azure Monitor
- Log Analytics Workspace
- Application Insights
- RBAC
- PIM
- Conditional Access Policies

### CI/CD Integration

- Azure DevOps Pipelines
- YAML-based deployments
- Automated Terraform Plan & Apply workflows

---

# Architecture

```text
Users
   |
   v
Application Gateway + WAF
   |
   v
Virtual Network (VNet)
   |
   +--------------------------+
   |                          |
   v                          v
AKS Cluster              Azure VMs
   |                          |
   +------------+-------------+
                |
                v
Azure Container Registry (ACR)

                |
                v
Azure Storage Account
(Terraform Remote State)

                |
                v
Azure Monitor
      |
      v
Log Analytics Workspace
      |
      v
Alerts & Dashboards
```

---

# Repository Structure

```text
terraform/
│
├── modules/
│   ├── aks/
│   ├── acr/
│   ├── network/
│   ├── storage/
│   ├── appgateway/
│   └── monitoring/
│
├── dev/
├── qa/
├── prod/
│
├── providers.tf
├── variables.tf
├── outputs.tf
├── backend.tf
└── main.tf
```

---

# Azure Resources Provisioned

This Terraform solution can provision:

- Resource Groups
- Virtual Networks
- Subnets
- Network Security Groups
- Route Tables
- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- Storage Accounts
- Application Gateway
- Azure Monitor
- Log Analytics Workspace
- Private Endpoints
- Virtual Machines

---

# Remote State Management

Terraform state is stored securely in Azure Storage Account.

Features:

- Remote State Storage
- Team Collaboration
- State Locking
- Secure Backend Configuration

Example:

```hcl
terraform {
 backend "azurerm" {
   resource_group_name  = "terraform-rg"
   storage_account_name = "terraformstate"
   container_name       = "tfstate"
   key                  = "prod.terraform.tfstate"
 }
}
```

---

# Prerequisites

Before deployment ensure the following:

- Azure Subscription
- Terraform >= 1.5
- Azure CLI Installed
- Contributor Access on Subscription
- Azure DevOps Service Connection

---

# Deployment Steps

## Clone Repository

```bash
git clone https://github.com/sivaji1234git/terraform.git
cd terraform
```

## Initialize Terraform

```bash
terraform init
```

## Validate Configuration

```bash
terraform validate
```

## Generate Execution Plan

```bash
terraform plan
```

## Deploy Infrastructure

```bash
terraform apply
```

---

# CI/CD Pipeline Workflow

Azure DevOps Pipeline Stages:

1. Source Code Checkout
2. Terraform Init
3. Terraform Validate
4. Terraform Plan
5. Approval Gate
6. Terraform Apply
7. Post Deployment Validation

---

# Security Best Practices

Implemented security controls include:

- RBAC
- Private Endpoints
- NSG Rules
- WAF Protection
- Least Privilege Access
- Secure Terraform State Storage
- Environment Isolation

---

# Monitoring

Monitoring is implemented using:

- Azure Monitor
- Log Analytics Workspace
- Azure Alerts
- Application Insights

Key Metrics:

- CPU Utilization
- Memory Utilization
- Service Health
- Resource Availability
- Deployment Status

---

# Business Benefits

- Reduced manual provisioning effort by 80%
- Standardized infrastructure deployments
- Improved deployment consistency
- Faster environment provisioning
- Improved operational visibility
- Enhanced security posture

---

# Certification

Microsoft Certified: Azure Administrator Associate (AZ-104)

---

# Author

Sivaji P

Azure Cloud & DevOps Engineer

GitHub:
https://github.com/sivaji1234git
