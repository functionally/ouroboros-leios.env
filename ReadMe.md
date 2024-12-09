# Nix flake for an Ouroboros Leios development environment


## Compiling Haskell

```console
$ nix develop

$ cabal update

$ cabal build all
```


## Building packages or executables

Build `xyz` among the following . . .

- `agdaIOGPrelude`
- `agdaSets`
- `agdaStdlib`
- `agdaStdlibClasses`
- `agdaStdlibMeta`
- `agdaWithDeps`
- `leiosSpec`
- `ols`

. . . with the command . . .

```console
$ nix build .#xyz
```
