# SageMath and Macaulay2 on HPC a view towards ACCESS and NRP

## Motivation

Computer algebra software (CAS) became an indispensable tool in several areas in research and teaching. Often, it provides computational evidence that leads to find patterns or for students, it provides another way getting into mathematics.  There is a collection of CAS, CoCoa, Macaulay2, Magma, SageMath, Singular to name a few. They are easy to install on a personal computer or Mac. However, due to the computation intensity, researchers often face limitations such as out-of-memory, storage, or computing power. 

In the past decade or two, there has been a significant development in computing resources, and several NSF awards focused on expanding computational resources for academic research and education. 
Due to the complexity in getting into the server system or supercomputing platforms, these cutting-edge resources have not been fully utilized by the mathematics community. 
The main goal of this tutorial is to present a streamlined procedure and demonstrate how effetely use and monitor resources for SageMath and Macaulay2. 

> Change it to general and add SageMath and Macaulay2####

It will be particularly useful for those who do not have on-campus computing resources as the resources in this tutorial are available for academic purposes at no cost. For questions, comments, or suggestions, please contact Youngsu Kim at youngsu.kim@csusb.edu. 

## Acknowledgments

This project is supported in part by NSF xxx lead by Dr. Mary Thomas at San Diego Supercomputing Center. The author participated this project as a 2023 cyberinfrastructure professional trainee from California State University San Bernardino.

In addition to the PI Dr. Thomas, the author appreciates the help and support from the mentors, especially, Dr. Rick Wagner and Dr. Bob Sinkovits. 

## Structure of the tutorial and Timeline 

> Add short description of the content and timeline####

## Allocations

This tutorial focuses on the ACCESS and assumes that one has allocations on ACCESS. To request allocations on ACCESS (and it is free), please go visit this [page](https://allocations.access-ci.org/prepare-requests-overview#comparison-table) for details. There is no fee. Once you have allocations, it is time to choose the supercomputing center(s) for your project.

On ACCESS, one submits an exchange request to use allocations on a supercomputing center. Here, we assume two scenarios:

1. Project requiring large memory
2. Project requiring many CPUs (cores)

Large Memory Nodes:

ACCESS provides a large-memory filter on their [webpage](https://allocations.access-ci.org/resources).  
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

To use ACCESS resources, one converts allocation credit to resource hours. The rate is determined by each supercomputing center. Often, they are in the unit of SU (service-unit), and one SU corresponds to one CPU (core) hour. 

**Warning:** One will be charged by the resources we request not by the portion of resources one utilizes. For instance, if one asks for 4 CPUs, but ended up using only 2, one will be still charged for the SUs for 4 CPUs. It is important to monitor resource usage and we discuss it in this tutorial, in Section xxxx.

Generally, memory requests are done via CPU requests. Consider the PSC Bridges-2 node. 

> Update this part (Bob's comment). 

Note: 

## Indiana Jetstream2

Indiana Jetstream2 is unique as it provides the full desktop-like environments. Several supercomputing centers offer only a portal and SSH access. Since it is most close to a PC and Mac, we cover this first. 

> To include screenshots or not ####

Navigate to Instance sources -> Choose an Instance Source -> Select an image, e.g., Ubuntu 22.04 (Latest)

You may choose the web desktop option by clicking on Yes for "Enable web desktop." Or you may use the SSH or Web Shell. Once it finishes building your environment, use any method of your choice to access the server.

> Note: #### Add how to find the address for SSH ####

#### SageMath

Jetstream2 gives the full access to the system and users can use the `sudo` command. For the installation of SageMath, we follow their instructions on [here](https://doc.sagemath.org/html/en/installation/conda.html). The script below installs Mamba-forge (and automatically agrees to their License agreement) and install SageMath. 

``` shell
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
sh Miniforge3-Linux-x86_64.sh -bp ~/.conda
PATH=~/miniforge3/bin:#PATH
mamba install sage python --yes
```

Note: You may need to use `conda` if `mamba` is not available. 

To use SageMath, one needs to activate the conda (mamba) environment. This requires logging out and logging in.

``` shell
conda init
exit
```

Reconnect and type sage to use it:

``` shell
sage
```

To use Jetstream2 as a remote JupterLab/Note server for SageMath, please follow the additional instructions here. 

``` shell
mamba install jupyterlab --yes
jupyter notebook --generate-config
echo "c.NotebookApp.ip = '0.0.0.0'" >> .jupyter/jupyter_notebook_config.py
```

https://docs.jetstream-cloud.org/ui/exo/troubleshooting/#i-cant-copy-and-paste-tofrom-the-web-shell-or-web-desktop-guacamole

https://stackoverflow.com/questions/45421163/anaconda-vs-miniconda

#### Macaulay2 

One can install Macaulay2 in Ubuntu 22.04 with `apt` as explained on the Macaulay2 [webpage](https://macaulay2.com/Downloads/GNU-Linux/Ubuntu/index.html). The following commands install and start Macaulay2. 

``` shell
sudo apt install macaulay2 --yes
M2
```

#### To-do

Add how to check the resources while running

## Expanse on San Diego Supercomputing Center (SDSC)

Expanse provides a Linux shell to which one can SSH. One does not have the admin privilege on Expanse. We can `load` the anaconda environment to install SageMath. The rest is similar to the one for Jetstream2, but here we need to use `conda` instead of `mamba`. Generally, `mamba` works much faster than `conda`.

First, load the `anaconda3` module on Expanse:

``` shell
module load cpu/0.15.4
module load anaconda3/2020.11
```

Create and install SageMath in your home folder. The following command installs SageMath in `<user_home_directory>/.conda/sage`. With Conda, it may take a few minutes but only need to be done once.

``` shell
conda create --prefix ~/.conda/sage -c conda-forge sage python
```

To use SageMath, one needs to activate the conda environment. 

``` shell 
conda activate sage
sage
```

``` shell
Add how to uninstall 
```

<!-- 
## How to use SageMath on HPCs

## How to use Macaulay2 on HPCs -->

###JupyterLab on Expanse

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

## Todo 
- Check out other supercomputing centers
- Add examples
- Add monitoring