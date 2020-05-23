FROM debian:buster-slim

ENV JSONNET_VERSION="v0.16.0"

RUN apt-get update && apt-get install -y wget git

RUN cd /tmp/ && \
	wget https://github.com/google/jsonnet/releases/download/${JSONNET_VERSION}/jsonnet-bin-${JSONNET_VERSION}-linux.tar.gz && \
	tar zxvf jsonnet* && \
	mv jsonnet /usr/local/bin/ && \
	mv jsonnetfmt /usr/local/bin/ && \
	chmod 755 /usr/local/bin/jsonnet*

RUN git clone https://github.com/grafana/grafonnet-lib.git /opt/

WORKDIR /app/

ENTRYPOINT ["jsonnet", "-J", "/opt/"]
