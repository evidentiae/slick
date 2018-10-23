#!/bin/sh
nix-path -I nixpkgs="https://github.com/NixOS/nixpkgs.git 064cda9b1af515efe971fcb19c55dc21a1dd7131" \
nix-shell generate-repos.nix --run sbtix-gen-all
