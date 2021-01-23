#FROM python:3.6-slim-stretch
FROM python:3.8-slim-buster

RUN apt-get -y update
RUN apt-get install -y --fix-missing \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-base-dev \
    libavcodec-dev \
    libavformat-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python3-dev \
    python3-numpy \
    software-properties-common \
    zip \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

 RUN cd ~ && \
     mkdir -p dlib && \
     git clone https://github.com/davisking/dlib.git dlib

 RUN cd ~/dlib/ && \
     python3 setup.py install

#RUN pip install dlib