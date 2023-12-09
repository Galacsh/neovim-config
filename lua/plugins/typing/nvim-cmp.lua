local function use_luasnip_snippets(args)
  require("luasnip").lsp_expand(args.body)
end

-- show icons inside completion
local function kind_with_icon(icons)
  return function(_, item)
    if icons[item.kind] then
      item.kind = icons[item.kind] .. item.kind
    end
    return item
  end
end

--[[
# Action helpers

* intellij_select
* jump_or_select
--]]
local function intellij_select()
  local cmp = require("cmp")
  return function(fallback)
    if cmp.visible() then
      local entry = cmp.get_selected_entry()
      if not entry then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        cmp.confirm()
      end
    else
      fallback()
    end
  end
end

local function jump_or_select()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  return function(fallback)
    if cmp.visible() then
      local entry = cmp.get_selected_entry()
      if not entry then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        cmp.confirm()
      end
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    else
      fallback()
    end
  end
end

--[[
# Map mode with action

* show_completions: i, s, c
* select_next: i, s, c
* select_previous: i, s, c
* scroll_docs_down: i, s
* scroll_docs_up: i, s
* abort: i, s, c
* abort_and_fallback: i, s, c
* simple_select: i, s
* select
  * jump_or_select: i, s
  * intellij_select: c
* replace: i, s, c
--]]
local mode_action = {}

function mode_action.show_completions()
  local cmp = require("cmp")
  return cmp.mapping(cmp.mapping.complete(), { "i", "s", "c" })
end

function mode_action.select_next()
  local cmp = require("cmp")
  local select_next_item = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })
  return cmp.mapping(select_next_item, { "i", "s", "c" })
end

function mode_action.select_previous()
  local cmp = require("cmp")
  local select_prev_item = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
  return cmp.mapping(select_prev_item, { "i", "s", "c" })
end

function mode_action.scroll_docs_down()
  local cmp = require("cmp")
  return cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "s" })
end

function mode_action.scroll_docs_up()
  local cmp = require("cmp")
  return cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "s" })
end

function mode_action.abort()
  local cmp = require("cmp")
  return cmp.mapping(cmp.mapping.abort(), { "i", "s", "c" })
end

function mode_action.abort_and_fallback()
  local cmp = require("cmp")
  local abort = function(fallback)
    cmp.abort()
    fallback()
  end
  return cmp.mapping(abort, { "i", "s", "c" })
end

function mode_action.simple_select()
  local cmp = require("cmp")
  return cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "s" })
end

function mode_action.select()
  local cmp = require("cmp")
  return cmp.mapping({
    i = jump_or_select(),
    s = jump_or_select(),
    c = intellij_select(),
  })
end

function mode_action.replace()
  local cmp = require("cmp")
  local confirm = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
  return cmp.mapping(confirm, { "i", "s", "c" })
end

--[[
# nvim-cmp configuration
--]]
return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdLineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
      local icons = IconPack.cmp

      return {
        experimental = { ghost_text = false },
        snippet = { expand = use_luasnip_snippets },
        formatting = { format = kind_with_icon(icons) },
        completion = { completeopt = "menu,menuone,noinsert" },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = cmp.config.sources(
          { { name = "nvim_lsp" }, { name = "luasnip" }, { name = "path" } },
          { { name = "buffer" } }
        ),
      }
    end,
    config = function(_, opts)
      -- key & mode & action mapping
      local mappings = {
        ["<c-n>"] = mode_action.select_next(),
        ["<c-p>"] = mode_action.select_previous(),
        ["<c-u>"] = mode_action.scroll_docs_up(),
        ["<c-d>"] = mode_action.scroll_docs_down(),
        ["<c-space>"] = mode_action.show_completions(),
        ["<esc>"] = mode_action.abort(),
        ["<cr>"] = mode_action.simple_select(),
        ["<s-cr>"] = mode_action.replace(),
        ["<c-cr>"] = mode_action.abort_and_fallback(),
        ["<tab>"] = mode_action.select(),
      }
      opts.mapping = mappings

      local cmp = require("cmp")
      cmp.setup(opts)

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = mappings,
        sources = cmp.config.sources({ { name = "buffer" } }),
      })

      cmp.setup.cmdline(":", {
        mapping = mappings,
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
      })
    end,
  }
}
