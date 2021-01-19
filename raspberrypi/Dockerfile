# base os imgae
FROM raspbian/stretch

# change apt server
RUN cat /etc/apt/sources.list
RUN sed -i 's@archive.raspbian.org@ftp.kaist.ac.kr/raspbian@g' /etc/apt/sources.list
RUN sed -i 's@archive.raspberrypi.org@rpi.rutgers.edu/archive.raspberrypi.org@g' /etc/apt/sources.list
RUN apt-get update

# install essential packages
RUN apt-get install -y build-essential make  cmake git wget unzip

# install opencv dependency package
RUN apt-get install -y  libavformat-dev libatlas-base-dev libavcodec-dev libswscale-dev pkg-config libjpeg-dev libpng-dev

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

# default command.
CMD ["bash"]
