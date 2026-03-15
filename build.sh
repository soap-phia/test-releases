#!/usr/bin/env bash
set -e

mkdir -p out

# Create a file under 2GB (~1GB); use -0 (store, no compression) so the zip
# itself is the target size regardless of data compressibility.
echo "Creating small test file (~1GB)..."
dd if=/dev/zero of=/tmp/small.bin bs=1M count=1024
zip -0 out/small.zip /tmp/small.bin
rm -f /tmp/small.bin

# Create a file over 2GB (~2.1GB)
echo "Creating large test file (~2.1GB)..."
dd if=/dev/zero of=/tmp/large.bin bs=1M count=2150
zip -0 out/large.zip /tmp/large.bin
rm -f /tmp/large.bin

echo "Done. Files in out/:"
ls -lh out/
