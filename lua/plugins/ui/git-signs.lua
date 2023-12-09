return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = buffer
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', '<leader>gn', function()
          if vim.wo.diff then return '<leader>gn' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = "Next hunk" })

        map('n', '<leader>gp', function()
          if vim.wo.diff then return '<leader>gp' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = "Prev hunk" })

        -- Actions
        map('n', '<leader>gh', gs.preview_hunk, { desc = "Hunk" })
        map('n', '<leader>gs', gs.stage_hunk, { desc = "Stage hunk" })
        map('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
          { desc = "Stage hunk" })
        map('n', '<leader>gr', gs.reset_hunk, { desc = "Reset hunk" })
        map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
          { desc = "Reset hunk" })
        map('n', '<leader>gu', gs.undo_stage_hunk, { desc = "Undo stage hunk" })
        map('n', '<leader>gS', gs.stage_buffer, { desc = "Stage buffer" })
        map('n', '<leader>gR', gs.reset_buffer, { desc = "Reset buffer" })
        map('n', '<leader>gb', function() gs.blame_line({ full = true }) end, { desc = "Blame line" })
        map('n', '<leader>gd', gs.diffthis, { desc = "Diff" })
      end,
    },
  }
}
