#!/bin/bash
terraform -chdir=infra init
terraform -chdir=infra apply -var-file=infra/env/dev.tfvars
