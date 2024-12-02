return {
    "stevearc/oil.nvim",
    config = function()
        local oil = require("oil")
        oil.setup({
            float = {
                max_width = 100,
                max_height = 40,
            },
            view_options = {
                show_hidden = true,
            },
        })
        vim.keymap.set("n", "-", oil.toggle_float, {})
    end,
}
