#!/bin/bash

PRJROOT=$PWD

# directory with symlinks to binaries used in project
BIN_DIR=$PRJROOT/tools/bin
rm -rf $BIN_DIR
mkdir -p $BIN_DIR

# Verilator
echo "Setting up Verilator"
VERILATOR_PATH=/tools/verilator/bin/
if [ -e "$VERILATOR_PATH" ]; then
  ln -s $VERILATOR_PATH/* $BIN_DIR
else 
  echo "Unable to setup Verilator"
fi 

# Vivado 
echo "Setting up Vivado"
VIVADO_PATH=/tools/Xilinx/Vivado/
if [ -e "$VIVADO_PATH" ]; then
  source $VIVADO_PATH/*/settings64.sh 
else 
  echo "Unable to setup Vivado"
fi 

# python virtualenv
echo "Setting up Python virtual environment"
PRJNAME=example_cpu_env
python3 -m venv $PRJNAME
VENV_PATH=$PRJROOT/$PRJNAME/bin/activate 
if [ -e "VENV_PATH" ]; then
  source $VENV_PATH 
  pip3 install -r $PRJROOT/tools/env_setup/pip_requirements.txt -q
else 
  echo "Unable to setup virtual environment"
fi 

echo "Done"
