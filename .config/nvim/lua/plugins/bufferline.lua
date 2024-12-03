return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        vim.opt.termguicolors = true

        require("bufferline").setup({
            options = {
                numbers = "none", -- or "ordinal" or "buffer_id"
                close_command = "bdelete! %d",  -- Function to run when closing a buffer
                right_mouse_command = "bdelete! %d", -- Function for right-click to close
                left_mouse_command = "buffer %d",  -- Left-click to switch buffer
                indicator = {
                    icon = "▎", -- Indicator symbol
                    style = "icon", -- Indicator style can be "icon" or "underline"
                },
                buffer_close_icon = "", -- Icon for the close button
                modified_icon = "●", -- Icon for modified buffers
                close_icon = "", -- Close icon
                show_buffer_icons = true, -- Show buffer icons
                show_buffer_close_icons = true, -- Show close icons on buffers
                show_tab_indicators = true, -- Show tab indicators
                persist_buffer_sort = true, -- Keep buffers sorted even when switching tabs
                separator_style = "none", -- Separator style between buffers
                enforce_regular_tabs = false, -- Don't enforce regular tabs
            }
        })

        -- Key mappings for switching tabs
        vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

        -- Key mappings for reordering tabs
        vim.api.nvim_set_keymap('n', '<Leader>bn', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })  -- Move buffer to the right
        vim.api.nvim_set_keymap('n', '<Leader>bp', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })  -- Move buffer to the left
    end
}

