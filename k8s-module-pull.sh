#!/bin/bash

images=(
    kube-apiserver:v1.19.1
    kube-controller-manager:v1.19.1
    kube-scheduler:v1.19.1
    kube-proxy:v1.19.1
    pause:3.2
    etcd:3.4.13-0
    coredns:1.7.0
)

for imageName in ${images[@]} ; do
    docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
    docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName k8s.gcr.io/$imageName
done
