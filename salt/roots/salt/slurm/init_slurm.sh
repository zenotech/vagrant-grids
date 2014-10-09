#!/bin/bash
#
# Initialize and configure SLURM

# Configure network

echo "10.0.0.2    slurmmaster" >> /etc/hosts
echo "10.0.0.3    slurmnode1" >> /etc/hosts

# create MUNGE key
# /usr/sbin/create-munge-key

/etc/init.d/munge start

if [ "$HOSTNAME" = slurmmaster ]; then
    /usr/sbin/slurmctld -D &
else
    /etc/init.d/slurm-llnl start
fi


