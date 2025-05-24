# Azure Bicep Deployment Templates

This repository contains cleaned and structured Bicep infrastructure-as-code (IaC) templates for deploying Azure resources.

## Contents

- `cleaned-deployment.bicep` – Main Bicep template with parameters and modular structure.

## Usage

To deploy:

```bash
az deployment group create -g <your-resource-group> -f cleaned-deployment.bicep
```

## Prerequisites

- Azure CLI
- Bicep CLI (`az bicep install`)
- Azure Subscription & Resource Group

## Notes

This is a cleaned version of a full enterprise-scale deployment template including:

- Storage accounts
- App Services
- Container Registries
- Application Insights & Smart Detection
- Virtual Networks

Feel free to fork and adapt to your infrastructure needs.
