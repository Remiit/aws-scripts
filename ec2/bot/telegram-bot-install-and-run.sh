GIT_REPO="https://github.com/RemiitAdmin/remiit-telegram-bot-node.git"
PATH="~/"
PROJECT_PATH="$PATH/remiit-telegram-bot-node"
CONFIG_PATH=$PROJECT_PATH/config
S3_TOKEN_PATH=s3://bluepan-dev/telegram-bot/token.json
eval $(cd $PATH)

cmd_download_source=$(git clone $GIT_REPO)
cmd_download_token_from_s3=$(aws s3 $S3_TOKEN_PATH $CONFIG_PATH/)

eval $cmd_download_source 
eval $cmd_download_token_from_s3

eval $(cd $PROJECT_PATH)

eval $(npm install 2>&1 | tee install_log.txt)
eval $(npm start)
