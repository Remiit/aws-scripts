#!/bin/bash
sudo mkdir scripts
sudo curl -o scripts/ethereum-install-ubuntu.sh https://raw.githubusercontent.com/Remiit/aws-scripts/master/ec2/ethereum-node/ethereum-install-ubuntu.sh
sudo curl -o scripts/geth-sync.sh https://raw.githubusercontent.com/Remiit/aws-scripts/master/ec2/ethereum-node/geth-sync.sh 
sudo chmod -R +x,+x,+x scripts
sudo scripts/ethereum-install-ubuntu.sh
