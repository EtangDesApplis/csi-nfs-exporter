#!/bin/bash
#Source: https://www.tecmint.com/install-nfs-server-on-ubuntu/
NFS_DATA_FOLDER="/mnt/nfs_share"
WHITE_LIST_ACCESS="192.168.43.0/24"

#do not modify below
apt update
apt install -y nfs-kernel-server
mkdir -p $NFS_DATA_FOLDER
chown -R nobody:nogroup $NFS_DATA_FOLDER
chmod 777 $NFS_DATA_FOLDER
echo "$NFS_DATA_FOLDER  $WHITE_LIST_ACCESS(rw,sync,no_subtree_check)">>/etc/exports
exportfs -a
systemctl restart nfs-kernel-server
#ufw allow from $WHITE_LIST_ACCESS to any port nfs
#ufw enable

#recap
echo "NFS data folder: "$NFS_DATA_FOLDER
echo "Allowed IPs are: "$WHITE_LIST_ACCESS

