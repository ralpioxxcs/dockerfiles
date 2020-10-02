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
  unzip

# install opencv dependency package
RUN apt install -y libavformat-dev libavcodec-dev libavfilter-dev libswscale-dev libjpeg-dev libpng-dev

WORKDIR /opencv
ENV OPENCV_VERSION="3.4.6"
RUN wget -O ${OPENCV_VERSION}.zip https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
  && unzip ${OPENCV_VERSION}.zip \
  && mkdir -p opencv-${OPENCV_VERSION}/build \
  && cd opencv-${OPENCV_VERSION}/build

RUN pwd && ls -al

# build opencv
ADD build_opencv.sh /opencv/opencv-${OPENCV_VERSION}/build_opencv.sh
RUN cd /opencv/opencv-3.4.6 && ./build_opencv.sh
RUN rm -rf build_opencv.sh
