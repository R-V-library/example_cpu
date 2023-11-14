#!/bin/sh

echo "######## Example CPU SOURCEME ########"
export PRJROOT=${PWD}
alias proot="cd $PRJROOT"

# activate venv
PRJNAME=example_cpu_env
VENV_PATH=$PRJROOT/$PRJNAME/bin
VENV_ACTIVATE_FILE=$VENV_PATH/activate

if [ -f $VENV_ACTIVATE_FILE ] ; then
  source $VENV_ACTIVATE_FILE
else
  echo -e "\n\e[101m[ERROR] No venv found, make sure to run \"sudo make setup\" upon first setup. \033[0m"
  return 1
fi

echo "Setting up Vivado"
VIVADO_PATH=/tools/Xilinx/Vivado/
if [ -e "$VIVADO_PATH" ]; then
  source $VIVADO_PATH/*/settings64.sh 
else 
  echo "Unable to setup Vivado"
fi 

echo "######## SOURCEME DONE ########"
