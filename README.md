# IRkernel-HPC
This will create a singularity instance that can be used to open as many
[IRkernel](https://github.com/IRkernel/IRkernel) notebooks as you want, without
cluttering your `/tmp` directory.

The image is not writable, because R packages are intended to be installed in a
library external to the container (defaults to `$HOME/R/`, can be manually
defined).

The script `setup.sh` will start the Singularity instance and edit the
kernel.json file in `~/.local/share/jupyter/kernels/ir/kernels.json` to
append `Singularity exec instance` to the R executable.

## Requirements
- Singularity 3.x installed on the Jupyterhub server

## Usage
Build the Singularity image and move it to your server/HPC.
On the server, check the content of `setup.sh`, execute it,
then open an `ir` notebook from your Jupyterhub server.

## Troubleshooting
If the kernel is unable to start, the first thing to check is the kernel.json
file in `~/.local/share/jupyter/kernels/ir/kernels.json`, since probably the
`setup.sh` script didn't edit it correctly. If this is the case, please open
an issue so I can fix it (or open a pull request).
