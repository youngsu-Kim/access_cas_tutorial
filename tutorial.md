# SageMath and Macaulay2 on ACCESS

## Motivation

Computer algebra software (CAS) has become an indispensable tool in several areas of research and can be used to enhance the quality of teaching. Often, it provides computational evidence that leads to finding patterns or for students, it provides another way of getting into mathematics. There is a collection of CAS such as CoCoa, Macaulay2, Magma, SageMath, Singular to name a few. They are easy to install on a personal or Apple computer. However, due to the computation intensity, researchers often face limitations of memory, storage, or computing power. 

In the past two decades, there have been significant developments in computing resources, and several NSF awards have focused on expanding computing resources for academic research and education. 
Due to the complexity of getting into the server system or supercomputing platforms, these cutting-edge resources have not been fully utilized by the mathematics community. 
The primary goal of this tutorial is to present a streamlined procedure and demonstrate how to effectively use and monitor resources for SageMath and Macaulay2 on ACCESS. 

The tutorial will be particularly useful for those who do not have on-campus computing resources or run a summary program utilizing SageMath or Macaulay2 as the resources in this tutorial (ACCESS) are available for academic purposes at no cost. For questions, comments, or suggestions, please contact Youngsu Kim at youngsu.kim@csusb.edu. 

## Acknowledgments

Rewrite this.
This project started as part of the NSF-funded, #2230127,  cyberinfrastructure professional training led by Dr. Mary Thomas at the San Diego Supercomputing Center. The author participated as a trainee in 2023 as a high-performance faculty fellow at California State University San Bernardino.

In addition to the PI, Dr. Thomas, the author appreciates the help and support from the mentors, especially, Dr. Rick Wagner and Dr. Bob Sinkovits. 

## Structure of the Tutorial and Timeline 

> When finished add a short description of the content and timeline####

## Allocations

