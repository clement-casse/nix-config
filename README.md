# Nix Flake for macOS Configuration

## References

Introduction to nix-darwin to manage macOS with nix:

- [Setting up Nix on macOS](https://nixcademy.com/posts/nix-on-macos/)

Also, the following sources have been used to find the key and values to setup macOS-related configuration:

- The website [macos-defaults.com](https://macos-defaults.com) has been used to browse some setting that can be tweaked with nix-darwin.
- The website [daiderd.com](https://daiderd.com/nix-darwin/manual/index.html) exposes an exhaustive documentation for nix darwin options.
- The blog serie [`#nix-on-mac` on davi.sh](https://davi.sh/blog/tags/nix-on-mac/) reviews the step of adopting nix-darwin to manage a macOS device with nix.
- The [blog post *Nix-Darwin Launch Agents*](https://www.danielcorin.com/til/nix-darwin/launch-agents/) to install services as *launch Agents*.
- The [blog post *Tidying up your `$HOME` with Nix*](https://juliu.is/tidying-your-home-with-nix/) covers step by step how to use home-manager (no `nix-darwin` involved)

Some similar projects on GitHub from peoples having similar needs:

- [`github.com/zmre/nix-config`](https://github.com/zmre/nix-config) a Nix config exposed as a flake design with MacOS in mind.
- [`github.com/ryan4yin/nix-darwin-kickstarter`](https://github.com/ryan4yin/nix-darwin-kickstarter) shows a reference of some advanced uses of nix to configure macOS laptops.
- [`codeberg.org/samuelsung/nixos-config`](https://codeberg.org/samuelsung/nixos-config) a complete and well-writen nix config.
- [`llakala/nixos`](https://github.com/llakala/nixos/tree/main) has a nice firefox configuration.

Other references regarding the content of the configuration:

- [How Core Git Developers Configure Git](https://blog.gitbutler.com/how-git-core-devs-configure-git/)
