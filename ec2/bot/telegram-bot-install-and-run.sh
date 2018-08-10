#!/bin/bash
GIT_REPO="https://github.com/RemiitAdmin/remiit-telegram-bot-node.git"
HOME_PATH=$HOME
PROJECT_PATH="$HOME_PATH/remiit-telegram-bot-node"
CONFIG_PATH="$PROJECT_PATH/config"
S3_TOKEN_PATH="s3://bluepan-dev/telegram-bot/token.json"

cmd_download_source="git clone $GIT_REPO $PROJECT_PATH"
cmd_download_token_from_s3="aws s3 $S3_TOKEN_PATH $CONFIG_PATH/"

eval "mkdir $PROJECT_PATH"
eval $cmd_download_source 
eval $cmd_download_token_from_s3

PRE_FIX="--prefix $PROJECT_PATH"
cd $PROJECT_PATH
eval $("npm install 2>&1 | tee install_log.txt")
eval $("npm start") 
