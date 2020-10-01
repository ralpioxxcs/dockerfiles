# base os imgae
FROM ubuntu:18.04

# change apt server
RUN sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

# install essential packages
RUN apt-get update && \
  apt install -y \
  build-essential \
  cmake \
  git \
  wget \
  unzip \
  && rm -rf /var/lib/apt/lists/*

# install opencv dependency package
RUN apt install -y libavformat-dev libavcodec-dev libavfilter-dev libswscale-dev
RUN apt install -y libjpeg-dev libpng-dev libtiff-dev libjasper-dev zlib1g-dev libopenexr-dev libxine-dev libeigen3-dev libtbb-dev

WORKDIR /opencv
ENV OPENCV_VERSION="3.4.6"
RUN wget -O ${OPENCV_VERSION}.zip https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
  && unzip ${OPENCV_VERSION}.zip \
  && mkdir /opencv-${OPENCV_VERSION}/build \
  && cd /opencv-${OPENCV_VERSION}/build

# build opencv
ADD build_opencv.sh /build_opencv.sh
RUN /bin/sh ./build_opencv.sh
RUN rm -rf build_opencv.sh
