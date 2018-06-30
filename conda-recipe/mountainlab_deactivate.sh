mldir_conda=$CONDA_PREFIX/etc/mountainlab 

saved_mlconfig_varname=ML_CONFIG_DIRECTORY_save_shlvl_$CONDA_SHLVL

# if there's a saved ML_CONFIG_DIRECTORY, then recover it (uses indirect expansion)
if  [ ! -z ${!saved_mlconfig_varname} ]; then
    export ML_CONFIG_DIRECTORY=${!saved_mlconfig_varname}
    unset $saved_mlconfig_varname
fi
