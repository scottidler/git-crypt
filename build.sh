#!/bin/bash

# Build script for git-crypt with OpenSSL 3.0 compatibility
# This script ensures git-crypt builds correctly with modern OpenSSL versions

set -e  # Exit on any error

echo "Building git-crypt with OpenSSL 3.0 compatibility..."

# Clean any previous build artifacts
echo "Cleaning previous build..."
make clean

# Build with OpenSSL API compatibility flag
echo "Building with OPENSSL_API_COMPAT flag..."
make CXXFLAGS="-Wall -pedantic -Wno-long-long -O2 -std=c++11 -DOPENSSL_API_COMPAT=0x10100000L"

echo "Build completed successfully!"
echo "To install system-wide, run: sudo make install"
echo "Or to install to a custom location: make install PREFIX=/path/to/install" 