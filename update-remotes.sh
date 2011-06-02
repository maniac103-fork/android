#!/bin/bash

function do_package()
{
	pushd $1
	for r in $2; do
		git fetch $r
		git merge $r/$3
	done
	if [ "$4" = "push" ]; then
		git push
	fi
	popd
}

do_package android "cyanogen" gingerbread push
do_package device/motorola/jordan "quarx" gingerbread push
do_package frameworks/base "cyanogen quarx" gingerbread push
do_package hardware/ti "quarx" master push
do_package packages/apps/Phone "cyanogen quarx" gingerbread push
do_package vendor/cyanogen "cyanogen quarx" gingerbread push
do_package packages/apps/Camera "cyanogen" gingerbread
do_package packages/apps/Settings "cyanogen" gingerbread
do_package packages/apps/Torch "cyanogen" gingerbread

