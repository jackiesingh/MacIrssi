#!/bin/bash

test -r /sw/bin/init.sh && . /sw/bin/init.sh

if [ ! -e configure ]; then
  echo "Please run inside the irssi directory."
  exit 1
fi

if [ "x$ACTION" == "xclean" ]; then
  echo "warning: skipping configure, clean requested."
  exit 0
fi

VERSION=`pl < ../Info.plist | perl -ne 'while (<STDIN>) { print $1 if ($_ =~ /CFBundleVersion\s+=\s+"(.*?)"/); }'`

if [[ ( -e config.xcode ) && ( -e Makefile ) && "$CONFIGURATION" != "" ]]; then
  if grep -q "$CONFIGURATION-$TARGET_NAME" config.xcode; then
		exit 0
  fi 
fi

[ -e config.xcode ] && echo "warning: build configuration changed, running ./configure"
[ ! -e config.xcode ] && echo "warning: config.xcode not found, running ./configure"

[ -e config.xcode ] && rm config.xcode

make distclean

CFLAGS="$CFLAGS -I$SRCROOT/Frameworks/MILibs/build/Release/include -DMACIRSSI_VERSION=\\\"$VERSION\\\""
LDFLAGS="$LDFLAGS -L$SRCROOT/Frameworks/MILibs/build/Release/lib"
PKG_CONFIG_PATH="$SRCROOT/Frameworks/MILibs/build/Release/lib/pkgconfig"
PATH="$PATH:$SRCROOT/Frameworks/MILibs/pkg-config-0.23"
PKG_CONFIG_PATH=$PKG_CONFIG_PATH ./configure $@
CONF_EXIT=$?

if [ "$CONF_EXIT" -eq "0" ]; then
  echo "warning: successful ./configure executed, cleaning irssi build tree."
  make clean
  echo "$CONFIGURATION-$TARGET_NAME" > config.xcode
fi
exit $CONF_EXIT

