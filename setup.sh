#!/bin/bash

# Run this on your local machine with admin privileges:
#   sudo singularity build ir_4.1.2.sif Singularity

# Run the following on the HPC with a working Singularity installation
#   (installed by admin or by user's package manager, such as conda).

sif=$1 # Singularity image file path
name='ir' # name for the singularity istance

singularity instance start \
  --bind /mnt/home,/run/shm,/mnt/data,/mnt/projects,/mnt/genomes \
  $sif \
  $name

singularity exec instance://$name /usr/lib/R/bin/R --vanilla <<code
if(!'IRkernel' %in% installed.packages()) install.packages('IRkernel')
IRkernel::installspec(name = "$name", displayname = "$name")
code

sed -i "s|\[\"/usr/lib/R/bin/R\"|[\"$(which singularity)\", \"exec\", \"instance://${name}\", \"/usr/lib/R/bin/R\"|" $HOME/.local/share/jupyter/kernels/$name/kernel.json
