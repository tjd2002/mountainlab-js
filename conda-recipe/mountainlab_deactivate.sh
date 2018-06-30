#!/bin/bash -e

# Name of var to save/load previous ML_CONFIG_DIRECTORY, keyed to $CONDA_SHLVL, 
# which is unique to each level of the env stack
saved_mlconfig_varname=ML_CONFIG_DIRECTORY_PREV_CONDA_SHLVL_"$CONDA_SHLVL"

# if there's a saved ML_CONFIG_DIRECTORY for this conda_shlvl (i.e. the current env),
# then recover it (uses indirect expansion)
if  [ -n "${!saved_mlconfig_varname}" ]; then
    export ML_CONFIG_DIRECTORY=${!saved_mlconfig_varname}
    unset $saved_mlconfig_varname # note indirection!
fi
unset mldir_conda_"$CONDA_SHLVL" # just here for debugging