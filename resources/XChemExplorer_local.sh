#!/bin/bash
  
# export XChemExplorer_DIR=$( dirname "${BASH_SOURCE[0]}" )
export XChemExplorer_DIR="/XChemExplorer"
echo $XChemExplorer_DIR

source $XChemExplorer_DIR/setup-scripts/xce.setup-sh
module unload ccp4
source $XChemExplorer_DIR/../ccp4/bin/ccp4.setup-sh

export PATH=$PATH:/ccp4-7.0/bin

ccp4-python $XChemExplorer_DIR/XChemExplorer.py

