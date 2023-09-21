#!/bin/bash

punckt_curl_gzip "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" "cs"
chmod +x "$PUNKT_STORAGE/cs"
"$PUNKT_STORAGE/cs" "setup"

