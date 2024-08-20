## How to setup (in GSI server):
**_ATTENTION: DON'T USE THIS SETUP IN LAND ACCOUNT!_**
### step 1:
Add the neovim executable to the `PATH` environment:
```shell
export PATH="/u/land/software/neovim/latest/bin:$PATH"
```
This command needs to be executed every time when you log in to the GSI server.

If you want it to be executed automatically, please add it to your .bashrc (in case you use bash) with:
```shell
echo "export PATH=\"/u/land/software/neovim/latest/bin:$PATH\"" >> $HOME/.bashrc
```

If you want to know whether you have done it correctly, please use:
```sh
nvim
```
You should see the neovim is launched with the command.

### step 2:
Pull this repository inside the folder `~/.config/` as `nvim`. Or it can be done with:
```shell
git clone https://github.com/YanzhaoW/nvimconfig.git $HOME/.config/nvim
```

### step 3 (for R3BRoot or cmake project):
To fully utilize clangd, you need to link a file called `compile_commands.json` to the root folder of `R3BRoot` with:
```sh
cd ${R3BRoot}
ln -s ${Build_Dir}/compile_commands.json ./compile_commands.json
```
Here `${R3BRoot}` is the root directory path of R3BRoot and ${Build_Dir} is the build directory path of R3BRoot.

### step 4:
Open any C++ files with:
```sh
nvim filename.cxx
```
Neovim starts to download multiple plugins and language servers. Once they are finished, restart the neovim and it's ready to go.

## Important keybindings:

**Normal mode:**

|   Mappings            |       Action                              |
|-----------------------|-------------------------------------------|
|   `<Space>ff`         |search file with name                      |                      
|   `<Space>fg`         |grep in whole project                      |
|   `<Space>fb`         |show all buffers                           |
|   `<Space>oo`         |switch between C++ source and header file  |
|   `<Ctrl-x>`          |toggle file and folder tree on the right   |
|   `<Space>e`          |show error/warning message                 |
|   `]d`                |go to next error/warning                   |
|   `[d`                |go to previous error/warning               |
|   `<Space>xx`         |toggle error/warning messages window       |
|   `ga`                |auto fix the code                          |
|   `K` or `<Shift-k>`  |show hover information                     |
|   `<Space>rn`         |rename variable/class/function             |
|   `gD`                |go to declaration                          |
|   `gd`                |go to definition                           |
|   `<Space>f`          |format the whole file                      |
|   `<Space>tc`         |toggle autocompletion                      |
|   `<Space>ti`         |toggle inlay hints                         |
|   `<Space>bb`         |go to last buffer                          |
|   `<Space>[num]`      |go to [num]th buffer                       |
|   `gcc`               |comment the current line                   |
|   `<Ctrl-l>`          |move the window focus right                |
|   `<Ctrl-h>`          |move the window focus left                 |
|   `<Ctrl-j>`          |move the window focus down                 |
|   `<Ctrl-k>`          |move the window focus up                   |

Some other keybindings can also be found in [keybindings.lua](lua/keybindings.lua).

For the complete information about the keybindings, please visit the github website of different plugins:

- [nvim-config](https://github.com/neovim/nvim-lspconfig)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [mason](https://github.com/williamboman/mason.nvim)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [comment](https://github.com/numToStr/Comment.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

## Important commands in Vim/NeoVim:
|   Commands            |       Action                              |
|-----------------------|-------------------------------------------|
|   `:bp`               |go to previous buffer                      |                      
|   `:bd`               |delete current buffer                      |
|   `:qa`               |quit all windows                           |
|   `:wa`               |write all windows                          |
|   `:wqa`              |write and quite all windows                |
|   `:sp`               |create a new window below                  |
|   `:vs`               |create a new window on the right           |
|   `:%s/foo/boo/gc`    |replace 'foo' with 'boo' in this buffer    |

## Troubleshooting
If you encounter problems during the usage, please try following steps:

1. Restart neovim

2. Pull the latest configuration
    ```shell
    cd $HOME/.config/nvim && git pull origin master
    ```
3. Delete the cache files
    ```shell
    rm -rf $HOME/.local/share/nvim
    rm -rf $HOME/.local/state/nvim
    ```
    and run neovim again.


If you encounter problems when updating the neovim configs, please go to `~/.config` folder and do:
```shell
rm -rf nvim
git clone https://github.com/YanzhaoW/nvimconfig.git $HOME/.config/nvim
```
If you still have problems, please create an [issue](https://github.com/YanzhaoW/nvimconfig/issues) in this github page.
