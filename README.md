# Minimal NixOS Configuration for ASUS Laptops with NVIDIA GPUs


![Screenshot from 2024-03-29 13-58-48](https://github.com/sjhaleprogrammer/nixos/assets/60676867/260ec810-9c87-4303-a8fb-af466c582683)


This guide provides a minimal NixOS configuration for ASUS laptops equipped with NVIDIA GPUs. Follow these steps for a clean installation.

## Installation Steps

1. Change directory to `/etc/nixos/`:

    ```
    cd /etc/nixos/
    ```

2. Adjust ownership (replace `samuel` with your username):

    ```
    sudo chown -R samuel:users .
    ```

3. Remove old configuration files:

    ```
    rm *
    ```

4. Install `git`:

    ```
    nix-shell -p git
    ```

5. Initialize a Git repository:

    ```
    git init
    ```

6. Connect the repository to this configuration repository:

    ```
    git remote add origin https://github.com/sjhaleprogrammer/nixos.git
    ```

7. Pull the configuration:

    ```
    git pull origin master
    ```

8. Generate hardware configuration:

    ```
    nixos-generate-config
    ```

9. Update flake and switch to the new configuration:

    ```
    nix --extra-experimental-features "nix-command flakes" flake update

    sudo nixos-rebuild switch --impure
    ```

After executing the switch command, flakes will be enabled, and you can utilize the `update.sh` script for updates.

## Uninstallation

To uninstall, follow these steps:

1. Remove all files in `/etc/nixos/` including the hidden `.git` folder.

2. Generate a new configuration:

    ```
    nixos-generate-config
    ```

This will revert your system to its previous state before NixOS installation.

Feel free to adjust and customize the configuration according to your requirements.

**Note:** Ensure you have necessary backups before proceeding with the uninstallation process.

