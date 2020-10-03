# base os imgae
FROM ubuntu:18.04

# change apt server
RUN sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN sed -i 's/extras.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN apt-get update

# install essential packages
RUN apt install -y \
  build-essential \
  cmake \
  git \
  wget \
  unzip \
  gdb

# install opencv dependency package
RUN apt install -y libavformat-dev libavcodec-dev libavfilter-dev libswscale-dev libjpeg-dev libpng-dev pkg-config

## install option (gtk or qt)
ARG WITH_QT
RUN if [ "${WITH_QT}" = "ON" ]; then apt install -y qt5-default; fi
ENV WITH_QT=$WITH_QT

WORKDIR /opencv
ENV OPENCV_VERSION="3.4.6"
RUN wget -O ${OPENCV_VERSION}.zip https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
  && unzip ${OPENCV_VERSION}.zip \
  && mkdir -p opencv-${OPENCV_VERSION}/build \
  && cd opencv-${OPENCV_VERSION}/build

#RUN pwd && ls -al

# build opencv
ADD build_opencv.sh /opencv/opencv-${OPENCV_VERSION}/build_opencv.sh
RUN cd /opencv/opencv-3.4.6 && ./build_opencv.sh
RUN rm -rf build_opencv.sh

# clean process
WORKDIR /
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf ${OPENCV_VERSION}.zip opencv
