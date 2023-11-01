# SageMath and Macaulay2 on HPC a view towards ACCESS and NRP

## Motivation

Computer algebra sofeware (CAS) became an indispensible tool in several research areas. Often, it provides computational evidence and helps to find patterns. There is a collection of CAS, CoCoa, Macaulay2, Magma, SageMath, Singular to name a few. These are easy available on a personal computer or Mac. However, due to the computation intensity, researchers often face out-of-memory errors and this limits the experiment to a small scale. 

In the last decade, there had been a signaficant developement in computing resources, and several NSF awards focused on expanding computational resources for academic research and education. 
Due to the complexity in getting into the server system or supercomputing platforms, these cutting-edge resources have not been fully utilized by the mathematics community. 
The main goal of this tutorial is to present a streamlined precedure and demonstrate how effectly use and monitor resources for SageMath and Macaulay2. 
####Change it to general and add SageMath and Macaulay2####

It will be particularily useful for those who do not have on-campus computing resources as the resources in this tutorial are available for academic purposes at no cost. For questions, comments, or suggestions, please contact Youngsu Kim at youngsu.kim@csusb.edu. 

## Aknowlegements

This project is supported in part by NSF xxx lead by Dr. Thomas at San Diego Supercomputing Center. The author participated this project as a 2023 cyberinfrastructure professional trainee. 

The author appreciates the help from the lead and mentors, especially, Dr. Wagner and Dr. Sinkovits. 

## How to get resources and allocations

This tutorial focuses on the ACCESS and assumes that one has allocations on ACCESS. To request allocations on ACCESS (and it is free), please go visit this [page](https://allocations.access-ci.org/prepare-requests-overview#comparison-table) for details. There is no fee. Once you have allocations, it is time to choose the supercomputing center(s) for your project.

On ACCESS, one submits an exchange request to use allocations on a supercomputing center. Here, we assume two senarios:

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

To use ACCESS resources, one convers allocation credit to resource hours. The rate is determined by each supercomputing center. Often, they are in the unit of SU (service-unit), and one SU corresponds to one CPU (core) hour. 

**Warning:** One will be charged by the resources we request not by the portion of resources one utilize. For instance, if one asks for 4 CPUs, but ended up using only 2, one will be still charged for the SUs for 4 CPUs. It is important to monitor resource usage and we discuss it in this tuturial, in Section xxx.

Generally, memory requests are done via CPU requests. Consider the PSC Bridges-2 node. 

Note: 

## Indiana Jetsream2

Indiana Jetsream2 is unique as it provides the full desktop-like environments. Several supercomputing centers offer a portal and ssh access. Since it is most close to a PC and Mac, we cover this first. 


## How to use SageMath on HPCs

## How to use Macaulay2 on HPCs



## Todo 

Share: GitHub user name - sinkovit