FROM python:3.9-buster AS builder

ENV CMAKE_ARGS="-DCMAKE_BUILD_TYPE=RELEASE -DWITH_GSTREAMER=ON"
ENV ENABLE_HEADLESS=1

WORKDIR /builder
RUN echo "hello wheel" > hello.whl

FROM scratch AS export-stage
COPY --from=builder *.whl .