This tutorial focuses on ACCESS and assumes that one has allocations on ACCESS. To request allocations on ACCESS (it is free and the process is simple), please, visit this [page](https://allocations.access-ci.org/prepare-requests-overview#comparison-table) for details. Once you have allocations, it is time to choose the supercomputing center(s) for your project.

On ACCESS, one submits an exchange request to use allocations on a supercomputing center. Here, we assume two scenarios:

1. Project requiring large memory
2. Project requiring many CPUs (cores)

Large Memory Nodes:

ACCESS provides a large-memory filter on its [webpage](https://allocations.access-ci.org/resources).  
As of today (####write date here####), these are the search results. 

|Node Name|Memory Size|
|--|--|
Indiana Jetstream2 Large Memory | 1TB
Kentucky Research Informatics Cloud (KyRIC) Large Memory Nodes | 3TB
NCSA Delta GPU (Delta GPU) | NA*
PSC Bridges-2 Extreme Memory (Bridges-2) | 4TB
Purdue Anvil CPU | 1TB
SDSC Expanse CPU | [2TB](https://www.sdsc.edu/support/user_guides/expanse.html#charging)

\* NCSA Delta GPU (Delta GPU) is for GPU, and it often requires more allocation credits. So, we exclude this in this tutorial.

### Converting ACCESS allocations to Computing center hours 

To use ACCESS resources, one converts allocation credit to resource hours. The rate is determined by each supercomputing center. Often, they are in the unit of SU (service unit), and one SU corresponds to one CPU (core) hour. 

**Warning:** One will be charged by the resources one requests not by the portion of resources one utilizes. For instance, let's say one asks for 4 CPUs, but ends up using only 2. Then one is still charged for the SUs for the 4 CPUs. It is important to monitor resource usage and we discuss it in this tutorial, in Section <link to resource monior section>

> #### Add link to the sectionxxxx.

> Generally, memory requests are done via CPU requests. Consider the PSC Bridges-2 node. 
> Update this part (Bob's comment). 

## Indiana Jetstream2

Indiana Jetstream2 is unique as it provides full desktop-like environments. Several supercomputing centers offer only a portal and/or SSH access. Since it is most close to the PC or Mac environment, we cover this first. 

> Add screenshots

Navigate to Instance sources -> Choose an Instance Source -> Select an image, e.g., Ubuntu 22.04 (Latest).

You may choose the web desktop option by clicking on "Yes" for "Enable web desktop." Or you may use the SSH or Web Shell. Once it finishes building your environment, use any method of your choice to access the server.

> Note: #### Add how to find the address for SSH ####

#### SageMath on Jetstream2

Jetstream2 gives full access to the system and users can use the `sudo` command. For the installation of SageMath, we follow the official instructions on [here](https://doc.sagemath.org/html/en/installation/conda.html). The script below installs Mini-forge (and automatically agrees to their License Agreement) SageMath. 

``` shell
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
sh Miniforge3-Linux-x86_64.sh -bp ~/.conda
PATH=~/miniforge3/bin:$PATH
mamba install sage python --yes
```

Note: You may need to use `conda` if `mamba` is not available. But `mamba` will execute the installation command much faster than `conda`.

To use SageMath, one needs to activate the conda (mamba) environment. This requires logging out and logging in.

``` shell
conda init
exit
```

Reconnect and type sage to use it: 
> Add screenshots 

``` shell
sage
```

To use Jetstream2 as a remote JupterLab/Note server for SageMath, please follow the additional instructions here. 

``` shell
mamba install jupyterlab --yes
jupyter notebook --generate-config
echo "c.NotebookApp.ip = '0.0.0.0'" >> .jupyter/jupyter_notebook_config.py
```

Note: This provides a non-secure connection. Follow the additional instructions if you deal with sensitive data. 
> Add info about secure connection setting.

https://docs.jetstream-cloud.org/ui/exo/troubleshooting/#i-cant-copy-and-paste-tofrom-the-web-shell-or-web-desktop-guacamole

https://stackoverflow.com/questions/45421163/anaconda-vs-miniconda

#### Macaulay2 on Jetstream2

One can install Macaulay2 in Ubuntu 22.04 with `apt` as explained on the Macaulay2 [webpage](https://macaulay2.com/Downloads/GNU-Linux/Ubuntu/index.html). The following commands install and start Macaulay2. 

``` shell
sudo apt install macaulay2 --yes
M2
```

#### To-do

> Add how to check the resources while running

## Expanse at the San Diego Supercomputing Center

Expanse provides a Linux shell to which one can SSH. One does *not* have the admin privilege on Expanse. We can `load` the Anaconda environment to install SageMath. However, Singularity containers provide a quick and easy way of running the software. For JupyterLab, we will use Expanses' `Galyleo` environment.  

Singularity uses a container file which is similar to a Docker container. One can create and load Docker containers in Singularity, but the conversion takes time and often produces several warnings. Building a Singularity container from its definition file is a more streamlined approach and here we include the definition files written by the author. 

``` 
Add singularity definition files of SageMath
```

``` 
Add singularity definition files of Macaulay2
```

They are also available from the author's Sylabs account. To download these files, first the `singularitypro` module 

> Consider using a different hosting service

``` shell
module load singularitypro
```

and run the following commands

``` shell
singularity pull --arch amd64 library://youngsu-kim/cas/sage:latest # for SageMath 
singularity pull --arch amd64 library://youngsu-kim/cas/macaulay2_ubuntu:latest # for Macaulay2
```

You only download them once, and it takes around 2 minutes on Expanse. Now, run them by loading these images with Singularity.

``` shell
$ ls -alth *.sif
-rwxr-xr-x 1 youngsukim sds173 411M Nov 19 20:19 macaulay2_ubuntu_latest.sif
-rwxr-xr-x 1 youngsukim sds173 2.1G Nov 19 20:19 sage_latest.sif
```

```
singularity shell # for SageMath
```

> Note: Be sure to run them on a compute node other than the login nodes. 
> Running a heavy task on a login node will affect the system and other users negatively.

### JupyterLab on Expanse

``` shell
export PATH="/cm/shared/apps/sdsc/galyleo:${PATH}"
galyleo launch --account css101 --partition debug --cpus 2 --memory 4 --time-limit 00:30:00 --conda-env sage_jupyter --conda-yml env_sage.yml --mamba
```

`env_sage.yml` file

``` yml
name: sage_jupyter
 
channels:
  - conda-forge
  - anaconda

dependencies:
  - python
  - jupyterlab
  - ipywidgets
  - sage
```

Source https://education.sdsc.edu/training/interactive/202206_ciml_si22/section1_3/quickstart-jupyter-notebooks.pdf

#### SageMath with Anaconda 

It is similar to the one for Jetstream2, but here we need to use `conda` instead of `mamba`. Generally, `mamba` works much faster than `conda`. This installation needs to be done once.

First, load the `anaconda3` module on Expanse:

``` shell
module load cpu/0.15.4
module load anaconda3/2020.11
```

Create and install SageMath in your home folder. The following command installs SageMath in `<user_home_directory>/.conda/sage`. With Conda, it may take a few minutes, but only needs to be done once.

``` shell
conda create --prefix ~/.conda/sage -c conda-forge sage python
```

To use SageMath, one needs to activate the conda environment. 

``` shell 
conda activate sage
sage
```

##### Uninstall SageMath installed with Conda

It is simple to remove the environment. ...

``` shell
conda env remove sage
```

## Todo 
- Add examples
- Add monitoring
- Check out other supercomputing centers
Ask Bob to make it available to ask for ACCESS allocation for testing purposes (Do I need to inform Alana?)
- Ask Bob if possible to make a group allocation on Expanse