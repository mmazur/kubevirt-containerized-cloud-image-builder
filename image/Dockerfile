FROM docker.io/kubevirt/container-disk-v1alpha

LABEL maintainer="The KubeVirt Project <kubevirt-dev@googlegroups.com>"

ARG OS_NAME="fedora"
ARG OS_VER="OS_VER_ARG_MISSING_ARGH!"
ARG IMG_NAME="Fedora-Cloud-Base-30-1.2.x86_64.qcow2"

RUN curl -g -L https://download.fedoraproject.org/pub/fedora/linux/releases/$OS_VER/Cloud/x86_64/images/$IMG_NAME > /disk/fedora.qcow2
