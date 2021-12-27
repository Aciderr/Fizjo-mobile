#!/bin/bash
set -e

perl -i -pe 's/^(version:\s+\d+\.\d+\.\d+\+)(\d+)$/$1.($2+1)/e' ../pubspec.yaml

flutter build appbundle --release
cp -r ../build/app/outputs/bundle/release/app-release.aab ../built-apps/