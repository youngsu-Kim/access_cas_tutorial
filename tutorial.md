# SageMath and Macaulay2 on HPC a view towards ACCESS and NRP

## Motivation

Computer algebra software (CAS) became an indispensable tool in several research areas. Often, it provides computational evidence and helps to find patterns. There is a collection of CAS, CoCoa, Macaulay2, Magma, SageMath, Singular to name a few. These are easy available on a personal computer or Mac. However, due to the computation intensity, researchers often face out-of-memory errors and this limits the experiment to a small scale. 

In the last decade, there had been a significant development in computing resources, and several NSF awards focused on expanding computational resources for academic research and education. 
Due to the complexity in getting into the server system or supercomputing platforms, these cutting-edge resources have not been fully utilized by the mathematics community. 
The main goal of this tutorial is to present a streamlined procedure and demonstrate how effetely use and monitor resources for SageMath and Macaulay2. 
####Change it to general and add SageMath and Macaulay2####

It will be particularly useful for those who do not have on-campus computing resources as the resources in this tutorial are available for academic purposes at no cost. For questions, comments, or suggestions, please contact Youngsu Kim at youngsu.kim@csusb.edu. 

## Acknowledgments

This project is supported in part by NSF xxx lead by Dr. Thomas at San Diego Supercomputing Center. The author participated this project as a 2023 cyberinfrastructure professional trainee. 

The author appreciates the help from the lead and mentors, especially, Dr. Wagner and Dr. Sinkovits. 

## How to get resources and allocations

This tutorial focuses on the ACCESS and assumes that one has allocations on ACCESS. To request allocations on ACCESS (and it is free), please go visit this [page](https://allocations.access-ci.org/prepare-requests-overview#comparison-table) for details. There is no fee. Once you have allocations, it is time to choose the supercomputing center(s) for your project.

On ACCESS, one submits an exchange request to use allocations on a supercomputing center. Here, we assume two scenarios:

1. Project requiring large memory
2. Project requiring many CPUs (cores)

Large Memory Nodes:

ACCESS provides a large-memory filter on their [webpage](https://allocations.access-ci.org/resources).  
As of today (####write date here####), these are the nodes. 

|Node Name|Memory Size|
|--|--|
Indiana Jetstream2 Large Memory | 1TB
Kentucky Research Informatics Cloud (KyRIC) Large Memory Nodes | 3TB
NCSA Delta GPU (Delta GPU)* | NA
PSC Bridges-2 Extreme Memory (Bridges-2) | 4TB
Purdue Anvil CPU | 1TB
SDSC Expanse CPU | [2TB](https://www.sdsc.edu/support/user_guides/expanse.html#charging)

\* NCSA Delta GPU (Delta GPU) is for GPU and it often requires more allocation credits.

### What is ACCESS allocation 

To use ACCESS resources, one converts allocation credit to resource hours. The rate is determined by each supercomputing center. Often, they are in the unit of SU (service-unit), and one SU corresponds to one CPU (core) hour. 

**Warning:** One will be charged by the resources we request not by the portion of resources one utilize. For instance, if one asks for 4 CPUs, but ended up using only 2, one will be still charged for the SUs for 4 CPUs. It is important to monitor resource usage and we discuss it in this tutorial, in Section xxx.

Generally, memory requests are done via CPU requests. Consider the PSC Bridges-2 node. 

Note: 

## Indiana Jetstream2

Indiana Jetstream2 is unique as it provides the full desktop-like environments. Several supercomputing centers offer a portal and ssh access. Since it is most close to a PC and Mac, we cover this first. 

Navigate to Instance sources -> Choose an Instance Source -> Select an image, e.g., Ubuntu 22.04 (Latest)

You may choose the web desktop option by clicking on Yes for "Enable web desktop." Or you may use the SSH or Web Shell. Once it finishes building your environment, use any method of your choice to access the server.

Note: #### Add how to find the address for SSH ####

Jetstream2 gives the full access to the system and users can use the `sudo` command. For the installation of SageMath, we follow their instructions on [here](https://doc.sagemath.org/html/en/installation/conda.html). The script below installs Mamba-forge (and automatically agrees to their License agreement) and install SageMath. 

``` shell
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh
sh Mambaforge-$(uname)-$(uname -m).sh -b
PATH=~/mambaforge/bin/:#PATH
mamba create -n sage sage python
```

To use SageMath, one needs to activate the conda (mamba) environment. This requires logging out and logging in.

```
mamba init
exit
```

Reconnect and run the following command to start SageMath.

```
mamba activate sage
sage
```

To use Jetstream2 as a remote JupterLab/Note server for SageMath, please follow the additional instructions here. 

    #### Add instructions ####

One can install Macaulay2 on Ubuntu 22.04 with `apt` as explained on the Macaulay2 [webpage](https://macaulay2.com/Downloads/GNU-Linux/Ubuntu/index.html). The following commands install and start Macaulay2. 

```
sudo apt install macaulay2 --yes
M2
```

#### Todo

Add how to check the resources while running

## Expanse on San Diego Supercomputing Center (SDSC)

Expanse provides a linux shell to which one can SSH. One does not have the admin previledge on Expanse. We can `load` the anaconda environment to install SageMath. The rest is similar to the one for Jetstream2, but here we need to use `conda` instead of `mamba`. Generally, `mamba` works much faster than `conda`.

``` shell
conda create --prefix ~/sage -n sage sage python
```

To use SageMath, one needs to activate the conda environment. This requires logging out and logging in.

```
conda init
exit
```

Reconnect and run the following command to start SageMath.

```
conda activate sage
sage
```


<!-- 
## How to use SageMath on HPCs

## How to use Macaulay2 on HPCs -->

###JupyterLab on Expanse

Singularity container

```
export PATH="/cm/shared/apps/sdsc/galyleo:${PATH}"
module load singularitypro
galyleo launch --account css101 --partition shared --cpus 1 --memory 2 --time-limit 00:30:00 --sif macaulay2_ubuntu_latest.sif 
```

Build from environment.yml 

```
export PATH="/cm/shared/apps/sdsc/galyleo:${PATH}"
galyleo launch --account css101 --partition shared --cpus 1 --memory 2 --time-limit 00:30:00 --conda-yml environment.yml --conda-env sage
```

Source https://education.sdsc.edu/training/interactive/202206_ciml_si22/section1_3/quickstart-jupyter-notebooks.pdf

## Todo 
<!-- 
Share: GitHub user name - sinkovit -->

Add how to on Expanse 