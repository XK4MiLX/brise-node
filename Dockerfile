# Use an official Ubuntu image as the base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \ 
apt-get install software-properties-common wget -y

RUN add-apt-repository -y ppa:ethereum/ethereum && \
apt-get update -y && \
apt-get install ethereum -y && \
apt-get upgrade geth -y

COPY brise_mainnet.json /tmp/brise_mainnet.json
COPY static-nodes.json /tmp/static-nodes.json
COPY init.sh /init.sh
RUN chmod 755 /init.sh  

VOLUME /root

ENTRYPOINT ["/bin/sh", "-c" , "/init.sh"]
