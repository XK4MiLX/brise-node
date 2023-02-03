#!/bin/bash

# Setup
if [[ ! -d /root/bitgert ]]; then
  mkdir -p /root/bitgert
  cd /root/bitgert
  #Download the required JSON files
  cp /tmp/brise_mainnet.json /root/bitgert/brise_mainnet.json
fi
#Initialize the node
if  [[ ! -f /root/bitgert/geth/static-nodes.json ]]; then
  geth --datadir /root/bitgert init brise_mainnet.json
  cp /tmp/static-nodes.json /root/bitgert/geth/static-nodes.json
fi
cd /root/bitgert
#Run geth
geth --datadir /root/bitgert --syncmode 'full' --gcmode=archive --port 40605 --http --http.port 3545 --http.addr=0.0.0.0 --http.api 'personal,eth,net,web3,personal,admin,miner,txpool,debug' --bootnodes enode://bab5d43f3ad9612f909547fa754b955c0509a11a55c7f067b5bdc434b5fb6cea363c193c6c00557bc90267da7aef3a5997c376754f6df2d6817cf52c90d1852e@54.251.84.204:40605 --networkid 32520








