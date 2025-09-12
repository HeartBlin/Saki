# 🌸 Saki 🌸

[![NixOS](https://img.shields.io/badge/NixOS-Configuration-5277C3.svg?logo=nixos&logoColor=white)](https://nixos.org/)
[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

> My personal NixOS configuration, carefully crafted and continuously evolving.

## ✨ Overview

This repository contains my personal NixOS configuration, managed with [flake-parts](https://github.com/hercules-ci/flake-parts).

The configuration follows the [dendritic](https://github.com/mightyiam/dendritic) pattern for better organization and maintainability.

## 📂 Project Structure

```
├── flake.nix          # Main entry point for NixOS configuration
├── machines/          # Machine-specific configurations
├── modules/           # Modular configurations
│   ├── home/          # Home-manager modules
│   └── system/        # System-level modules
└── users/             # User-specific configurations
```

## 🔍 Resources

Configurations that served as inspiration:

| Repository | Author |
|------------|--------|
| [NixOS-Configuration](https://github.com/TheMaxMur/NixOS-Configuration) | TheMaxMur |
| [dotfiles](https://github.com/fufexan/dotfiles) | fufexan |
| [yuki](https://github.com/raexera/yuki) | raexera |
| [infra](https://github.com/perstarkse/infra) | perstarkse |
| [nyx](https://github.com/NotAShelf/nyx) _<sub>archive</sub>_  | NotAShelf |

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
