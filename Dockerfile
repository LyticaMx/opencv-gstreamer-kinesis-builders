FROM python:3.9-buster

ENV CMAKE_ARGS="-DCMAKE_BUILD_TYPE=RELEASE -DWITH_GSTREAMER=ON"
ENV ENABLE_HEADLESS=1

WORKDIR /opencv-python
VOLUME /build

RUN apt-get update && apt-get upgrade -y

RUN \
	apt-get install -y \
	libgstreamer1.0-0 \
	gstreamer1.0-plugins-base \
	gstreamer1.0-plugins-good \
	gstreamer1.0-plugins-bad \
	gstreamer1.0-plugins-ugly \
	gstreamer1.0-libav \
	gstreamer1.0-doc \
	gstreamer1.0-tools \
	libgstreamer1.0-dev \
	libgstreamer-plugins-base1.0-dev \
	git \
	ninja-build

# get opencv and build it
RUN git clone --recursive https://github.com/opencv/opencv-python.git .

RUN pip wheel . --verbose

RUN mv opencv*.whl /build
