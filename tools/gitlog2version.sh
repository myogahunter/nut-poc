#!/bin/bash
echo "[gitlog2version] Getting version from git log..."
git describe --tags --long 2>/dev/null || echo "0.0.1-0-g$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"
