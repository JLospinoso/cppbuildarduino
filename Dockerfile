FROM ubuntu:18.04
RUN apt update && apt upgrade -y && \
    apt install software-properties-common make git wget build-essential gcc-8 -y

RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 10 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 10

# Install cmake v3.14.4
RUN wget -q https://cmake.org/files/v3.14/cmake-3.14.4.tar.gz && \
    tar xzf cmake-3.14.4.tar.gz && rm cmake-3.14.4.tar.gz
WORKDIR cmake-3.14.4
RUN ./bootstrap && make && make install
WORKDIR /
RUN rm -rf cmake-3.14.4

# Install Arduino v1.8.9
RUN wget -q https://downloads.arduino.cc/arduino-1.8.9-linux64.tar.xz
RUN tar xf arduino-1.8.9-linux64.tar.xz
RUN rm arduino-1.8.9-linux64.tar.xz
RUN mv arduino-1.8.9 /opt/arduino/
RUN chmod +x /opt/arduino/install.sh
RUN /opt/arduino/install.sh

WORKDIR /
