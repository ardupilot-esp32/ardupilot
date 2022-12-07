#!/bin/bash

# script to build cygwin binaries for using in MissionPlanner
# the contents of artifacts directory is uploaded to:
# https://firmware.ardupilot.org/Tools/MissionPlanner/sitl/

# the script assumes you start in the root of the ardupilot git tree

set -x

# TOOLCHAIN=i686-pc-cygwin
TOOLCHAIN=x86_64-pc-cygwin
GPP_COMPILER="${TOOLCHAIN}-g++"

git config --global --add safe.directory /cygdrive/d/a/ardupilot/ardupilot

rm -rf artifacts
mkdir artifacts

(
    python ./waf --color yes --toolchain $TOOLCHAIN --board sitl configure 2>&1
    python ./waf rover 2>&1
) | tee artifacts/build.txt

$GPP_COMPILER -print-sysroot

# copy both with exe and without to cope with differences
# between windows versions in CI
cp -v build/sitl/bin/ardurover artifacts/ArduPlane.elf.exe
cp -v build/sitl/bin/ardurover artifacts/ArduCopter.elf.exe
cp -v build/sitl/bin/ardurover artifacts/ArduHeli.elf.exe
cp -v build/sitl/bin/ardurover artifacts/ArduRover.elf.exe
cp -v build/sitl/bin/ardurover artifacts/ArduSub.elf.exe

cp -v build/sitl/bin/ardurover artifacts/ArduPlane.elf
cp -v build/sitl/bin/ardurover artifacts/ArduCopter.elf
cp -v build/sitl/bin/ardurover artifacts/ArduHeli.elf
cp -v build/sitl/bin/ardurover artifacts/ArduRover.elf
cp -v build/sitl/bin/ardurover artifacts/ArduSub.elf

#cp -v /usr/$TOOLCHAIN/sys-root/usr/bin/*.dll artifacts/

ls -lrt /usr/*.dll
ls -lrt /usr/bin/*.dll
ls -lrt build/sitl/bin/*.dll
#ls -lrt /usr/$TOOLCHAIN/sys-root/usr/bin/*.dll
#ls -lrt $(cygpath ${SYSTEMROOT})/system32/*.dll
#ls -lrt $(cygpath ${SYSTEMROOT})/*.dll

#cp -v /usr/*.dll artifacts/
cp -v /usr/bin/*.dll artifacts/
#cp -v build/sitl/bin/*.dll artifacts/
#cp -v /usr/$TOOLCHAIN/sys-root/usr/bin/*.dll artifacts/
#cp -v $(cygpath ${SYSTEMROOT})/system32/*.dll artifacts/
#cp -v $(cygpath ${SYSTEMROOT})/*.dll artifacts/

# Find all cyg*.dll files returned by cygcheck for each exe in artifacts
# and copy them over
for exe in artifacts/*.exe; do 
    echo $exe
    cygcheck $exe | grep -oP 'cyg[^\s\\/]+\.dll' | while read -r line; do
      cp -v /usr/bin/$line artifacts/
    done
done


cp  /usr/bin/cygwin1.dll artifacts/
cp  /usr/bin/cyggcc_s-seh-1.dll artifacts/
cp  /usr/bin/cygstdc++-6.dll artifacts/

cp  -vH /usr/bin/cygwin1.dll artifacts/
cp  -vH /usr/bin/cyggcc_s-seh-1.dll artifacts/
cp  -vH /usr/bin/cygstdc++-6.dll artifacts/

git log -1 > artifacts/git.txt
ls -l artifacts/
