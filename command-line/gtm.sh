#!/bin/bash -e

PROJECT_DIR=`cd $(dirname $0)/../DiceGame; pwd`

cd "$PROJECT_DIR"
xcodebuild -target GTMUnitTest -sdk iphonesimulator -configuration Debug
