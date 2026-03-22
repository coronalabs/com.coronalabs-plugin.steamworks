#!/bin/bash

set -e

path=`dirname $0`


xcodebuild -project "$path/Plugin.xcodeproj" -configuration Release CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO clean

xcodebuild -project "$path/Plugin.xcodeproj" -configuration Release CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO

OUTPUT="$path/out"
mkdir -p "$OUTPUT"
cp ~/Library/Application\ Support/Corona/Simulator/Plugins/plugin_steamworks.dylib "$OUTPUT"
lipo ~/Library/Application\ Support/Corona/Simulator/Plugins/libsteam_api.dylib -thin x86_64  -output "$OUTPUT/libsteam_api.dylib"
