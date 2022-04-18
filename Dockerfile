FROM python:3.9-buster AS builder

ENV CMAKE_ARGS="-DCMAKE_BUILD_TYPE=RELEASE -DWITH_GSTREAMER=ON"
ENV ENABLE_HEADLESS=1

WORKDIR /opencv-python
VOLUME /build

RUN echo "hello wheel" > hello.whl

FROM alpine AS export-stage
COPY --from=stage1 /build/*.whl .
