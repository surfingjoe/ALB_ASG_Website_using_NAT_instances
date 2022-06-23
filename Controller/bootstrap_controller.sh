#!/bin/bash
sudo yum -y update
# Install AWS EFS Utilities
yum install -y amazon-efs-utils
# Mount EFS
mkdir /efs
efs_id   = "${data.terraform_remote_state.vpc.outputs.my_efs.id}"
mount -t efs $efs_id:/ /efs
# Edit fstab so EFS automatically loads on reboot
echo $efs_id:/ /efs efs defaults,_netdev 0 0 >> /etc/fstab
hostnamectl set-hostname Controller
sudo yum install -y ansible
