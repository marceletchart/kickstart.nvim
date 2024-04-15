return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    -- Use Telescope as UI
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    -- keymapping harpoon
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<leader>hm', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
    -- vim.keymap.set('n', '<leader>hm', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set('n', '<leader>hh', function()
      harpoon:list():next()
    end)
    vim.keymap.set('n', '<leader>hl', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<leader>h1', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<leader>h2', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<leader>h3', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<leader>h4', function()
      harpoon:list():select(4)
    end)
    vim.keymap.set('n', '<leader>hda', function()
      harpoon:list():clear()
    end)
    vim.keymap.set('n', '<leader>hdd', function()
      harpoon:list():remove()
    end)
    vim.keymap.set('n', '<leader>hd1', function()
      harpoon:list():removeAt(1)
    end)
    vim.keymap.set('n', '<leader>hd2', function()
      harpoon:list():removeAt(2)
    end)
    vim.keymap.set('n', '<leader>hd3', function()
      harpoon:list():removeAt(3)
    end)
    vim.keymap.set('n', '<leader>hd4', function()
      harpoon:list():removeAt(4)
    end)
  end,
}
