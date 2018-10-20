#/bin/bash
rm -rf build/*.tf
mkdir -p build
cd .terrafunk
python3 build.py
cd ../build
terraform $@
