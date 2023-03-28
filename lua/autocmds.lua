local M = {}
function M.cmp_toggle()
    if vim.g.cmp_disable_enable_toggle == true then
        vim.g.cmp_disable_enable_toggle = false
        print('autocomplete is OFF')
    else
        vim.g.cmp_disable_enable_toggle = true
        print('autocomplete is ON')
    end
end

vim.api.nvim_buf_create_user_command(0, "CmpToggle", M.cmp_toggle, {})

return M
