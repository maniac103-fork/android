#!/bin/bash

function add_remote()
{
	pushd $1
	for r in $3; do
		if [ "$r" = "quarx" ]; then
			url="git://github.com/Quarx2k"
		elif [ "$r" = "cyanogen" ]; then
			url="git://github.com/CyanogenMod"
		elif [ "$r" = "review" ]; then
			url="ssh://review.cyanogenmod.com:29418/CyanogenMod"
		fi
		git remote rm $r
		git remote add $r $url/$2.git
	done
	if [ -n "$4" ]; then
		git checkout --track -b $4 myrepos/$4
	fi
	popd
}

if [ $# -ne 0 ]; then
	add_remote $1 $2 $3 $4
	exit 0
fi

add_remote system/bluetooth android_system_bluetooth "cyanogen" gingerbread
add_remote vendor/cyanogen android_vendor_cyanogen "quarx cyanogen review" gingerbread
add_remote android android "cyanogen" gingerbread
add_remote device/motorola/jordan android_device_motorola_umts_jordan "quarx" gingerbread
add_remote frameworks/base android_frameworks_base "quarx cyanogen review" gingerbread
add_remote hardware/ti android_hardware_ti "quarx" master
add_remote packages/apps/Phone android_packages_apps_Phone "quarx cyanogen review" gingerbread
add_remote packages/apps/Camera android_packages_apps_Camera "cyanogen"
add_remote packages/apps/Settings android_packages_apps_Settings "cyanogen"
add_remote packages/apps/Torch android_packages_apps_Torch "cyanogen"

