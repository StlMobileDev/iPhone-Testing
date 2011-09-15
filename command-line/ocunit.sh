#!/bin/bash -e

PROJECT_DIR=`cd $(dirname $0)/../DiceGame; pwd`

xcodebuild -workspace "$PROJECT_DIR"/DiceGame.xcodeproj/project.xcworkspace -scheme BuiltInLogicUnitTest -sdk iphonesimulator
