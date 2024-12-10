return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup({
            options = {
                theme = 'dracula',
                icons_enabled = true,
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_b = {
                    {
                        'branch',  -- Keep the branch component
                        icon = '',  -- Custom Git icon (change this to any icon you prefer)
                    },
                },
            },
        })
    end
}
