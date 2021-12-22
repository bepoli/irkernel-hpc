# IRkernel-HPC
Jupyter R kernel from a Singularity container!

Designed to run on a HPC/server without admin privileges.

## Requirements
- Singularity 3.x installed on the HPC or whatever is your jupyterhub server (tip: you can install it from [conda-forge](https://anaconda.org/conda-forge/singularity), [spack](http://spack.io/) or other rootless package managers).

## Usage

### Quick start
```bash
./irstart -k
```
This command will:
- create a singularity instance named **ir**
- install the R package IRkernel if not already installed) in your default user library (`~/R/`)
- install the R kernel for the current user (by default, in `~/.local/share/jupyter/kernels/ir/`)
- edit the `kernel.json` file in order to prepend `singularity exec instance://ir` to the R executable
table.

To customize the setup, run `./irstart -h` to check all available options, or manually inspect the file (it's a simple bash script).

## Why
Many HPC users probably manage IRkernel instances with conda environments. However, the R ecosystem is mostly developed in a debian-based environment, hence all the library dependencies for R packages will be found in the debian repository. It is usually possible to find the corresponding conda package, but in the long run this makes harder to  manage conda environments and will also create a lot of redundancy.

This solution is compatible with R environments managed with the [renv](https://rstudio.github.io/renv/articles/renv.html) package, or you can still manually define your project's library path.

## Troubleshooting
In any case, please open an issue if you have any trouble.
If the kernel is unable to start, the first thing to check is the kernel.json file in `~/.local/share/jupyter/kernels/ir/kernels.json`.

If you are unable to install an R package, open an issue so we can find the missing library and add it to the container. If you are able to fix it by yourself, feel free to open a pull request.
