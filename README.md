Flycheck Elixir Dogma
=====

This repository contains an flycheck checker for linting elixir with dogma.

### Pre-requisites

For this checker to work properly, you will need `mix` installed, and you will
need a global installation of `mix dogma`.  No currently released version of
dogma works well with this package, so you may need a specific commit.

For example:

    git clone https://github.com/lpil/dogma
    cd dogma
    git checkout 3011c59
    mix archive.build
    mix archive.install

You should now be able to install the emacs package with your preferred
configuration method.  You can register the package by calling:

    (use-package flycheck-elixir-dogma
                 :defer t
                 :init (add-hook 'elixir-mode-hook 'flycheck-elixir-dogma-setup))

### Spacemacs

If you are using spacemacs, you can find a [contrib layer for using
flycheck-elixir-dogma
here](https://github.com/obmarg/dotfiles/tree/master/spacemacs.d/elixir-dogma)
