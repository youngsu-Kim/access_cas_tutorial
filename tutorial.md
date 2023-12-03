# SageMath and Macaulay2 on ACCESS

## Introduction

Computer algebra software (CAS) has become an indispensable tool in several areas of research and can be used to enhance the quality of teaching. Often, it provides computational evidence that leads to finding patterns, or for students, it provides another way of getting into mathematics. There is a collection of CAS such as CoCoa, Macaulay2, Magma, SageMath, and Singular to name a few. They are easy to install on a personal or Apple computer. However, due to the computation intensity, researchers often face limitations of memory, storage, or computing power. 

In the past two decades, there have been significant developments in computing resources, and several NSF awards have focused on expanding computing resources for academic research and education. 
Due to the complexity of getting into the server system or supercomputing platforms, these cutting-edge resources have not been fully utilized by the mathematics community. 
The primary goal of this tutorial is to present a streamlined procedure and demonstrate how to effectively use and monitor resources for SageMath and Macaulay2 on ACCESS. 

The tutorial will be particularly useful for those who do not have on-campus computing resources or run a summary program utilizing SageMath or Macaulay2, as the resources in this tutorial (ACCESS) are available for academic purposes at no cost. For questions, comments, or suggestions, please contact Youngsu Kim at youngsu.kim@csusb.edu. 

## Acknowledgments

