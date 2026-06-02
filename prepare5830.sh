sudo apt-get update
sudo apt-get install git-core gitk git-gui curl lvm2 thin-provisioning-tools python3-pkg-resources python3-virtualenv python3-oauth2client xz-utils python3.11
cd  && git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH="$PATH:${PWD}/depot_tools"
mkdir openFyde/src && cd openFyde/src
repo init -u https://chromium.googlesource.com/chromiumos/manifest.git -b release-R132-16093.B
repo sync -j$(nproc)
mkdir -p .repo/local_manifests
cd .repo/local_manifests
git clone https://github.com/openFyde/manifest.git -b r132-openFyde .
cd ../..
repo sync -j$(nproc)
cros_workon --board=amd64-openfyde start sys-kernel/chromeos-kernel-5_4
./chromite/bin/cros_sdk 
cd /mnt/host/source/src/third_party/kernel/v5.4
./chromeos/scripts/kernelconfig editconfig




