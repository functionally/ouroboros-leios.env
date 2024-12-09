{ repoRoot, inputs, pkgs, system, lib }:

let

  cabalProject' = pkgs.haskell-nix.cabalProject' ({ pkgs, config, ... }:
    let
      isCross = pkgs.stdenv.hostPlatform != pkgs.stdenv.buildPlatform;
    in
     {
       src = inputs.ouroboros-leios;
       shell.withHoogle = false;
       inputMap = {
         "https://chap.intersectmbo.org/" = inputs.iogx.inputs.CHaP;
       };
       name = "ouroboros-leios";
       compiler-nix-name = lib.mkDefault "ghc98";
     });
  cabalProject = cabalProject'.appendOverlays [ ];

  project = lib.iogx.mkHaskellProject {
    inherit cabalProject;
    shellArgs = repoRoot.nix.shell;
  };

in

  project
