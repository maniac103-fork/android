#!/bin/bash

function add_remotes()
{
	git remote add cyanogen git://github.com/CyanogenMod/$1.git
	git remote add quarx git://github.com/Quarx2k/$1.git
}

function merge_upstream()
{
	git fetch $1
	git merge remotes/$1/gingerbread
}

function do_package()
{
	pushd $1
	add_remotes $2
	merge_upstream cyanogen
	merge_upstream quarx
	git push
	popd
}

do_package android android
do_package device/motorola/jordan android_device_motorola_umts_jordan
