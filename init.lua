local username = os.getenv("USER")

if (username ~= 'land') then
    require 'pluginInstall'
    require 'keybindings'
    require 'plugins'
    require 'options'
else
    print("neovim cannot be used in land account! Please use your own account.")
end
