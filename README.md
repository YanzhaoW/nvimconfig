## How to setup (in GSI server):
**_ATTENTION: DON'T USE THIS SETUP IN LAND ACCOUNT!_**
### step 1:
Add the neovim executable to the `PATH` environment:
```shell
export PATH="/u/land/software/neovim/bin:$PATH"
```
This command needs to be executed every time when you log in to the GSI server.

If you want it to be executed automatically, please add it to your .bashrc (in case you use bash) with:
```shell
echo "export PATH="/u/land/software/neovim/bin:$PATH" >> $HOME/.bashrc
```

### step 2:
Pull this repository inside the folder `~/.config/` as `nvim`. Or it can be done with:
```shell
git clone https://github.com/YanzhaoW/nvimconfig.git $HOME/.config/nvim
```

## step 3:
Open any C++ files and it's ready to go.

## Important keybindings:

**Normal mode:**

|   Mappings            |       Action                              |
|-----------------------|-------------------------------------------|
|   `<Space>ff`         |search file with name                      |                      
|   `<Space>fg`         |grep in whole project                      |
|   `<Space>e`          |show error/warning message                 |
|   `]d`                |go to next error/warning                   |
|   `[d`                |go to previous error/warning               |
|   `<Space>xx`         |toggle error/warning messages window       |
|   `ga`                |auto fix the code                          |
|   `K`                 |show hover information                     |
|   `<Space>rn`         |rename variable/class/function             |
|   `gD`                |go to declaration                          |
|   `gd`                |go to definition                           |
|   `<Space>f`          |format the whole file                      |
|   `<Space>tc`         |toggle autocompletion                      |
|   `gcc`               |comment the current line                   |

Some other keybindings can also be found in [keybindings.lua](lua/keybindings.lua).

For the complete information about the keybindings, please visit the github website of different plugins:

- [nvim-config](https://github.com/neovim/nvim-lspconfig)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [mason](https://github.com/williamboman/mason.nvim)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [comment](https://github.com/numToStr/Comment.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

## Troubleshooting
If you encounter problems during the usage, please perform the following steps:

1. Restart neovim

2. Pull the latest configuration
    ```shell
    cd $HOME/.config/nvim && git pull origin master
    ```
3. Delete the cache files
    ```shell
    rm -rf $HOME/.local/share/nvim
    ```
    and run neovim again.

If you still have problems, please create an [issue](https://github.com/YanzhaoW/nvimconfig/issues) in this github page.
