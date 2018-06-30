# Save previous state (use file in conda env to build a 'stack', env can be visited multiple times so key with CONDA_SHLVL)
declare -x mldir_conda=$CONDA_PREFIX/etc/mountainlab 
declare -x mldir_conda_$CONDA_SHLVL=$mldir_conda # save it for now

declare -x saved_mlconfig_varname=ML_CONFIG_DIRECTORY_save_shlvl_$CONDA_SHLVL

# if ML_CONFIG_DIRECTORY exists, and we haven't already saved it, save it (uses indirect expansion)
if [ ! -z $ML_CONFIG_DIRECTORY ] && [ -z ${!saved_mlconfig_varname} ]; then
    declare -x $saved_mlconfig_varname=$ML_CONFIG_DIRECTORY
    declare -x ML_CONFIG_DIRECTORY=$mldir_conda
fi