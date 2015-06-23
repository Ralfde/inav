#!/bin/bash

targets=("PUBLISHMETA=True" "RUNTESTS=True" \
"TARGET=CC3D" "TARGET=CC3D OPBL=yes" "TARGET=CHEBUZZF3" "TARGET=CJMCU" \
"TARGET=EUSTM32F103RC" "TARGET=SPRACINGF3" "TARGET=NAZE" "TARGET=NAZE32PRO" \
"TARGET=OLIMEXINO" "TARGET=PORT103R" "TARGET=SPARKY" "TARGET=STM32F3DISCOVERY" \
"TARGET=ALIENWIIF1" "TARGET=ALIENWIIF3")

#fake a travis build environment
export TRAVIS_BUILD_NUMBER=$(date +%s)
export BUILDNAME=fake_travis
export TRAVIS_REPO_SLUG=$USER/simulated

for target in "${targets[@]}"
do
	unset RUNTESTS PUBLISHMETA TARGET OPBL
	eval "export $target"
	make clean
	./.travis.sh
done
