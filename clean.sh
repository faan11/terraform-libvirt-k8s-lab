#!/bin/sh
k8sf=terraform/k8s/
ansf=ansible/
sshpukey="$PWD/keys/main.pub"
sshprkey="$PWD/keys/main"
ch=$PWD
cd $k8sf && terraform destroy && cd $ch  


