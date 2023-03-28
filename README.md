## How to setup (in GSI server):
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
