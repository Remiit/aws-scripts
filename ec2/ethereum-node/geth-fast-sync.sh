#!/bin/bash
echo "---geth sync start---"

POSTFIX="&"

echo "please enter the directory path which you want to sync ethereum data : "

read ethereum_dir

echo "make ethereum directory on the ${ethereum_dir}"
eval "sudo mkdir ${ethereum_dir}"

COMMON_COMMAND="sudo geth --syncmode "fast" --datadir ${ethereum_dir} --rpc --rpcapi db,eth,web3,net,personal,admin,debug,miner,txpool --maxpeers 128 --maxpendpeers 10"

echo "Input the cache size you want(1024(default)/2048/other numbers) :"

read cacheSize

re='^[0-9]+$'
if ! [[ $cacheSize =~ $re ]] ; then
   echo "error: Not a number" >&2; exit 1
fi


echo "Which network do you want to sync?(main/test/no)"

read network

echo "Please input Comma separated list of virtual hostnames from which to accept requests (server enforced). Accepts '*' wildcard. (default: "localhost")"

read vhosts

common_command="${COMMON_COMMAND} --cache ${cacheSize} --rpcvhosts ${vhosts}"

if [ $network == "main" ]; then
    echo "---start to fast-sync ethereum on main network---"
		command="${common_command} ${POSTFIX}"
		echo ${command}
    eval ${command}
elif [ $network == "test" ]; then
    echo "---start to fast-sync ethereum on test(Ropsten) network---"
		command="${common_command} --testnet ${POSTFIX}"
		echo ${command}
    eval ${command}
else
    echo "---stop install ethereum network sync---"
fi
