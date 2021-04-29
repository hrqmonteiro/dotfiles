local hiLinks = require"settings.apply".hiLinks
local highlights = require"settings.apply".highlights
local g = vim.g
local cmd = vim.cmd

g.nord_bold_vertical_split_line = 1
g.nord_bold = 1
g.nord_italic = 1
g.nord_italic_comments = 1
g.nord_underline = 1

cmd 'syntax enable'
cmd 'set termguicolors'
cmd 'colorscheme nord'

local colors = {
    nordbg = "#323846",
    nord1 = "#3B4252",
    nord0 = "#2E3440",
    nord2 = "#434C5E",
    nord3 = "#4C566A",
    nord3_bright = "#616E88",
    nord4 = "#D8DEE9",
    nord5 = "#E5E9F0",
    nord6 = "#ECEFF4",
    nord7 = "#8FBCBB",
    nord8 = "#88C0D0",
    nord9 = "#81A1C1",
    nord10 = "#5E81AC",
    nord11 = "#BF616A",
    nord12 = "#D08770",
    nord13 = "#EBCB8B",
    nord14 = "#A3BE8C",
    nord15 = "#B48EAD"
}

hiLinks({
    htmlTag = "htmlTagName",
    htmlEndTag = "htmlTagName",
    jsxTagName = "jsxComponentName",
    jsObjectKey = "StorageClass",
    jsVariableDef = "Number",
    jsStorageClass = "rustAttribute",
    jsFuncBlock = "rustPanic",
    jsExport = "typescriptBOMWindowMethod",
    jsImport = "typescriptBOMWindowMethod",
    jsFrom = "typescriptBOMWindowMethod",
    jsObjectValue = "Function",
    -- jsNull = "typescriptDecorator",
    -- jsBooleanTrue = "typescriptDecorator",
    -- jsBooleanFalse = "typescriptDecorator",
    --[[ BufferInactiveMod = "typescriptDecorator",
    BufferCurrentMod = "typescriptDecorator",
    BufferVisibleMod = "typescriptDecorator",
    BufferCurrent = "typescriptBOMWindowMethod",
    BufferVisible = "rustAttribute",
    BufferInactive = "rustAttribute",
    BufferTabpages = "Normal",
    BufferTabpageFill = "Normal", ]]
    elixirAtom = "Number",
    elixirFunctionDeclaration = "rustAttribute",
    elixirDefine = "typescriptBOMWindowMethod",
    elixirModuleDefine = "typescriptBOMWindowMethod",
    elixirBlockDefinition = "typescriptBOMWindowMethod",
    elixirAlias = "SpecialChar",
    elixirModuleDeclaration = "typescriptDecorator",
    elixirInclude = "rustEnum",
    elixirId = "Type",
    LspDiagnosticsVirtualTextError = "LspDiagnosticsError",
    LspDiagnosticsVirtualTextWarning = "LspDiagnosticsWarning",
    LspDiagnosticsVirtualTextInformation = "LspDiagnosticsInformation",
    LspDiagnosticsVirtualTextHint = "LspDiagnosticsHint"
})

