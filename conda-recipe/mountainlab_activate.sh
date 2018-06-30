#!/bin/bash -e

# bash notes:
# - unlike 'export', 'declare -x' allows for variable expansion on left side of =
# - ${!varname} is indirect expansion. if A=B, B=10, then ${!A} evaluates to 10

# This will be default mountainlab dir (equivalent to ~/.mountainlab) for this install
mldir_conda="$CONDA_PREFIX"/etc/mountainlab 

# save for debugging
declare -x mldir_conda_"$CONDA_SHLVL"="$mldir_conda" # unlike 'export', declare -x allows for variable expansion

# Name of var to save/load previous ML_CONFIG_DIRECTORY, keyed to $CONDA_SHLVL, 
# which is unique to each level of the env stack
saved_mlconfig_varname=ML_CONFIG_DIRECTORY_PREV_CONDA_SHLVL_"$CONDA_SHLVL"

echo ===previous ML_CONFIG_DIRECTORY="$ML_CONFIG_DIRECTORY"
echo ===CONDA_SHLVL="$CONDA_SHLVL"
echo ===mldir_conda="$mldir_conda"
echo ===saved_mlconfig_varname="$saved_mlconfig_varname"

# if ML_CONFIG_DIRECTORY exists, we haven't already saved it (avoid overwriting on multiple activation), save it
if [ -n "$ML_CONFIG_DIRECTORY" ] && [ -z "${!saved_mlconfig_varname}" ]; then
    declare -x "$saved_mlconfig_varname"="$ML_CONFIG_DIRECTORY"
    echo === Saving previous ML_CONFIG_DIRECTORY \( \'"${!saved_mlconfig_varname}"\' \) as var "$saved_mlconfig_varname"
else
    echo === not saving...
    if [ -n "$ML_CONFIG_DIRECTORY" ]; then
	echo     ... \'"$saved_mlconfig_varname"\' is non-empty \( set to \'"${!saved_mlconfig_varname}"\' \)
    else
	echo     ... ML_CONFIG_DIRECTORY tests empty.
    fi
fi
echo === Setting ML_CONFIG_DIRECTORY to \'"$mldir_conda"\'
export ML_CONFIG_DIRECTORY="$mldir_conda"
