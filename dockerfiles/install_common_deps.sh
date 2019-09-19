#!/bin/bash
DEBIAN_FRONTEND=noninteractive
apt-get install -y --no-install-recommends \
        wget \
        zip \
        ca-certificates \
        build-essential \
        curl \
        libcurl4-openssl-dev \
        libssl-dev \
        python3-dev

# Dependencies: conda
wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh --no-check-certificate && /bin/bash ~/miniconda.sh -b -p /opt/miniconda
rm ~/miniconda.sh
/opt/miniconda/bin/conda clean -tipsy
find / -type d -name __pycache__ -prune -exec rm -rf {};

conda install -y python=3.6 numpy
conda clean -aqy
rm -rf /opt/miniconda/pkgs

# Dependencies: cmake
sudo wget --quiet https://github.com/Kitware/CMake/releases/download/v3.14.3/cmake-3.14.3-Linux-x86_64.tar.gz
tar zxf cmake-3.14.3-Linux-x86_64.tar.gz