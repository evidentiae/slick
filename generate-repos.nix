let

  nixpkgs = builtins.fetchTarball {
    url = https://github.com/NixOS/nixpkgs/archive/064cda9b1af515efe971fcb19c55dc21a1dd7131.tar.gz;
    sha256 = "155h4yd6p9azjy6jjyx0zccm253iqxz6si4ys256g6ybqfqqzzra";
  };

  pkgs = import nixpkgs {};

  sbtixDir = pkgs.fetchFromGitHub {
    owner = "teozkr";
    repo = "Sbtix";
    rev = "5277d96745afcc04a0873102f4a5f80cfc68fa23";
    sha256 = "17h2ijb50q76al72hpggv35bbqiayyzvybmfwyx1cr5xzlpvzcqh";
  };

  sbtix-tool = pkgs.callPackage "${sbtixDir}/sbtix-tool.nix" {};

in

pkgs.runCommand "generate-repos" {
  buildInputs = [ sbtix-tool ];
} ""
