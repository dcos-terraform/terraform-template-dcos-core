#!/bin/bash
set -euxo pipefail

terraform init
# Open DC/OS Check
for dir in ./open/dcos-versions/*
do
    version=${dir%*/}
    version=${version##*/}
    for dir2 in ./open/dcos-versions/${version}/*
    do
        role=${dir2%*/}
        role=${role##*/}
        terraform validate -var "dcos_type=open" -var "role=${role}" -var "dcos_version=${version}"
        terraform plan -var "dcos_type=open" -var "role=${role}" -var "dcos_version=${version}"
    done
done

# Enterprise DC/OS Check
for dir in ./ee/dcos-versions/*
do
    version=${dir%*/}
    version=${version##*/}
    for dir2 in ./ee/dcos-versions/${version}/*
    do
        role=${dir2%*/}
        role=${role##*/}
        terraform validate -var "dcos_type=ee" -var "role=${role}" -var "dcos_version=${version}"
        terraform plan -var "dcos_type=ee" -var "role=${role}" -var "dcos_version=${version}"
    done
done
