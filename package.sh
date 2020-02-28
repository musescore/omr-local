#!/bin/bash

PRG="$0"
PLATFORM=$1
VERSION=$2

if [ "$VERSION" = "" ]; then
    echo not set version
    exit 1
fi

PLATFORM_PREFIX=""
if [ "$PLATFORM" = "linux" ]; then
    PLATFORM_PREFIX="lin"
elif [ "$PLATFORM" = "windows" ]; then
    PLATFORM_PREFIX="win"
elif [ "$PLATFORM" = "macos" ]; then
    PLATFORM_PREFIX="mac"
fi

if [ "$PLATFORM_PREFIX" = "" ]; then
    echo unknown platform: $PLATFORM
    exit 1
fi

SAVED="`pwd`"
cd "`dirname \"$PRG\"`/." >/dev/null
ROOT_DIR="`pwd -P`"
cd "$SAVED" >/dev/null

BUILD_DIR=$ROOT_DIR/build/$PLATFORM_PREFIX

echo clear BUILD_DIR: $BUILD_DIR

rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR
mkdir -p $BUILD_DIR/audiveris/$PLATFORM_PREFIX

cp -v $ROOT_DIR/make_avs_$PLATFORM_PREFIX.sh $BUILD_DIR/make_avs_$PLATFORM_PREFIX.sh
cp -v $ROOT_DIR/README.md $BUILD_DIR/README.md
cp -v $ROOT_DIR/VERSION $BUILD_DIR/VERSION

cp -v -r $ROOT_DIR/audiveris/$PLATFORM_PREFIX $BUILD_DIR/audiveris

REL_PREFIX=_$VERSION
REL_PREFIX=$PLATFORM$REL_PREFIX

echo REL_PREFIX: $REL_PREFIX

cd "$BUILD_DIR"

zip -r -9 avsomr_$REL_PREFIX.zip \
    make_avs_$PLATFORM_PREFIX.sh \
    README.md \
    VERSION \
    audiveris/$PLATFORM_PREFIX

echo done: $BUILD_DIR/avsomr_$REL_PREFIX.zip



