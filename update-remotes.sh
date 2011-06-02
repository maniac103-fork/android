#!/bin/bash

function merge_upstream()
{
	git fetch $1
	git merge remotes/$1/gingerbread
}

function do_package()
{
	pushd $1
	for r in $2; do
		git fetch $r
		git merge $r/gingerbread
	done
	if [ "$3" = "push" ]; then
		git push
	fi
	popd
}

do_package android "cyanogen" push
do_package device/motorola/jordan "quarx" push
do_package frameworks/base "cyanogen quarx" push
do_package hardware/ti "quarx" push
do_package packages/apps/Phone "cyanogen quarx" push
do_package vendor/cyanogen "cyanogen quarx" push
do_package packages/apps/Camera "cyanogen"
do_package packages/apps/Settings "cyanogen"
do_package packages/apps/Torch "cyanogen"

