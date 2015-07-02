#!/bin/bash

source defaults.sh

declare -A mm
CLUSTER=""
MASTER=""
MASTER_IP=""
MINION_IPS=""

function setClusterInfo {
  source defaults.sh
  ii=0
  for i in $nodes
  do
      name="infra"$ii
      nodeIP=${i#*@}

      item="$name=http://$nodeIP:2380"
      if [ "$ii" == 0 ]; then 
          CLUSTER=$item
      else
          CLUSTER="$CLUSTER,$item"
      fi
      mm[$nodeIP]=$name

      if [ "${roles[${ii}]}" == "ai" ]; then
        MASTER_IP=$nodeIP
        MASTER=$i
        MINION_IPS="$nodeIP"
      elif [ "${roles[${ii}]}" == "a" ]; then 
        MASTER_IP=$nodeIP
        MASTER=$i
      elif [ "${roles[${ii}]}" == "i" ]; then
        if [ -z "${MINION_IPS}" ];then
          MINION_IPS="$nodeIP"
        else
          MINION_IPS="$MINION_IPS,$nodeIP"
        fi
      else
        echo "unsupported role for ${i}. please check"
        echo "${roles[${ii}]}"
        exit 1
      fi

      ((ii=ii+1))
  done

}
