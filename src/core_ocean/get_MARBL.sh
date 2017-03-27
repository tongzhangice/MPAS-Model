#!/bin/bash

## MARBL Tag for build
MARBL_TAG=marbl0.11.0

## Subdirectory in MARBL repo to use
MARBL_SUBDIR=src

## Available protocols for acquiring MARBL source code
MARBL_GIT_HTTP_ADDRESS=https://github.com/NCAR/MARBL.git
MARBL_GIT_SSH_ADDRESS=git@github.com:NCAR/MARBL.git
MARBL_SVN_ADDRESS=https://github.com/NCAR/MARBL/tags
MARBL_WEB_ADDRESS=https://github.com/NCAR/MARBL/archive

GIT=`which git`
SVN=`which svn`
PROTOCOL=""

# MARBL exists. Check to see if it is the correct version.
# Otherwise, flush the directory to ensure it's updated.
if [ -d MARBL ]; then

	if [ -d .MARBL_all/.git ]; then
		cd .MARBL_all
		CURR_TAG=$(git rev-parse --short HEAD)
		cd ../
		if [ "${CURR_TAG}" == "${MARBL_TAG}" ]; then
			echo "MARBL version is current. Skip update"
		else
			unlink MARBL
			rm -rf .MARBL_all
		fi
	else
		unlink MARBL
		rm -rf .MARBL_all
	fi
fi

# MARBL Doesn't exist, need to acquire souce code
# If might have been flushed from the above if, in the case where it was svn or wget that acquired the source.
if [ ! -d MARBL ]; then
	if [ -d .MARBL_all ]; then
		rm -rf .MARBL_all
	fi

	if [ "${GIT}" != "" ]; then
		echo " ** Using git to acquire MARBL source. ** "
		PROTOCOL="git ssh"
		git clone ${MARBL_GIT_SSH_ADDRESS} .MARBL_all &> /dev/null
		if [ -d .MARBL_all ]; then
			cd .MARBL_all
			git checkout ${MARBL_TAG} &> /dev/null
			cd ../
			ln -sf .MARBL_all/${MARBL_SUBDIR} MARBL
		else
			git clone ${MARBL_GIT_HTTP_ADDRESS} .MARBL_all &> /dev/null
			PROTOCOL="git http"
			if [ -d .MARBL_all ]; then
				cd .MARBL_all
				git checkout ${MARBL_TAG} &> /dev/null
				cd ../
				ln -sf .MARBL_all/${MARBL_SUBDIR} MARBL
			fi
		fi
	elif [ "${SVN}" != "" ]; then
		echo " ** Using svn to acquire MARBL source. ** "
		PROTOCOL="svn"
		svn co ${MARBL_SVN_ADDRESS}/${MARBL_TAG} .MARBL_all &> /dev/null
		ln -sf .MARBL_all/${MARBL_SUBDIR} MARBL
	else
		echo " ** Using wget to acquire MARBL source. ** "
		PROTOCOL="svn"
		MARBL_ZIP_DIR=`echo ${MARBL_TAG} | sed 's/v//g'`
		MARBL_ZIP_DIR="MARBL-src-${MARBL_ZIP_DIR}"
		if [ ! -e .${MARBL_TAG}.zip ]; then
			wget ${MARBL_WEB_ADDRESS}/${MARBL_TAG}.zip &> /dev/null
		fi
		unzip ${MARBL_TAG}.zip &> /dev/null
		mv ${MARBL_TAG}.zip .${MARBL_TAG}.zip
		mv ${MARBL_ZIP_DIR} .MARBL_all
		ln -sf .MARBL_all/${MARBL_SUBDIR} MARBL
	fi
fi

if [ ! -d MARBL ]; then
	echo " ****************************************************** "
	echo " ERROR: Build failed to acquire MARBL source."
	echo ""
	echo " Please ensure your proxy information is setup properly for"
	echo " the protocol you use to acquire MARBL."
	echo ""
	echo " The automated script attempted to use: ${PROTOCOL}"
	echo ""
	if [ "${PROTOCOL}" == "git http" ]; then
		echo " This protocol requires setting up the http.proxy git config option."
	elif [ "${PROTOCOL}" == "git ssh" ]; then
		echo " This protocol requires having ssh-keys setup, and ssh access to git@github.com."
		echo " Please use 'ssh -vT git@github.com' to debug issues with ssh keys."
	elif [ "${PROTOCOL}" == "svn" ]; then
		echo " This protocol requires having svn proxys setup properly in ~/.subversion/servers."
	elif [ "${PROTOCOL}" == "wget" ]; then
		echo " This protocol requires having the http_proxy and https_proxy environment variables"
		echo " setup properly for your shell."
	fi
	echo ""
	echo " ****************************************************** "
fi
