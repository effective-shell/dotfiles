# dotfiles

A simple, minimal set of configuration files for Bash-like shells and Zsh. Based on the dotfiles created in the www.effective-shell.com book.

## Installation

Clone the repository and run the `install.sh` script:

```sh
git clone git://github.com/effective-shell/dotfiles.git
cd dotfiles && ./install.sh
```

This will create a symlink at `~/.shell.sh`. This file sets some basic shell configuration, and sources all of the files in the [`./shell.d`](./shell.d/) folder.

If you have a `~/.bashrc` file, the `~/.shell.sh` file will be sourced at the end of the file. If you have a `~/.zshrc` the `~/.shell.sh` file will be sourced at the end of the file.

## Uninstallation

Use the `uninstall.sh` script to remove the symlinks and lines that source from the shell configuration files:

```sh
cd dotfiles && ./uninstall.sh
```

## Features

These dotfiles are deliberately basic, you can use them as a starting point for your own shell configuration!

Each of the features in the dotfiles is described in [Part 5 of the book Effective Shell](https://effective-shell.com/docs/part-5-building-your-toolkit/). This section of the book describes how to manage shell configuration with dotfiles.

**set_ps1**

You can use the `set_ps1` command in any shell that has sourced these dotfiles to change your command prompt. These prompts will work consistently in Bash-like shells as well as Zsh. An example is shown below, the initial style is `git` (which was previously named `dwmkerr` as you can see in the screenshot), which is then changed to `debian`:

![Screenshot showing the 'git' style for the command prompt](./docs/set-ps1-dwmkerr-style.png)

**gpr**

The `gpr` (Git Pull Reqeuest) function pushes the current branch to `origin` and opens a pull request if a pull request link is provided in the Git output - this works on GitHub, GitLab and BitBucket:

![Screenshot showing the git pull request function](./docs/git-pull-request.png)
