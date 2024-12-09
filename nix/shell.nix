{ repoRoot, inputs, pkgs, lib, system }:

cabalProject:

let

  leiosPackages = inputs.ouroboros-leios.packages;
  emacsWithPackages = pkgs.emacs.pkgs.withPackages (epkgs: [ epkgs.agda2-mode pkgs.mononoki ]);

in 

{
  name = "nix-shell";

  packages = [
    leiosPackages.agdaWithDeps
    emacsWithPackages
  ];

  # Agda environment variables.
  env.AGDA_STDLIB = "${leiosPackages.agdaStdlib}/standard-library.agda-lib";
  env.AGDA_STDLIB_CLASSES = "${leiosPackages.agdaStdlibClasses}/standard-library-classes.agda-lib";
  env.AGDA_STDLIB_META = "${leiosPackages.agdaStdlibMeta}/standard-library-meta.agda-lib";
  env.AGDA_SETS = "${leiosPackages.agdaSets}/abstract-set-theory.agda-lib";
  env.AGDA_IOG_PRELUDE = "${leiosPackages.agdaIOGPrelude}/iog-prelude.agda-lib";

# prompt = "[ouroboros-leios]$ ";

  welcomeMessage = ''
  Welcome to Ouroboros Leios!

  Locations of Agda libraries:
    ${leiosPackages.agdaStdlib}/standard-library.agda-lib
    ${leiosPackages.agdaStdlibClasses}/standard-library-classes.agda-lib
    ${leiosPackages.agdaStdlibMeta}/standard-library-meta.agda-lib
    ${leiosPackages.agdaSets}/abstract-set-theory.agda-lib
    ${leiosPackages.agdaIOGPrelude}/iog-prelude.agda-lib

  Run 'emacs' to edit .agda files.
  '';

  # shellHook = "";

  tools = {
    # haskellCompilerVersion = cabalProject.args.compiler-nix-name;
    # cabal-fmt = null;
    # cabal-install = null;
    # haskell-language-server = null;
    # haskell-language-server-wrapper = null;
    # fourmolu = null;
    # hlint = null;
    # stylish-haskell = null;
    # ghcid = null;
    # shellcheck = null;
    # prettier = null;
    # editorconfig-checker = null;
    # nixpkgs-fmt = null;
    # optipng = null;
    # purs-tidy = null;
  };

  # scripts = {
  #   foo = {
  #      description = "";
  #      group = "general";
  #      enabled = true;
  #      exec = ''
  #        echo "Hello, World!"
  #      '';
  #    };
  # };

  # preCommit = {
  #   cabal-fmt.enable = false;
  #   cabal-fmt.extraOptions = "";
  #   stylish-haskell.enable = false;
  #   stylish-haskell.extraOptions = "";
  #   fourmolu.enable = false;
  #   fourmolu.extraOptions = "";
  #   hlint.enable = false;
  #   hlint.extraOptions = "";
  #   shellcheck.enable = false;
  #   shellcheck.extraOptions = "";
  #   prettier.enable = false;
  #   prettier.extraOptions = "";
  #   editorconfig-checker.enable = false;
  #   editorconfig-checker.extraOptions = "";
  #   nixpkgs-fmt.enable = false;
  #   nixpkgs-fmt.extraOptions = "";
  #   optipng.enable = false;
  #   optipng.extraOptions = "";
  #   purs-tidy.enable = false;
  #   purs-tidy.extraOptions = "";
  # };

}
