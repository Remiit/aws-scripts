#!/bin/bash
echo "---ethereum install start !!!---"

echo "---pre-requisite install---"
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update

echo "---start to install ethereum tools---"
sudo apt-get install -y ethereum
