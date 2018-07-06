repo init -u https://github.com/dilbrent/android-LineageOS.git -b lineage-15.1
git clone https://github.com/dilbrent/android-manifests.git
git checkout origin/manta-lineage-15.1
cp -r android-manifests/local_manifests .repo/

#The next line takes forever.  Don't run it unless all the preceeding commands have been verified.
#repo sync


