return{
    "Dan7h3x/neaterm.nvim",
    branch = "stable",
    event = "VeryLazy",
    opts = {
      float_width = 0.7,
      float_height = 0.7,
      keymaps = {
      toggle = '<A-t>',
      new_vertical = '<A-\\>',
      new_horizontal = '<A-->',
      close = '<A-d>',
      move_up = '<C-A-Up>',
      move_down = '<C-A-Down>',
      move_left = '<C-A-Left>',
      move_right = '<C-A-Right>',
      },
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
    },
}
