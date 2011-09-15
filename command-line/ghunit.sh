#!/bin/bash -e

PROJECT_DIR=`cd $(dirname $0)/../DiceGame; pwd`

cd "$PROJECT_DIR"
GHUNIT_CLI=1 WRITE_JUNIT_XML=YES xcodebuild -target GHUnitTest -configuration Debug -sdk iphonesimulator build
