#!/bin/bash

set -e

mkdir -p output

PACKAGES=${ML_PACKAGE_SEARCH_DIRECTORY:-~/.mountainlab/packages}

mls-run $PACKAGES/ml_ms4alg/mlscripts/ms4_v1.ml \
	--inputs timeseries:dataset/raw.mda.prv geom:dataset/geom.csv \
	--outputs firings_out:output/firings.mda.prv \
	--parameters \
		samplerate:30000 \
		detect_sign:1 \
		adjacency_radius:-1 \
		detect_threshold:3 \
		filter:true whiten:true

ml-run-process ephys.compute_templates \
	--inputs timeseries:dataset/raw.mda.prv firings:output/firings.mda.prv \
	--outputs templates_out:output/templates.mda.prv \
	--parameters \
		clip_size:150

