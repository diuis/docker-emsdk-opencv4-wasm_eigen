FROM diuis/docker-emsdk-opencv4-wasm:v1.1.10

USER root
RUN mkdir /eigen && chown appuser /eigen

RUN wget -nv https://bitbucket.org/eigen/eigen/get/3.3.5.zip -P /home/appuser && \
    unzip -q /home/appuser/3.3.5.zip -d /eigen/ && \
    rm /home/appuser/3.3.5.zip && \
    mkdir /eigen/eigen-eigen-b3f3d4950030/build && \
    cd /eigen/eigen-eigen-b3f3d4950030/build && \
    cmake .. && \
    make install && \
    rm -Rf /eigen

USER appuser