highlights({
    cssTagName = {fg = colors.nord13, gui = "italic"},
    cssClassName = {fg = "#eda48d", gui = "italic"},
    jsGlobalObjects = {fg = "#eda48d", gui = "italic"},
    cssIndetifier = {fg = "#eda48d", gui = "italic"},
    rubyClass = {fg = colors.nord9, gui = "none"},
    rubyClassName = {fg = colors.nord4},
    rubyConstant = {fg = colors.nord8, gui = "bold"},
    rubyDefine = {fg = colors.nord9, gui = "bold,italic"},
    rubyIdentifier = {fg = colors.nord8},
    rubySymbol = {fg = colors.nord14, gui = "bold"},
    -- CursorLine = { bg = "#272C36"},
    CursorLineNr = {gui = "bold"},
    StatusLine = {bg = colors.nordbg},
    StatusLineNC = {bg = colors.nordbg},
    VertSplit = {fg = colors.nord0, bg = "none"},
    TelescopeBorder = {fg = colors.nord6},
    TelescopePromptBorder = {fg = colors.nord6},
    TelescopeResultsBorder = {fg = colors.nord6},
    TelescopePreviewBorder = {fg = colors.nord6},
    TelescopeSelection = {fg = colors.nord8, gui = "none"},
    TelescopeSelectionCaret = {fg = colors.nord6, gui = "none"},
    TelescopeMultiSelection = {fg = colors.nord8, gui = "none"},
    TelescopeMatching = {fg = colors.nord11},
    TelescopeNormal = {fg = colors.nord6, gui = "none"},
    TelescopePromptPrefix = {fg = colors.nord6, gui = "none"},
    LspDiagnosticsError = {fg = colors.nord11, gui = "bold,italic"},
    LspDiagnosticsWarning = {fg = colors.nord12, gui = "bold,italic"},
    LspDiagnosticsInformation = {fg = colors.nord13, gui = "bold,italic"},
    LspDiagnosticsHint = {fg = colors.nord8, gui = "bold,italic"},
    NeogitDiffAdd = {fg = colors.nord2, bg = "#394147"},
    NeogitDiffAddHighlight = {fg = colors.nord14, bg = "#454F4F"},
    NeogitDiffDelete = {fg = colors.nord2, bg = "#44414F"},
    NeogitDiffDeleteHighlight = {bg = "#524552", fg = colors.nord11},
    NeogitDiffDeleteRegion = {bg = colors.nord11, fg = colors.nord4},
    NeogitDiffContext = {fg = colors.nord2, bg = colors.nord1},
    NeogitDiffContextHighlight = {bg = colors.nord2, fg = colors.nord4},
    NeogitHunkHeader = {fg = "#4C5B6F", bg = "#3C4A61"},
    NeogitHunkHeaderHighlight = {fg = colors.nord0, bg = colors.nord8},
    NeogitBranch = {fg = colors.nord8, gui = "bold"},
    NeogitRemote = {fg = colors.nord14, gui = "bold"},
    NeogitStagedchanges = {fg = colors.nord8, gui = "bold"},
    NeogitUnstagedchanges = {fg = colors.nord8, gui = "bold"}, 
    NeogitUnstagedchangesRegion = {fg = colors.nord13, gui = "bold"},
    NeogitUntrackedfiles = {fg = colors.nord8, gui = "bold"},
    NeogitUnmergedInto = {fg = colors.nord8, gui = "bold"},
    NeogitFold = {gui = "none"},
    NeogitCommitMessage = {gui = "bold,italic"},
    NonText = {bg = colors.nord0, fg = colors.nord0, gui = "none"},
    PMenu = {bg = colors.nord1, fg = colors.nord4},
    PMenuSel = {bg = colors.nord8, fg = colors.nord3},
    NvimTreeFolderName = {fg = colors.nord4, gui = "bold"},
    NvimTreeFolderIcon = {fg = "#6C788F"},
    NvimTreeGitDirty = {fg = "#717883"},
    NvimTreeGitStaged = {fg = "#717883"},
    NvimTreeGitMerge = {fg = "#717883"},
    NvimTreeGitRenamed = {fg = "#717883"},
    NvimTreeGitNew = {fg = "#717883"},
    NvimTreeFileDirty = {fg = "#717883"},
    NvimTreeFileStaged = {fg = "#717883"},
    NvimTreeFileNew = {fg = "#717883"},
    NvimTreeFileRenamed = {fg = "#717883"},
    NvimTreeIndentMarker = {fg = "#4C566A"},
    NvimTreeRootFolder = {fg = colors.nord0},
    NvimTreeNormal = {bg = "#323846"},
    GitSignsAdd = {fg = colors.nord14},
    GitSignsAddNr = {fg = colors.nord14},
    GitSignsAddLn = {fg = colors.nord14},
    GitSignsChange = {fg = colors.nord13},
    GitSignsChangeNr = {fg = colors.nord13},
    GitSignsChangeLn = {fg = colors.nord13},
    GitSignsDelete = {fg = colors.nord11},
    GitSignsDeleteNr = {fg = colors.nord11},
    GitSignsDeleteLn = {fg = colors.nord11},
    SignColumn = {fg = colors.nord0, bg = colors.nord0},
    -- IndentBlanklineChar = {fg = "#4C566A", bg = colors.nord0},
    IndentBlanklineChar = {fg = colors.nord3},
    IndentLineCurrent = {fg = colors.nord9},
    IndentLineCurrent2 = {fg = colors.nord8},
    IndentLineCurrent3 = {fg = colors.nord14},
    DashboardHeader = {fg = "#1C2027"},
    DashboardCenter = {fg = "#717883"},
    DashboardShortcut = {fg = colors.nord1, bg = colors.nord8},
    MatchTag = { fg = colors.nord8, bg = colors.nord1, gui = "bold,underline"},
    BufferCurrent = { fg = colors.nord4, bg = colors.nord1, gui = "bold"},
    BufferCurrentIndex = { fg = colors.nord1, bg = colors.nord1},
    BufferCurrentIcon = {bg = colors.nord1},
    BufferCurrentSign = {fg = colors.nord1, bg = colors.nord1},
    BufferCurrentTarget = {bg = colors.nord0},
    BufferCurrentMod = {fg = colors.nord4, bg = colors.nord1, gui = "bold"},
    BufferIconSeparator = {fg = colors.nord0},
    BufferInactive = { fg = "#717883", bg = colors.nord0, gui = "bold"},
    BufferInactiveIcon = {fg = "#717883", bg = colors.nord0},
    BufferInactiveIndex = {fg = colors.nord0, bg = colors.nord0},
    BufferInactiveMod = {fg =  "#717883", bg = colors.nord0, gui = "bold"},
    BufferInactiveSign = {fg = colors.nord0, bg = colors.nord0},
    BufferTypeSeparator = {fg = colors.nord0, bg = colors.nord0},
    BufferTabpageFill = {fg = colors.nord0, bg = colors.nord0},
    BufferTabpages = {fg = colors.nord0, bg = colors.nord0},
    BufferVisible = {fg = colors.nord0, bg = colors.nord0},
    BufferVisibleIcon = {fg = colors.nord0, bg = colors.nord0},
    BufferVisibleIndex = {fg = colors.nord0, bg = colors.nord0}, 
    BufferVisibleMod = {fg = "#717883", bg = colors.nord0, gui = "bold"},
    BufferVisibleSign = {fg = colors.nord0, bg = colors.nord0},
    BufferVisibleTarget = {fg = colors.nord0, bg = colors.nord0},
    LspDiagnosticsSignError = {fg = colors.nord11},
    LspDiagnosticsSignWarning = {fg = colors.nord11},
    LspDiagnosticsSignHint = {fg = colors.nord13 },
    LspDiagnosticsSignInformation = {fg = colors.nord13},
})

