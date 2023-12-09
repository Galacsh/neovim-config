local misc = {
  dots = "󰇘",
}

local dap = {
  Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
  Breakpoint          = " ",
  BreakpointCondition = " ",
  BreakpointRejected  = { " ", "DiagnosticError" },
  LogPoint            = ".>",
}

local diagnostics = {
  Error = " ",
  Warn  = " ",
  Hint  = " ",
  Info  = " ",
}

local git = {
  added    = " ",
  modified = " ",
  removed  = " ",
}

local cmp = {
  Array         = " ",
  Boolean       = "󰨙 ",
  Class         = " ",
  Codeium       = "󰘦 ",
  Color         = " ",
  Control       = " ",
  Collapsed     = " ",
  Constant      = "󰏿 ",
  Constructor   = " ",
  Copilot       = " ",
  Enum          = " ",
  EnumMember    = " ",
  Event         = " ",
  Field         = " ",
  File          = " ",
  Folder        = " ",
  Function      = "󰊕 ",
  Interface     = " ",
  Key           = " ",
  Keyword       = " ",
  Method        = "󰊕 ",
  Module        = " ",
  Namespace     = "󰦮 ",
  Null          = " ",
  Number        = "󰎠 ",
  Object        = " ",
  Operator      = " ",
  Package       = " ",
  Property      = " ",
  Reference     = " ",
  Snippet       = " ",
  String        = " ",
  Struct        = "󰆼 ",
  TabNine       = "󰏚 ",
  Text          = " ",
  TypeParameter = " ",
  Unit          = " ",
  Value         = " ",
  Variable      = "󰀫 ",
}

local dashboard = {
  explorer = "󰀶 ",
  find_file = "󰥩 ",
  new_file = "󰈤 ",
  harpoon = "󰸖 ",
  recent_files = "󱔘 ",
  find_by_content = "󱩾 ",
  lazy = "󰒲 ",
  quit = "󰍃 ",
}

IconPack = {
  misc = misc,
  dap = dap,
  diagnostics = diagnostics,
  git = git,
  cmp = cmp,
  dashboard = dashboard,
}
