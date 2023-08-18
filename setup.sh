#!/bin/bash

# check if inside SWAN setup
if [[ -z "${SWAN_HOME}" ]]; then
    if [ "$#" -ge 1 ];
    then
        EnvironmentName=$1
    else
        EnvironmentName="default"
    fi
    
    SOURCE="${BASH_SOURCE[0]}"
    while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
      DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
      SOURCE="$(readlink "$SOURCE")"
      [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done

    export DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

else
  EnvironmentName="swan"
  export DIR=$(dirname "$USER_ENV_SCRIPT")
fi


export DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

if [ "$EnvironmentName" = "default" ]; #Default is python3
then
    QSPATH=/afs/cern.ch/work/c/chlcheng/Repository/quickstats
    HPOPATH=/afs/cern.ch/work/c/chlcheng/Repository/hpogrid
    export PATH=${DIR}/bin:/afs/cern.ch/work/c/chlcheng/local/miniconda/envs/root-latest/bin:$PATH
    export PATH=${DIR}/bin:${PATH}
    export PATH=${QSPATH}/bin:${PATH}
    export PYTHONPATH=${DIR}:${PYTHONPATH}
    export PYTHONPATH=${QSPATH}:${PYTHONPATH}
    export PYTHONPATH=${HPOPATH}:${PYTHONPATH}
fi

export ADMLWORKDIR=${DIR}
