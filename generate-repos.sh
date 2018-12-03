#!/bin/sh
set -x

root=$(mktemp -d -t generate-repos-XXXXX)

cleanup() {
  rm -fr "$root"
}

trap cleanup SIGINT SIGTERM EXIT

#root="$(readlink -m "$(pwd)")"
echo $root

export sbt_global_base="$root/nix-sbt-global-base"
mkdir -p "$sbt_global_base"

export sbt_preloaded="$root/nix-sbt-preloaded"
mkdir -p "$sbt_preloaded"

export HOME="$root"

mkdir -p $root/.sbt
ln -sT "$sbt_preloaded" "$root/.sbt/preloaded"

mkdir -p $root/.coursier/cache/v1/


export JAVA_OPTS="-Dsbt.preloaded=$sbt_preloaded -Dsbt.global.base=$sbt_global_base -Dsbt.ivy.home=$root/.ivy2/ -Divy.home=$root/.ivy2/"
export COURSIER_CACHE="$root/.coursier"

nix-shell generate-repos.nix --run sbtix-gen-all2
