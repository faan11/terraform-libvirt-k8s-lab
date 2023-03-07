#!/bin/sh
k8sf=terraform/k8s/
ansf=ansible/
sshpukey="$PWD/keys/main.pub"
sshprkey="$PWD/keys/main"

if [ ! -r "$sshpukey" ] || [ ! -r "$sshprkey" ];
then
   echo "The ssh key does not exists"
   echo "Generate ssh key..."
   ssh-keygen -q -N "" -t ed25519 -C "main" -f "${sshprkey}"
fi
echo "Ssh key exists ${sshprkey}"
ch=$PWD
sshpukeyc=$(cat $sshpukey  | tr '\n' ' ')
echo "Pub key: $sshpukeyc"
echo "Nodes deploy"
read
echo "k8s install (kubectl,kubeadm,kubelet)"
cd $k8sf && terraform init && terraform plan -var="ssh-public-key=${sshpukeyc}" && read -p "Press enter to apply changes: "  && terraform apply -var="ssh-public-key=${sshpukeyc}"
echo "Nodes deployed"
read -p "Press enter to continue with ansible: "
# Current home
echo "Ansible deploy internal components (kubeadm and network)"
cd $ch
set -x
echo "Private key $sshprkey"
cd $ansf && ansible-playbook -i hosts --extra-vars="ansible_ssh_private_key_file=${sshprkey}" bootstrap.yaml 
cd $ch 
read
echo "Completed"

