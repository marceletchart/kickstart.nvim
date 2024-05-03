return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended. To see nerdfont icons.
    'MunifTanjim/nui.nvim',
  },
  config = function()
    vim.keymap.set('n', '<Leader>ft', ':Neotree filesystem reveal left<CR>')
  end,
}
