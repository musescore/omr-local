#!/usr/bin/env sh

PRG="$0"
CMD=$1
FILE_PATH=$2
BUILD_DIR=$3

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`/." >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null

echo CMD: "$CMD"
if [ "$CMD" = "check" ]; then
  echo "check success"
  exit 0
fi

echo "=== prepare build ==="

FILE=${FILE_PATH##*/}
FILE_NAME="${FILE%.*}"

AUDIVERIS=$APP_HOME/audiveris/mac/run
ZIP=$APP_HOME/audiveris/mac/zip

echo "=== run orm and export === "
sh $AUDIVERIS -batch -export -output $BUILD_DIR $FILE_PATH

BUILD_PATH=$BUILD_DIR/$FILE_NAME

echo "=== run pack avs file === "
$ZIP -j $BUILD_PATH/$FILE_NAME.avs $BUILD_PATH/$FILE_NAME.mxl $BUILD_PATH/$FILE_NAME.omr

echo "\n"
echo "all done file: " $BUILD_PATH/$FILE_NAME.avs

