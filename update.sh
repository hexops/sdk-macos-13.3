#!/usr/bin/env bash
set -ex

rm -rf ./root ./MacOSX13.3.sdk
mkdir -p MacOSX13.3.sdk
cp -R /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX13.3.sdk/* ./MacOSX13.3.sdk/
cp -R /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX13.3.sdk/* ./MacOSX13.3.sdk/

# Remove unnecessary files (570M -> 112M)
rm -rf MacOSX13.3.sdk/usr/include/apache2
rm -rf MacOSX13.3.sdk/usr/share/man/
rm -rf MacOSX13.3.sdk/System/PrivateFrameworks/
rm -rf MacOSX13.3.sdk/System/Library/PrivateFrameworks
rm -rf MacOSX13.3.sdk/usr/lib/swift
rm -rf MacOSX13.3.sdk/System/iOSSupport/usr/lib/swift
rm -rf MacOSX13.3.sdk/System/Library/Perl/

rm -rf MacOSX13.3.sdk/System/Library/Frameworks/MusicKit.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/TabularData.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/RealityFoundation.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/CreateML.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/SwiftUI.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/Ruby.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/Python.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/SwiftUI.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/Combine.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/Accelerate.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/WebKit.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/Python.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/RealityKit.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/AVFoundation.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/Intents.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/CoreTelephony.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/Quartz.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/OpenCL.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/CryptoKit.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/DriverKit.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/Tcl.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/Tk.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/IOBluetooth.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/DiscRecording.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/JavaScriptCore.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/HIDDriverKit.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/GameKit.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/SceneKit.framework
rm -rf MacOSX13.3.sdk/System/Library/Frameworks/WidgetKit.framework

mv MacOSX13.3.sdk root

# Remove reexported libraries section from all tbd files. These have absolute paths that zld would
# not be able to resolve unless sysroot was set.
# See https://github.com/hexops/mach/issues/108
go build ./strip-reexported.go 
find root/System -type f -name "*.tbd" -print0 | xargs -P128 -n1 -0 -- ./strip-reexported
