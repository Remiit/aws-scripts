#!/bin/bash
echo "---geth run start---"
echo "This step is recommended after fast-sync is complete."

echo "Do you complete fast-sync?"

PS3='Please enter your choice: '
options=("yes" "no")
select opt in "${options[@]}"
do
    echo $opt
    case $opt in
        "yes")
            break;;
        "no")
            echo "run again after fast-sync"
            exit;;
        *) echo "invalid option "
            exit;;
    esac
done

POSTFIX="&"

echo "please enter the ethereum data directory path on which you want to run based : "

read ethereum_dir

echo "make ethereum directory on the ${ethereum_dir}"
eval "sudo mkdir ${ethereum_dir}"

COMMON_COMMAND="sudo geth --datadir ${ethereum_dir} --rpc --rpcapi db,eth,web3,net,personal --maxpeers 128 --maxpendpeers 10"

echo "Input the cache size you want(1024(default)/2048/other numbers) :"

read cacheSize

re='^[0-9]+$'
if ! [[ $cacheSize =~ $re ]] ; then
   echo "error: Not a number" >&2; exit 1
fi


echo "Which network do you want to sync?(main/test/no)"

read network

if [ $network == "main" ]; then
    echo "---start to run ethereum on main network---"
		command="${COMMON_COMMAND} --cache ${cacheSize} ${POSTFIX}"
		echo ${command}
    eval ${command}
elif [ $network == "test" ]; then
    echo "---start to run ethereum on test(Ropsten) network---"
		command="${COMMON_COMMAND} --cache ${cacheSize} --testnet ${POSTFIX}"
		echo ${command}
    eval ${command}
else
    echo "---stop running ethereum node---"
fi