This project started as part of the NSF-funded (#2230127) cyberinfrastructure professional training led by Dr. Mary Thomas at the San Diego Supercomputing Center. The author participated as a trainee for the year 2023 and has been serving as a high-performance faculty fellow at California State University San Bernardino. In addition to the PI, Dr. Thomas, the author appreciates the help and support from the mentors, especially Dr. Rick Wagner and Dr. Bob Sinkovits. 

## Content

- [Introduction](#introduction)
- [Acknowledgments](#acknowledgments)
- [Structure of the Tutorial and Timeline](#structure-of-the-tutorial-and-timeline)
- [ACCESS Allocations](#access-allocations)
  - [Large Memory Nodes on ACCESS](#large-memory-nodes-on-access)
  - [Note on exchange requests and computing center hours](#note-on-exchange-requests-and-computing-center-hours)
- [IU Jetstream2](#iu-jetstream2)
  - [SageMath on IU Jetstream2](#sagemath-on-iu-jetstream2)
  - [JupyterLab on IU Jetstream2](#jupyterlab-on-iu-jetstream2)
  - [Macaulay2 on IU Jetstream2](#macaulay2-on-iu-jetstream2)
  - [Monitoring resources on IU Jetstream2](#monitoring-resources-on-iu-jetstream2)
- [SDSC Expanse](#sdsc-expanse)
- [SageMath and Macaulay2 on SDSC Expanse](#sagemath-and-macaulay2-on-sdsc-expanse)
  - [JupyterLab on SDSC Expanse](#jupyterlab-on-sdsc-expanse)
  - [Monitoring resources on SDSC Expanse](#monitoring-resources-on-sdsc-expanse)
  - [SageMath with Anaconda on SDSC Expanse](#sagemath-with-anaconda-on-sdsc-expanse)
  - [Singularity Container Definitions](#singularity-container-definitions)
    - [Macaulay2](#macaulay2)
    - [SageMath](#sagemath)
- [Todo](#todo)

## ACCESS Allocations

This tutorial focuses on [ACCESS](https://allocations.access-ci.org) and assumes that one has allocations on ACCESS. To request allocations on ACCESS (it is free, and the process is simple), please visit this [page](https://allocations.access-ci.org/prepare-requests-overview#comparison-table) for details. Once you have allocations, it is time to choose the supercomputing center(s) for your project.

On ACCESS, one submits an exchange request to use a supercomputing center. Here, we assume two scenarios:

1. Project requiring large memory
2. Project requiring many CPUs (cores)

### Large Memory Nodes on ACCESS

ACCESS provides a large-memory filter on its [webpage](https://allocations.access-ci.org/resources). As of 12/3/2023, these are the search results. 

|Node Name|Memory Size|
|--|--|
Indiana Jetstream2 Large Memory | 1TB
Kentucky Research Informatics Cloud (KyRIC) Large Memory Nodes | 3TB
NCSA Delta GPU (Delta GPU) | NA*
PSC Bridges-2 Extreme Memory (Bridges-2) | 4TB
Purdue Anvil CPU | 1TB
SDSC Expanse CPU | [2TB](https://www.sdsc.edu/support/user_guides/expanse.html#charging)

\* NCSA Delta GPU (Delta GPU) is for GPU, and such a node often requires more allocation credits. So, we exclude this in this tutorial.

### Note on exchange requests and computing center hours 

To use ACCESS resources, one converts allocation credit to resource hours. The rate is determined by each supercomputing center. Often, they are in the unit of SU (service unit), and one SU corresponds to one CPU (core) hour. See the official page [here](https://allocations.access-ci.org/manage-allocations-overview#exchanges-and-transfers) and their [exchange calculator](https://allocations.access-ci.org/exchange_calculator).

**Warning:** One will be charged by the resources one requests, not by the portion of resources one utilizes. For instance, let's say one asks for 4 CPUs but ends up using only 2. Then, one is still charged for the SUs for the 4 CPUs. It is important to monitor resource usage, and we discuss it in this tutorial, in Section <link to resource monitor section>

<!-- > Generally, memory requests are done via CPU requests. Consider the PSC Bridges-2 node.  -->
<!-- > Update this part (Bob's comment).  -->

## IU Jetstream2

Indiana University Jetstream2 is unique as it provides full virtual machine environments with admin privileges. Several supercomputing centers offer only a portal and/or SSH access. Since it is most close to the PC or Mac environment, we cover this first. 

Navigate to Instance sources -> Choose an Instance Source -> Select an image, e.g., Ubuntu 22.04 (Latest).

<details>
<summary> Click for screenshots
<p float="center">
  <img src="./images/indiana_jetstream2_sage/1-create_instance.png" width="30%" />    
  <img src="./images/indiana_jetstream2_sage/2-choose_ubuntu.png" width="30%" />    
  <img src="./images/indiana_jetstream2_sage/3-click_on_start.png" width="30%" />
</p>
</summary>
</details>

You may choose the web desktop option by clicking on "Yes" for "Enable web desktop." Or you may use the SSH or Web Shell. Once it finishes building your environment, use any method of your choice to access the server.

### SageMath on IU Jetstream2

Jetstream2 gives full access to the system, and users can use the `sudo` command. For the installation of SageMath, we follow the official instructions [here](https://doc.sagemath.org/html/en/installation/conda.html). The script below installs Mini-forge (and automatically agrees to their License Agreement) SageMath. 

``` shell
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
sh Miniforge3-Linux-x86_64.sh -bp ~/miniforge3
PATH=~/miniforge3/bin:$PATH
mamba install sage python --yes
```

Note: You may need to use `conda` if `mamba` is not available. But `mamba` will execute the installation command much faster than `conda`.

To use SageMath, one needs to activate the conda (mamba) environment. This requires logging out and logging in.

``` shell
conda init
exit
```

<details>
<summary> Click for screenshots
<p float="center">
  <img src="./images/indiana_jetstream2_sage/12-conda_init_exit.png" width="30%" />    
  <img src="./images/indiana_jetstream2_sage/13-exit_reconnect.png" width="30%" />    
  <img src="./images/indiana_jetstream2_sage/14-sage.png" width="30%" />
</p>
</summary>
</details>

Reconnect and type sage to use it: 

``` shell
sage
```

### JupyterLab on IU Jetstream2

To use Jetstream2 as a remote JupterLab/Note server for SageMath, please follow the additional instructions here. 

``` shell
mamba install jupyterlab --yes
# mamba install jupyter-resource-usage --yes
rm .jupyter/jupyter_notebook_config.py || true
jupyter notebook --generate-config
echo "c.NotebookApp.ip = '0.0.0.0'" >> .jupyter/jupyter_notebook_config.py
```
The above commands need to be executed once for each instance. 

To start JupyterLab, execute the following command and follow the instructions below. 

``` shell
jupyter lab
```
To connect to the JupyterLab we need the URL and token. The URL will be in the form

> http//:<ip_address>:<port_number>/lab?token=<your_token>

The port number and token are available in the output of the command `jupyter lab`. For instance, see the example below.

<p float="center">
  <img src="./images/indiana_jetstream2_sage/22-jupterlab_token.png" width="40%" />    
</p>

Note: To copy strings in the Web Shell, please refer to the document, https://docs.jetstream-cloud.org/ui/exo/troubleshooting/#i-cant-copy-and-paste-tofrom-the-web-shell-or-web-desktop-guacamole
<!-- use <alt + c> (or <commnad + c>) to copy strings in Ubuntu (or Mac Os). -->

For the IP address, go to the browser you used to create the instance. 

<p float="center">
  <img src="./images/indiana_jetstream2_sage/24-grab_ip_address.png" width="40%" />    
</p>

In this example, the IP address is 149.165.170.168, but it should be different for your instance. Now open the browser and type the information in the URL, and you will be connected to the JupterLab.

In this example, the URL is 

`http://149.165.170.168:8888/lab?token=5ffdc59873b4bf36ad22386d79cd6204`

<p float="center">
  <img src="./images/indiana_jetstream2_sage/25-replace_ip.png" width="40%" />    
</p>

Note: This provides a non-secure connection. A user may want to check out the JupyterHub's security basics section [here](https://jupyterhub.readthedocs.io/en/latest/tutorial/getting-started/security-basics.html.)


<!-- https://stackoverflow.com/questions/45421163/anaconda-vs-miniconda -->

### Macaulay2 on IU Jetstream2

One can install Macaulay2 in Ubuntu 22.04 with `apt` as explained on the Macaulay2 [webpage](https://macaulay2.com/Downloads/GNU-Linux/Ubuntu/index.html). The following commands install and start Macaulay2. 

``` shell
sudo apt install macaulay2 --yes
M2
```

<p float="center">
  <img src="./images/indiana_jetstream2_m2/Screenshot from 2023-11-25 21-56-14.png" width="40%" />    
</p>

### Monitoring resources on IU Jetstream2

> (Under construction) 

## SDSC Expanse

Expanse on San Diego Supercomputing Center (SDSC) provides a Linux shell to which one can SSH. One does *not* have the admin privilege on Expanse. We can `load` the Anaconda environment to install SageMath. However, Singularity containers provide a quick and easy way of running the software. For JupyterLab, we will use Expanses' `Galyleo` environment.  

## SageMath and Macaulay2 on SDSC Expanse

With singularity, we can treat SageMath and Macaulay2 simultaneously.

Singularity uses a container file, which is similar to a Docker container. One can create and load Docker containers in Singularity, but the conversion takes time and often produces several warnings. Building a Singularity container from its definition file is a more streamlined approach. 

For convenience, we include the definition files written by the author at the end of this tutorial. The container images are available from the author's Sylabs account. To download these files, first the `singularitypro` module:

``` shell
module load singularitypro
```

and run the following commands

``` shell
singularity pull --arch amd64 library://youngsu-kim/cas/sage:latest       # for SageMath  
singularity pull --arch amd64 library://youngsu-kim/cas/macaulay2:latest  # for Macaulay2
```

You only download them once, and it takes around 2 minutes on Expanse. Now, run them by loading these images with Singularity.

``` shell
$ ls -alth *.sif
-rwxr-xr-x 1 youngsukim sds173 411M Nov 19 20:19 macaulay2_latest.sif
-rwxr-xr-x 1 youngsukim sds173 2.1G Nov 19 20:19 sage_latest.sif
```

Now we can load them by executing the following commands.

``` shell
# sagemath
singularitypro shell ./sage_latest.sif
sage
```

``` shell
# macaulay2
singularitypro shell ./macaulay2_latest.sif
M2
```

> Note: Be sure to run them on a compute node other than the login nodes. 
> Running a heavy task on a login node will affect the system and other users negatively.

### JupyterLab on SDSC Expanse

To run SageMath or Macaulay2 on JupyterLab, please run the following command in the same folder with the `env_sage.yml` file. This does not use singularity containers. 

``` shell
export PATH="/cm/shared/apps/sdsc/galyleo:${PATH}"
galyleo launch --account css101 --partition debug --cpus 2 --memory 4 --time-limit 00:30:00 --conda-env sage_jupyter --conda-yml env_sage.yml --mamba
```

`env_sage.yml` file:

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

The output of `galyleo` command includes an URL and open it in your browser.

> (under construction) add images.

For more details about this approach, refer to the notes by Marty Kandes at SDSC [here](https://education.sdsc.edu/training/interactive/202206_ciml_si22/section1_3/quickstart-jupyter-notebooks.pdf). 

### Monitoring resources on SDSC Expanse

> (Under construction) 


### SageMath with Anaconda on SDSC Expanse

It is similar to the one for Jetstream2, but here we need to use `conda` instead of `mamba`. Generally, `mamba` works much faster than `conda`. This installation needs to be done once.

First, load the `anaconda3` module on Expanse:

``` shell
module load cpu/0.15.4
module load anaconda3/2020.11
```

Create and install SageMath in your home folder. The following command installs SageMath in `<user_home_directory>/.conda/sage`. With Conda, it may take a few minutes but only needs to be done once.

``` shell
conda create --prefix ~/.conda/sage -c conda-forge sage python
```

To use SageMath, one needs to activate the conda environment. 

``` shell 
conda activate sage
sage
```

<!-- ##### Uninstall SageMath installed with Conda

It is simple to remove the environment. ...

``` shell
conda env remove sage
``` -->

### Singularity Container Definitions

#### Macaulay2 

``` yaml
Bootstrap: library
From: ubuntu:22.04

%post
    apt-get -y update
    apt-get -y install macaulay2
    apt-get clean -y
    rm -rf /var/lib/apt/lists/*
```

#### SageMath

``` yaml
# code based on https://stackoverflow.com/a/61232125
Bootstrap: library
From: ubuntu:22.04
Stage: build

%post
    apt-get update && apt-get -y upgrade
    apt-get -y install \
    # build-essential \
    wget 
    apt-get clean -y
    rm -rf /var/lib/apt/lists/*
    ##
    ## Installing Miniforge3
    wget -c https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
    /bin/bash Miniforge3-Linux-x86_64.sh -bfp /usr/local
    ##
    ## Conda configuration of channels from .condarc file
    conda config --file /.condarc --add channels defaults
    conda config --file /.condarc --add channels conda-forge
    mamba install sage jupyterlab -c conda-forge --yes
    conda clean -a
    rm Miniforge3-Linux-x86_64.sh
```

## Todo 
- Add examples
- Add monitoring
<!-- - Check out other supercomputing centers -->
<!-- - Ask Bob to make it available to ask for ACCESS allocation for testing purposes (Do I need to inform Alana?) -->
<!-- - Ask Bob if possible to make a group allocation on Expanse -->
  
