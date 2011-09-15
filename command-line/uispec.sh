#!/bin/bash -e

DIR=`cd $(dirname $0); pwd`
PROJECT_DIR=`cd "$DIR"/../DiceGame; pwd`
OUTPUT_DIR="$DIR"/output

rm -rf "$OUTPUT_DIR"
mkdir "$OUTPUT_DIR"

cd "$PROJECT_DIR"
xcodebuild -target DiceGameUISpec -configuration Debug -sdk iphonesimulator build CONFIGURATION_BUILD_DIR="$OUTPUT_DIR"
killall -9 "iPhone Simulator"
"$DIR"/iphonesim launch "$OUTPUT_DIR"/DiceGame.app 
