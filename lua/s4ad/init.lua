local M = {}
local c = require('s4ad.palette')
M.palette = c

function M.load()
  vim.cmd('highlight clear')
  if vim.fn.exists('syntax_on') == 1 then vim.cmd('syntax reset') end
  vim.o.termguicolors = true
  vim.o.background = 'light'
  vim.g.colors_name = 's4ad'

  local hl = function(name, value) vim.api.nvim_set_hl(0, name, value) end
  local groups = {
    Normal = { fg = c.fg, bg = c.bg }, NormalNC = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = c.white }, FloatBorder = { fg = c.border, bg = c.white },
    FloatTitle = { fg = c.blue, bg = c.white, bold = true },
    ColorColumn = { bg = c.surface }, CursorLine = { bg = c.surface },
    CursorColumn = { bg = c.surface }, CursorLineNr = { fg = c.accent, bold = true },
    LineNr = { fg = c.subtle }, SignColumn = { bg = c.bg },
    EndOfBuffer = { fg = c.bg }, NonText = { fg = c.border }, SpecialKey = { fg = c.subtle },
    Whitespace = { fg = c.border }, Conceal = { fg = c.muted },
    VertSplit = { fg = c.border }, WinSeparator = { fg = c.border },
    StatusLine = { fg = c.fg, bg = c.surface },
    StatusLineNC = { fg = c.muted, bg = c.surface },
    TabLine = { fg = c.muted, bg = c.surface },
    TabLineFill = { bg = c.surface }, TabLineSel = { fg = c.blue, bg = c.white, bold = true },
    Pmenu = { fg = c.fg, bg = c.white }, PmenuSel = { fg = c.blue, bg = c.selection, bold = true },
    PmenuSbar = { bg = c.surface }, PmenuThumb = { bg = c.border },
    Visual = { bg = c.selection }, VisualNOS = { bg = c.selection },
    Search = { fg = c.blue_muted, bg = c.selection }, IncSearch = { fg = c.white, bg = c.blue },
    CurSearch = { fg = c.white, bg = c.accent }, Substitute = { fg = c.white, bg = c.purple },
    MatchParen = { fg = c.accent, bg = c.selection, bold = true },
    Folded = { fg = c.muted, bg = c.surface }, FoldColumn = { fg = c.subtle, bg = c.bg },
    Directory = { fg = c.blue }, Title = { fg = c.blue, bold = true },
    Question = { fg = c.green }, MoreMsg = { fg = c.green }, WarningMsg = { fg = c.yellow },
    ErrorMsg = { fg = c.red, bold = true }, ModeMsg = { fg = c.blue },
    DiffAdd = { bg = c.green_bg }, DiffChange = { bg = c.yellow_bg },
    DiffDelete = { bg = c.red_bg }, DiffText = { bg = c.selection, bold = true },
    Added = { fg = c.green }, Changed = { fg = c.yellow }, Removed = { fg = c.red },
    SpellBad = { undercurl = true, sp = c.red }, SpellCap = { undercurl = true, sp = c.yellow },
    SpellRare = { undercurl = true, sp = c.purple }, SpellLocal = { undercurl = true, sp = c.cyan },
    QuickFixLine = { bg = c.selection }, WildMenu = { fg = c.white, bg = c.blue },

    Comment = { fg = c.muted, italic = true }, Constant = { fg = c.purple },
    String = { fg = c.green }, Character = { fg = c.green }, Number = { fg = c.purple },
    Boolean = { fg = c.purple, bold = true }, Float = { fg = c.purple },
    Identifier = { fg = c.fg }, Function = { fg = c.blue },
    Statement = { fg = c.blue_muted }, Conditional = { fg = c.blue_muted },
    Repeat = { fg = c.blue_muted }, Label = { fg = c.blue }, Operator = { fg = c.fg },
    Keyword = { fg = c.blue_muted, bold = true }, Exception = { fg = c.red },
    PreProc = { fg = c.purple }, Include = { fg = c.blue }, Define = { fg = c.purple },
    Macro = { fg = c.purple }, PreCondit = { fg = c.purple },
    Type = { fg = c.cyan }, StorageClass = { fg = c.blue_muted },
    Structure = { fg = c.cyan }, Typedef = { fg = c.cyan },
    Special = { fg = c.blue }, SpecialChar = { fg = c.purple }, Tag = { fg = c.blue },
    Delimiter = { fg = c.muted }, SpecialComment = { fg = c.muted, italic = true },
    Debug = { fg = c.red }, Underlined = { underline = true },
    Error = { fg = c.red }, Todo = { fg = c.blue, bg = c.selection, bold = true },

    DiagnosticError = { fg = c.red }, DiagnosticWarn = { fg = c.yellow },
    DiagnosticInfo = { fg = c.blue }, DiagnosticHint = { fg = c.cyan },
    DiagnosticOk = { fg = c.green },
    DiagnosticUnderlineError = { undercurl = true, sp = c.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.cyan },
    DiagnosticVirtualTextError = { fg = c.red, bg = c.red_bg },
    DiagnosticVirtualTextWarn = { fg = c.yellow, bg = c.yellow_bg },
    DiagnosticVirtualTextInfo = { fg = c.blue, bg = c.surface },
    DiagnosticVirtualTextHint = { fg = c.cyan, bg = c.surface },
    LspReferenceText = { bg = c.selection }, LspReferenceRead = { bg = c.selection },
    LspReferenceWrite = { bg = c.selection, underline = true },
    LspSignatureActiveParameter = { fg = c.accent, bold = true },

    ['@comment'] = { link = 'Comment' }, ['@string'] = { link = 'String' },
    ['@string.escape'] = { fg = c.purple }, ['@string.regex'] = { fg = c.cyan },
    ['@character'] = { link = 'Character' }, ['@number'] = { link = 'Number' },
    ['@number.float'] = { link = 'Float' }, ['@boolean'] = { link = 'Boolean' },
    ['@constant'] = { link = 'Constant' }, ['@constant.builtin'] = { fg = c.purple, bold = true },
    ['@variable'] = { fg = c.fg }, ['@variable.builtin'] = { fg = c.purple },
    ['@variable.parameter'] = { fg = c.fg }, ['@variable.member'] = { fg = c.fg },
    ['@property'] = { fg = c.fg }, ['@field'] = { fg = c.fg },
    ['@function'] = { link = 'Function' }, ['@function.call'] = { link = 'Function' },
    ['@function.builtin'] = { fg = c.blue }, ['@function.method'] = { fg = c.blue },
    ['@function.method.call'] = { fg = c.blue },
    ['@constructor'] = { fg = c.cyan }, ['@operator'] = { fg = c.fg },
    ['@keyword'] = { link = 'Keyword' }, ['@keyword.function'] = { fg = c.blue_muted },
    ['@keyword.return'] = { fg = c.blue_muted, bold = true },
    ['@keyword.import'] = { fg = c.blue_muted },
    ['@keyword.conditional'] = { fg = c.blue_muted },
    ['@keyword.repeat'] = { fg = c.blue_muted },
    ['@keyword.exception'] = { fg = c.red },
    ['@type'] = { link = 'Type' }, ['@type.builtin'] = { fg = c.cyan },
    ['@type.definition'] = { fg = c.cyan }, ['@module'] = { fg = c.cyan },
    ['@namespace'] = { fg = c.cyan }, ['@attribute'] = { fg = c.purple },
    ['@punctuation.delimiter'] = { fg = c.muted },
    ['@punctuation.bracket'] = { fg = c.fg },
    ['@punctuation.special'] = { fg = c.blue },
    ['@tag'] = { fg = c.blue }, ['@tag.attribute'] = { fg = c.purple },
    ['@tag.delimiter'] = { fg = c.muted },
    ['@markup.heading'] = { fg = c.blue, bold = true },
    ['@markup.link'] = { fg = c.blue, underline = true },
    ['@markup.link.url'] = { fg = c.cyan, underline = true },
    ['@markup.strong'] = { bold = true }, ['@markup.italic'] = { italic = true },
    ['@markup.raw'] = { fg = c.green }, ['@markup.list'] = { fg = c.blue },
    ['@diff.plus'] = { fg = c.green }, ['@diff.minus'] = { fg = c.red },
    ['@diff.delta'] = { fg = c.yellow },

    GitSignsAdd = { fg = c.green }, GitSignsChange = { fg = c.yellow },
    GitSignsDelete = { fg = c.red }, GitSignsTopdelete = { fg = c.red },
    GitSignsChangedelete = { fg = c.yellow }, GitSignsUntracked = { fg = c.green },
    GitSignsAddNr = { fg = c.green }, GitSignsChangeNr = { fg = c.yellow },
    GitSignsDeleteNr = { fg = c.red },
    GitSignsAddLn = { bg = c.green_bg }, GitSignsChangeLn = { bg = c.yellow_bg },
    GitSignsDeleteLn = { bg = c.red_bg },
    GitSignsAddInline = { bg = c.green_bg, fg = c.green },
    GitSignsChangeInline = { bg = c.yellow_bg, fg = c.yellow },
    GitSignsDeleteInline = { bg = c.red_bg, fg = c.red },
    GitSignsAddLnInline = { bg = c.green_bg },
    GitSignsChangeLnInline = { bg = c.yellow_bg },
    GitSignsDeleteLnInline = { bg = c.red_bg },
    GitSignsAddVirtLnInline = { bg = c.green_bg },
    GitSignsChangeVirtLnInline = { bg = c.yellow_bg },
    GitSignsDeleteVirtLnInline = { bg = c.red_bg },
    GitSignsAddVirtLn = { fg = c.green, bg = c.green_bg },
    GitSignsChangeVirtLn = { fg = c.yellow, bg = c.yellow_bg },
    GitSignsDeleteVirtLn = { fg = c.red, bg = c.red_bg },
    GitSignsAddPreview = { bg = c.green_bg },
    GitSignsDeletePreview = { bg = c.red_bg },
    GitSignsCurrentLineBlame = { fg = c.subtle, italic = true },

    BufferTabpageFill = { bg = c.surface }, BufferTabpages = { fg = c.blue, bg = c.surface },
    BufferTabpagesSep = { fg = c.border, bg = c.surface },
    BufferOffset = { fg = c.muted, bg = c.surface },
    BufferScrollArrow = { fg = c.accent, bg = c.surface },
  }

  -- barbar: all four buffer states, including git status and diagnostic markers.
  local statuses = {
    Current = { fg = c.blue_muted, bg = c.white, bold = true },
    Visible = { fg = c.fg, bg = c.surface_alt },
    Alternate = { fg = c.fg, bg = c.surface },
    Inactive = { fg = c.muted, bg = c.surface },
  }
  for state, style in pairs(statuses) do
    local bg = style.bg
    groups['Buffer' .. state] = style
    local parts = {
      Index = c.subtle, Number = c.subtle, Icon = style.fg,
      Btn = c.muted, Mod = c.blue, ModBtn = c.blue,
      Pin = c.purple, PinBtn = c.purple, Target = c.accent,
      ADDED = c.green, CHANGED = c.yellow, DELETED = c.red,
      ERROR = c.red, WARN = c.yellow, INFO = c.blue, HINT = c.cyan,
    }
    for part, fg in pairs(parts) do
      groups['Buffer' .. state .. part] = { fg = fg, bg = bg }
    end
    groups['Buffer' .. state .. 'Sign'] = { fg = c.border, bg = bg }
    groups['Buffer' .. state .. 'SignRight'] = { fg = c.border, bg = bg }
  end

  -- Gitsigns staged signs are intentionally quieter than unstaged signs.
  for _, kind in ipairs({ 'Add', 'Change', 'Delete', 'Topdelete', 'Changedelete', 'Untracked' }) do
    groups['GitSignsStaged' .. kind] = { fg = c.subtle }
  end

  for name, def in pairs(groups) do hl(name, def) end
  vim.g.terminal_color_0 = c.fg
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.purple
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.muted
  vim.g.terminal_color_8 = c.subtle
  vim.g.terminal_color_9 = c.red_bright
  vim.g.terminal_color_10 = c.green_bright
  vim.g.terminal_color_11 = c.yellow_bright
  vim.g.terminal_color_12 = c.accent
  vim.g.terminal_color_13 = c.purple_bright
  vim.g.terminal_color_14 = c.cyan_bright
  vim.g.terminal_color_15 = '#D6D6DC'
end
return M