-- hi MyNerdTree guifg=#ECEFF4 gui=BOLD guibg=#3B4252
-- hi MyNerdTreeTree guifg=#434C5E gui=BOLD guibg=#88C0D0
-- hi MyNerdTreeAccent guifg=#434C5E gui=NONE guibg=NONE
-- hi MyNerdTreeAccentBody guifg=#88C0D0 gui=NONE guibg=#81A1C1
-- hi MyNerdTreeSeparator guifg=#88C0D0 gui=NONE guibg=#88C0D0
-- hi MyNerdTreeSeparator2 guifg=#81A1C1 gui=NONE guibg=#3B4252

-- call s:hi("GitGutterAdd", s:nord14_gui, "", "", s:nord14_term, "", "")
-- call s:hi("GitGutterChange", s:nord13_gui, "", "", s:nord13_term, "", "")
-- call s:hi("GitGutterChangeDelete", s:nord11_gui, "", "", s:nord11_term, "", "")
-- call s:hi("GitGutterDelete", s:nord11_gui, "", "", s:nord11_term, "", "")

-- call s:hi("NERDTreeExecFile", s:nord7_gui, "", s:nord7_term, "", "", "")
-- call s:hi("NERDTreeDirSlash", s:nord0_gui, "", s:nord1_term, "", "", "")
-- call s:hi("NERDTreeCWD", s:nord0_gui, "", s:nord1_term, "", "", "")
-- hi NERDTreeDir gui=bold
-- hi NERDTreeFile guifg=#CBD3E1 gui=none
-- hi nerdtreeExactMatchFolder_node_modules guifg=#A3BE8C gui=bold
-- hi nerdtreeExactMatchFolderIcon_node_modules guifg=#A3BE8C

-- hi! link NERDTreeHelp Comment

