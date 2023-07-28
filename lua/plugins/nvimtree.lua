require 'nvim-tree'.setup {
    view = {
        side = 'right'
    },
    respect_buf_cwd = true,
    update_cwd = true,
    hijack_directories = {
        auto_open = false,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        ignore = false,
    },
    renderer = {
        icons = {
            git_placement = "after",
            show = {
                file = false,
            },
            glyphs = {
                folder = {
                    arrow_closed = "+",
                    arrow_open = "-",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "->",
                    symlink_open = "~>",
                },
            },
        },
    },
}
