return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },

    config = function()
        -- Define the NotifyBackground highlight group with the color #24273a
        vim.api.nvim_set_hl(0, 'NotifyBackground', { bg = "#24273a" })

        -- Setup Noice with LSP and other configurations
        require("noice").setup({
            lsp = {
                -- Override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },

            presets = {
                bottom_search = true,   -- Use a classic bottom cmdline for search
                command_palette = false, -- Position the cmdline and popupmenu together
                long_message_to_split = true, -- Long messages will be sent to a split
                inc_rename = false, -- Enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- Add a border to hover docs and signature help
            },

            lsp_progress = {
                enabled = false,
            },

            notify = {
                background_colour = "#24273a",
            },
        })
    end
}

