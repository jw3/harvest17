#!/usr/bin/env bash

readonly bindir=/usr/local/bin
readonly etcdir=/usr/local/etc


dl_bin() {
  dl "$bindir" "$1"
}

dl_etc() {
  dl "$etcdir" "$1"
}

dl() {
  cd "$1"; curl -O "$2"
}

dl_bin "https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh"


chmod +x "$bindir/*"