-- " Statusline
-- hi StatusLine          guifg=#FFEE58     guibg=NONE     gui=NONE
-- hi StatusLineNC        guifg=#FFEE58     guibg=NONE     gui=BOLD
-- hi MyStatuslineAccent guibg=#2E39D4 gui=BOLD guifg=#88C0D0
-- hi MyStatuslineAccentBody guibg=#2E39D4 gui=BOLD guifg=#88C0D0
-- hi MyStatuslineDevIcon  guifg=#434C5E gui=NONE guibg=NONE
-- hi MyStatuslineDevIconBody guifg=#434C5E gui=NONE guibg=NONE
-- hi MyStatuslineGitInfoBody  guifg=#434C5E gui=NONE guibg=#FF8A65
-- hi MyStatuslineGitInfo guifg=#FF8A65 gui=NONE guibg=NONE
-- hi MyStatuslineModified guifg=#434C5E gui=NONE guibg=NONE
-- hi MyStatuslineFilesize guifg=#434C5E gui=NONE guibg=NONE
-- hi MyStatuslineFilesizeBody guifg=#ECEFF4 gui=NONE guibg=#434C5E
-- hi MyStatuslineFiletype guibg=#434C5E gui=NONE guifg=#1F2633
-- hi FiletypeBody guibg=#434C5E gui=NONE guifg=#ECEFF4
-- hi MyStatuslineFilename guifg=#434C5E gui=NONE guibg=NONE
-- hi MyStatuslineFilenameBody guifg=#ECEFF4 gui=BOLD guibg=#434C5E
-- hi MyStatuslinePercentage guifg=#1F2633 gui=NONE guibg=NONE
-- hi MyStatuslinePercentageBody guibg=#1F2633 gui=NONE guifg=#96DFD3
-- hi MyStatuslineLineCol guifg=#434C5E gui=BOLD guibg=NONE
-- hi MyStatuslineLineColBody guibg=#434C5E gui=NONE guifg=#ECEFF4
-- hi MyStatuslineSeparator guifg=#434C5E gui=NONE guibg=#434C5E
-- hi MyStatuslineSeparator2 guifg=#434C5E gui=NONE guibg=NONE
-- hi MyBuffer guifg=#96DFD3 gui=NONE guibg=#434C5E
-- hi MyBufferNum guifg=#ECEFF4 gui=NONE guibg=#434C5E
-- hi MySeparator guifg=#434C5E gui=NONE guibg=NONE
-- hi MyBatterySymbol guifg=#98DC9A gui=NONE guibg=#434C5E
-- hi MyBattery guifg=#ECEFF4 gui=NONE guibg=#434C5E
-- hi MyStatuslineModifiedBody guifg=#98DC9A gui=BOLD guibg=#434C5E

-- hi MyPercentage guifg=#ECEFF4 gui=NONE guibg=#434C5E

-- hi MyFirstDir guifg=#4D5D80 gui=BOLD guibg=#434C5E
-- hi MySecondDir guifg=#98DC9A gui=BOLD guibg=#434C5E
-- hi MyThirdDir guifg=#9ABEFF gui=BOLD guibg=#434C5E

-- hi MyGitBranch guifg=#98DC9A gui=BOLD guibg=#434C5E

-- hi MyGitSymbol guifg=#ECEFF4 gui=NONE guibg=#434C5E
-- hi MyGitNumber guifg=#ECEFF4 gui=NONE guibg=#434C5E

-- hi WebDevIconsDefaultFolderSymbol guifg=#FF8A65 gui=NONE guibg=NONE
-- hi WebDevIconsDefaultFolderClosedSymbol guifg=#ECEFF4 gui=NONE guibg=NONE
-- hi DevIconsDefaultFolderOpenSymbol guifg=#4D5D80 gui=NONE guibg=NONE
-- hi WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol guifg=#ECEFF4 gui=NONE guibg=NONE
-- hi WebDevIconsNERDTreeDirOpen guifg=#ECEFF4 gui=NONE guibg=NONE 

-- hi NormalColor guibg=#88C0D0 gui=BOLD guifg=#434C5E
-- hi InsertColor guibg=#A3BE8C gui=BOLD guifg=#434C5E
-- hi ReplaceColor guibg=#EBCB8B gui=BOLD guifg=#434C5E
-- hi VisualColor guibg=#B48EAD gui=BOLD guifg=#434C5E
-- hi CommandColor guibg=#88C0D0 gui=BOLD guifg=#434C5E

-- hi MystatuslineBattery guibg=#434C5E gui=BOLD guifg=#F06292

-- hi ScrollView guifg=#4D5D80 gui=NONE guibg=#4D5D80

-- hi MyCurrentFolder guifg=#98DC9A gui=ITALIC guibg=#434C5E
-- hi MyFileFormat guifg=#ECEFF4 gui=NONE guibg=#434C5E

-- hi Linter guifg=#9ABEFF gui=BOLD guibg=#434C5E
-- hi LinterOk guifg=#98DC9A gui=BOLD guibg=#434C5E
-- hi LinterNonErrors guifg=#FF8A65 gui=BOLD guibg=#434C5E
-- hi LinterErrors guifg=#F06292 gui=BOLD guibg=#434C5E

-- hi MyStatuslineSpace guifg=#88C0D0 guibg=#88C0D0
