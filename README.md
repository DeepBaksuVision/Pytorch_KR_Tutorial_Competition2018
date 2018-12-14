# Pytorch_KR_Tutorial_Competition2018



Dockerfile for build Docker Image that should submit to [`Tutorial Competition 2018`](https://pytorchkr.github.io/Tutorial-Competition-2018/?fbclid=IwAR0MiIQOMFyXuL6Ygm6mMfFE2Wc-xMXOssF97fOmzUn_QQaDy5h7jLJkByI) ([Github](https://github.com/PyTorchKR/Tutorial-Competition-2018) / [issue #5](https://github.com/PyTorchKR/Tutorial-Competition-2018/issues/5))

​    

## pre-requistes

- docker-ce >= 18.09 ([install guide](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce))

- nvidia-docker2 ([install guide](https://github.com/NVIDIA/nvidia-docker))

​    

## How to use



#### clone repository

```bash
$ git clone https://github.com/DeepBaksuVision/Pytorch_KR_Tutorial_Competition2018.git
```



#### build Dockerfile

```bash
$ sh build.sh
```



#### run Docker Image

```bash
$ sh run.sh
```



#### running YOLOv1 train / test

```bash

# train
$ sh script/train.sh

# test
$ sh script/test.sh
```



## Detail Guide

refer [[You Only Look Once repository]](https://github.com/DeepBaksuVision/You_Only_Look_Once)
