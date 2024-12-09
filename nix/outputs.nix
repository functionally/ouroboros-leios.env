{ repoRoot, inputs, pkgs, lib, system }:

let
  project = repoRoot.nix.project;
  leios = inputs.ouroboros-leios.packages;
in
  [
    (
      builtins.removeAttrs project.flake [ "apps" "cabalProject" "checks" ]
    )
    {
      packages = {
        inherit (leios) agdaIOGPrelude agdaSets agdaStdlib agdaStdlibClasses agdaStdlibMeta agdaWithDeps leiosSpec;
      };
    }
  ]
