# ⚡️🐟 zoxide.fish

[Fish](https://fishshell.com/) plugin for [zoxide](https://github.com/ajeetdsouza/zoxide).

Advantages over plain `zoxide init fish | source`:

-   Faster shell startup by _AOT_ initialization
-   Managed as a plugin, can be installed or disabled via plugin managers

## Installation

-   [plug.fish](https://github.com/kidonng/plug.fish)

    ```sh
    plug install kidonng/zoxide.fish
    ```

-   [Fisher](https://github.com/jorgebucaran/fisher)

    ```sh
    fisher install kidonng/zoxide.fish
    ```

## Config

zoxide.fish is configured via fish variables instead of [zoxide flags](https://github.com/ajeetdsouza/zoxide#flags).

### `$zoxide_cmd` controls aliases prefix (default: `z`)

-   Use a different prefix: `set -U zoxide_cmd j` (same as `zoxide init --cmd j`)
-   Disable predefined aliases: `set -U zoxide_cmd` (same as `zoxide init --no-aliases`)

### `$zoxide_hook` controls score increment

| zoxide                      | zoxide.fish                                      |
| --------------------------- | ------------------------------------------------ |
| `zoxide init --hook none`   | `set -U zoxide_hook`                             |
| `zoxide init --hook prompt` | `set -U zoxide_hook --on-event fish_prompt`      |
| `zoxide init --hook pwd`    | `set -U zoxide_hook --on-variable PWD` (default) |

Thanks to the flexibility of zoxide.fish, you can define custom hooks that is not available via `zoxide init` (e.g. `set -U zoxide_hook --on-event fish_postexec`).

## Environment variables

zoxide.fish also respects a few [environment variables](https://github.com/ajeetdsouza/zoxide#environment-variables) that are used by zoxide:

-   `$_ZO_ECHO`: When set to `1` (`set -U _ZO_ECHO 1`), zoxide.fish prints the matched directory before navigating to it.
-   `$_ZO_RESOLVE_SYMLINKS`: When set to `1` (`set -U _ZO_RESOLVE_SYMLINKS 1`), zoxide.fish will resolve symlinks before adding directories to the database.
