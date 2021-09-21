#!/bin/bash
#
# (c) Lutfi Akdag (aka Mbtt) - 2021
# GM9 Pro OBB fix and prebuilt kernel auto-patcher
#

cd ..

echo "Applying OBB fix"
cd frameworks/native
git remote add hirqiz https://github.com/DevOtag-Open-Source/android_frameworks_native
git fetch hirqiz eleven
git cherry-pick 9465dde

cd ../..

echo "Copying prebuilt files and patches"
cp -r GM9PRO_Sprout_Patcher/prebuilt device/GM/GM9PRO_sprout/prebuilt
cp -r GM9PRO_Sprout_Patcher/patches device/GM/GM9PRO_sprout/patches

cd device/GM/GM9PRO_sprout

echo "Applying patches"
#git apply patches/0001-Force-prebuilt.patch
#git apply patches/0002-GM9PRO_sprout-Add-prebuilt-kernel.patch
git apply patches/0003-GM9PRO_sprout-Redefine-wifi-module-path.patch
git apply patches/0001-Copy-wlan-module-to-vendor-due-to-prebuilt-kernel.patch
#git apply patches/0001-Define-prebuilt-kernel-path.patch

echo "Exiting in 5 seconds."
read -n 1 -t 5
if [ $? == 0 ]; then
    exit
fi
