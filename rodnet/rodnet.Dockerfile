FROM nvidia/cuda:10.1-cudnn8-devel-ubuntu18.04 

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install build-essential -y
RUN apt-get install git -y
RUN apt-get install wget -y
RUN apt-get install rsync -y

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

# RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN conda --version

WORKDIR /home

RUN git clone https://github.com/yizhou-wang/RODNet.git
RUN git clone https://github.com/yizhou-wang/cruw-devkit.git
RUN conda init bash
RUN conda create -n rodnet python=3.* -y

SHELL ["conda", "run", "-n", "rodnet", "/bin/bash", "-c"]
RUN conda install pytorch=1.4 torchvision cudatoolkit=10.1 -c pytorch
WORKDIR /home/cruw-devkit
RUN pip install .

WORKDIR /home
RUN mkdir -p mount
WORKDIR /home/mount



