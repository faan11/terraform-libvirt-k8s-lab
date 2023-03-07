#!/bin/bash
ansible-playbook -i node_hosts.yml -i ../keys/main  --extra-vars="hosts=cpnode" node_bootstrap.yaml --ask-become-pass
