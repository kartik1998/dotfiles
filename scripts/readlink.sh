#!/bin/sh

TARGET=$1

cd $(dirname "$TARGET")
TARGET=$(basename "$TARGET")

while [ -L "$TARGET" ]
do
    TARGET=$(readlink "$TARGET")
    cd $(dirname "$TARGET")
    TARGET=$(basename "$TARGET")
done

DIR=`pwd -P`
RESULT="$DIR/$TARGET"

echo $RESULT
