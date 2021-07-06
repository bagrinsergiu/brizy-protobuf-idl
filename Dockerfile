FROM ubuntu

RUN apt-get update \
    && apt-get install -y wget unzip

RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v3.17.3/protoc-3.17.3-linux-x86_64.zip \
    && unzip -d ./protoc protoc-3.17.3-linux-x86_64.zip \
    && cp -r protoc/include/google /usr/local/include/ \
    && cp -r protoc/bin/protoc /usr/local/bin \
    && rm -rf protoc

RUN wget https://github.com/ckaznocha/protoc-gen-lint/releases/download/v0.2.1/protoc-gen-lint_linux_amd64.zip \
    && unzip -d ./protoc-gen-lint protoc-gen-lint_linux_amd64 \
    && cp -r protoc-gen-lint/protoc-gen-lint /usr/local/bin \
    && rm -rf ./protoc-gen-lint

RUN mkdir /brizy-protobuf
WORKDIR /brizy-protobuf
COPY . /brizy-protobuf
