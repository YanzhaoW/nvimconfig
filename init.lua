local username = os.getenv("USER")

if (username ~= 'land') then
    require 'pluginInstall'
    require 'plugins'
    require 'options'
    require 'autocmds'
    require 'keybindings'
else
    print("neovim cannot be used in land account! Please use your own account.")
end
