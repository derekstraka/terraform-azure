# Terraform and Azure CLI Docker image

[![Lint](https://github.com/derekstraka/terraform-azure/actions/workflows/lint.yaml/badge.svg?branch=main)](https://github.com/derekstraka/terraform-azure/actions/workflows/lint.yaml)
[![Build](https://github.com/derekstraka/terraform-azure/actions/workflows/build.yaml/badge.svg?branch=main)](https://github.com/derekstraka/terraform-azure/actions/workflows/build.yaml)
[![Publish](https://github.com/derekstraka/terraform-azure/actions/workflows/publish-latest.yaml/badge.svg?branch=main)](https://github.com/derekstraka/terraform-azure/actions/workflows/publish-latest.yaml)

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Docker Pulls](https://img.shields.io/docker/pulls/derekstraka/terraform-azure.svg)](https://hub.docker.com/r/derekstraka/terraform-azure/)

## Overview

The goal is to create a **lightweight** container image to deploy infrastructure as code (IaC) to the Azure cloud.  The container can be used for interactive development, CI/CD deployments, or as a base image to extend as needed.  It is based on the [HashiCorp Terraform](https://hub.docker.com/r/hashicorp/terraform/) container with the addition of python3 and the Azure CLI.

## What's inside?

* [Azure CLI](https://docs.microsoft.com/cli/azure/?view=azure-cli-latest)
* [Terraform CLI](https://www.terraform.io/docs/commands/index.html)
* [Python 3](https://www.python.org/)

## Supported versions

Actively supported versions can be found in the [`supported_versions.yaml`](https://github.com/derekstraka/terraform-azure/blob/main/supported_versions.yaml).  By default, the latest 3x versions of [Terraform](https://endoflife.date/terraform) and [Azure CLI](https://pypi.org/project/azure-cli/) will be periodically packaged and released

The following image tag strategy is leveraged for the container builds:

* `derekstraka/terraform-azure:latest` - build from main
  * Included CLI versions are the newest in the [`supported_versions.yaml`](https://github.com/derekstraka/terraform-azure/blob/main/supported_versions.yaml) file.
* `derekstraka/terraform-azure:vR.S.T_terraform-UU.VV.WW_azcli-XX.YY.ZZ` - build from releases
  * `vR.S.T` is the release tag
  * `terraform-UU.VV.WWW` is the included **Terraform CLI** version
  * `azcli-XX.YY.ZZ` is the included **Azure CLI** version

## Usage

### Launch the CLI

Simply launch the container and use the CLI as you would on any other platform, for instance using the latest image:

```bash
docker run -i -v $PWD:/data -w /data -t derekstraka/terraform-azure:latest
```

### Building an image

You can build the image locally directly from the Dockerfile using the TERRAFORM_VERSION and AZURE_CLI_VERSION build arguments to specificy the desired version of Terrafrom and Azure command line

```bash
docker build --build-arg TERRAFORM_VERSION=1.5.1 --build-arg AZURE_CLI_VERSION=2.48 .
```

## License

This project is under the [Apache License 2.0](https://github.com/derekstraka/terraform-azure/blob/main/LICENSE)
