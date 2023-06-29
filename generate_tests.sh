#!/usr/bin/env bash

set -eo pipefail

usage() { 
    echo "Usage: $0 [-a <Azure Version String>] [-t <Terraform Version String>]" 1>&2
    exit 1
}

while getopts ":a:t:" o; do
    case "${o}" in
        a)
            azure_cli_version=${OPTARG}
            ;;
        t)
            terraform_version=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${azure_cli_version}" ] || [ -z "${terraform_version}" ] ; then
    usage
fi

echo -n "Generating test configuration with AZURE_CLI_VERSION=${azure_cli_version} "
echo "and TERRAFORM_VERSION=${terraform_version}"

export TERRAFORM_VERSION=${terraform_version} && export AZURE_CLI_VERSION=${azure_cli_version}

for template_file in $(find tests -name "*.template.yaml" -type f); do
    echo "Generating ${template_file%.template}"
    envsubst '${AZURE_CLI_VERSION},${TERRAFORM_VERSION}' < "${template_file}" > "tests/test.yaml"
done

exit 0