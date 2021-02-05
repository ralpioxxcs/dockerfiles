# base os imgae
FROM ubuntu:18.04 AS builder
MAINTAINER placket

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
  unzip

# install opencv dependency package
RUN apt install -y  libavformat-dev \ 
                    libatlas-base-dev \ 
                    libavcodec-dev \ 
                    libswscale-dev \ 
                    pkg-config \
                    qt5-default \
                    libjpeg-dev \ 
                    libpng-dev

# Opencv Process
WORKDIR /opencv
ENV OPENCV_VERSION="3.4.6"
RUN wget -O ${OPENCV_VERSION}.zip https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
  && unzip ${OPENCV_VERSION}.zip \
  && mkdir -p opencv-${OPENCV_VERSION}/build \
  && cd opencv-${OPENCV_VERSION}/build
RUN ldconfig

# build opencv
ADD build_opencv.sh /opencv/opencv-${OPENCV_VERSION}/build_opencv.sh
RUN cd /opencv/opencv-3.4.6 && ./build_opencv.sh
RUN rm -rf build_opencv.sh

# clean
WORKDIR /
RUN apt-get autoclean autoremove
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /opencv

# multi stage
FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /opencv/install .

# default command.
CMD ["bash"]
