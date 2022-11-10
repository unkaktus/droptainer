# ARG APPTAINER_VERSION=1.1.3
FROM golang
RUN apt-get update; \
    apt-get install -y rpm2cpio cpio
WORKDIR /droptainer/
RUN curl -LO https://github.com/apptainer/apptainer/releases/download/v1.1.3/apptainer-1.1.3-1.x86_64.rpm
RUN rpm2cpio apptainer-1.1.3-1.x86_64.rpm | cpio -idmv ./usr/libexec/apptainer/bin/squashfuse_ll; \
    rm -rf apptainer-1.1.3-1.x86_64.rpm; \
    mv ./usr/libexec/apptainer/bin/* .; \
    rm -rf usr
RUN curl -LO https://github.com/apptainer/apptainer/releases/download/v1.1.3/apptainer-1.1.3.tar.gz; \
    curl -LO https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
COPY droptainer.sh .

WORKDIR /work
RUN tar czvf droptainer.tar.gz /droptainer
CMD ["cp", "/work/droptainer.tar.gz", "/out"]