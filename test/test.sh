#/bin/bash
set -e -u
export PATH="$INIT_CWD"/bin:"$PATH"; # $INIT_CWD provided by npm run-script
ml-config
ml-list-processors
