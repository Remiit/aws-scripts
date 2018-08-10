#!/bin/bash
GIT_REPO="https://github.com/RemiitAdmin/remiit-telegram-bot-node.git"
HOME_PATH=$HOME
PROJECT_PATH="$HOME_PATH/remiit-telegram-bot-node"
CONFIG_PATH="$PROJECT_PATH/config"
S3_TOKEN_PATH="s3://bluepan-dev/telegram-bot/token.json"
NPM_PATH="$HOME/.nvm/versions/node/v8.11.3/bin"

cmd_download_source="git clone $GIT_REPO $PROJECT_PATH"
cmd_download_token_from_s3="aws s3 cp $S3_TOKEN_PATH $CONFIG_PATH/"

eval "mkdir $PROJECT_PATH"
eval $cmd_download_source 
eval $cmd_download_token_from_s3

