# <p align="center"> 🎉 Saki </p>

[![NixOS](https://img.shields.io/badge/NixOS-Configuration-5277C3.svg?logo=nixos&logoColor=white)](https://nixos.org/)
[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Build Status](https://img.shields.io/github/actions/workflow/status/HeartBlin/Saki/verify.yaml?branch=master&logo=github)](https://github.com/HeartBlin/Saki/actions/workflows/verify.yaml)

> My personal NixOS configuration. Unstable as I change things abruptly.

## ✨ Overview

This repository contains my personal NixOS configuration, managed with [flake-parts](https://github.com/hercules-ci/flake-parts).

> [!NOTE]
> The configuration loosely follows the [dendritic](https://github.com/mightyiam/dendritic) pattern for better organization and maintainability.

## 📂 Project Structure

```
├── flake.nix          # Main entry point for NixOS configuration
├── machines/          # Machine-specific configurations
└── modules/
    ├── cli/           # Modules that declare CLI programs
    ├── core/          # System modules
    ├── gui/           # Modules that declare GUI programs
    └── parts/         # Flake parts
```

## 🔍 Resources

Configurations that I got <b><i>inspired</i></b> from:

| Repository | Author |
|------------|--------|
| [NixOS-Configuration](https://github.com/TheMaxMur/NixOS-Configuration) | <b>TheMaxMur</b> |
| [dotfiles](https://github.com/fufexan/dotfiles) | <b>fufexan</b> |
| [yuki](https://github.com/raexera/yuki) | <b>raexera</b> |
| [infra](https://github.com/perstarkse/infra) | <b>perstarkse</b> |
| [Zaphkiel](https://github.com/Rexcrazy804/Zaphkiel) | <b>Rexcrazy804</b> |
| [NixOhEss](https://gitlab.com/fazzi/nixohess) | <b>fazzi</b> |
| [nyx](https://github.com/NotAShelf/nyx) <sub><i>archive</i></sub>  | <b>NotAShelf</b> |

## 📄 License

This project is licensed under the MIT License - see the <b>[LICENSE](LICENSE)</b> file for details.
