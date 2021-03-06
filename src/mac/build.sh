#!/bin/bash

set -e

path=`dirname $0`


xcodebuild -project "$path/Plugin.xcodeproj" -configuration Release clean

xcodebuild -project "$path/Plugin.xcodeproj" -configuration Release

OUTPUT="$path/out"
mkdir -p "$OUTPUT"
cp ~/Library/Application\ Support/Corona/Simulator/Plugins/plugin_steamworks.dylib "$OUTPUT"
lipo ~/Library/Application\ Support/Corona/Simulator/Plugins/libsteam_api.dylib -thin x86_64  -output "$OUTPUT/libsteam_api.dylib"
