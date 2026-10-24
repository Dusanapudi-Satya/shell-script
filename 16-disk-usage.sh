#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
# 1. Check if the disk has data or a filesystem
sudo file -s /dev/nvme1n1

# 2. Format the disk with XFS
sudo mkfs -t xfs /dev/nvme1n1

# 3. Create a directory to use as a mount point (e.g., /data)
sudo mkdir -p /data

# 4. Mount the volume
sudo mount /dev/nvme1n1 /data

# 5. Verify it is mounted

DISK_USAGE=$(df -hT | grep -vE 'tmp|vfat|mapper|File|varfs|nvme0')
DISK_THRESHOLD=1
message=""
while IFS= read line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1 )
    partition=$(echo $line | awk '{print $1F}')
    if [ $usage -ge $DISK_THRESHOLD ]
    then
    
    message+="High Disk usage on $partition: $usage"

    fi
done <<< $DISK_USAGE

echo "Message: $message"