scriptencoding utf-8

command! LspCodeAction lua require 'nv-utils'.code_action()
command! LspDeclaration lua require 'nv-utils'.declaration()
command! LspDefinition lua require 'nv-utils'.definition()
command! LspDocumentSymbol lua require 'nv-utils'.document_symbol()
command! LspFormatting lua require 'nv-utils'.formatting()
command! LspFormattingSync lua require 'nv-utils'.formatting_sync()
command! LspHover lua require 'nv-utils'.hover()
command! LspImplementation lua require 'nv-utils'.implementation()
command! LspRangeCodeAction lua require 'nv-utils'.range_code_action()
command! LspRangeFormatting lua require 'nv-utils'.range_formatting()
command! LspReferences lua require 'nv-utils'.references()
command! LspRename lua require 'nv-utils'.rename()
command! LspTypeDefinition lua require 'nv-utils'.type_definition()
command! LspWorkspaceSymbol lua require 'nv-utils'.workspace_symbol()
command! LspGotoNext lua require 'nv-utils'.goto_next()
command! LspGotoPrev lua require 'nv-utils'.goto_prev()
command! LspShowLineDiagnostics lua require 'nv-utils'.show_line_diagnostics()
command! NextHunk lua require 'nv-utils'.next_hunk()
command! PrevHunk lua require 'nv-utils'.prev_hunk()
command! StageHunk lua require 'nv-utils'.stage_hunk()
command! UndoStageHunk lua require 'nv-utils'.undo_stage_hunk()
command! ResetHunk lua require 'nv-utils'.reset_hunk()
command! ResetBuffer lua require 'nv-utils'.reset_buffer()
command! PreviewHunk lua require 'nv-utils'.preview_hunk()
command! BlameLine lua require 'nv-utils'.blame_line()

autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)

function! RedrawModeColors(mode) " {{{
  " Normal mode
  if a:mode ==# 'n'
    hi MyStatuslineAccent guifg=#88C0D0 gui=NONE guibg=#81A1C1
    hi MyStatuslineAccentBody guifg=#81A1C1 gui=NONE guibg=#434C5E
    hi MyStatuslineSpace guibg=#88C0D0 guifg=#88C0D0
  " Insert mode
  elseif a:mode ==# 'i'
    hi MyStatuslineAccent guifg=#A3BE8C gui=NONE guibg=#81A1C1
    hi MyStatuslineAccentBody guifg=#81A1C1 gui=NONE guibg=#434C5E
    hi MyStatuslineSpace guibg=#A3BE8C guifg=#A3BE8C
  " Replace mode
  elseif a:mode ==# 'R'
    hi MyStatuslineAccent guifg=#EBCB8B gui=NONE guibg=#81A1C1
    hi MyStatuslineAccentBody guifg=#81A1C1 gui=NONE guibg=#434C5E
    hi MyStatuslineSpace guibg=#EBCB8B guifg=#EBCB8B
  " Visual mode
  elseif a:mode ==# 'v' || a:mode ==# 'V' || a:mode ==# '^V'
    hi MyStatuslineAccent guifg=#BD9AFF gui=NONE guibg=#81A1C1
    hi MyStatuslineAccentBody guifg=#81A1C1 gui=NONE guibg=#434C5E
    hi MyStatuslineSpace guibg=#BD9AFF guifg=#BD9AFF
  " Command mode
  elseif a:mode ==# 'c'
    hi MyStatuslineAccent guifg=#88C0D0 gui=NONE guibg=#81A1C1
    hi MyStatuslineAccentBody guifg=#81A1C1 gui=NONE guibg=#434C5E
    hi MyStatuslineSpace guibg=#88C0D0 guifg=#88C0D0
  " Terminal mode
  elseif a:mode ==# 't'
    hi MyStatuslineAccent guifg=#434C5E gui=NONE guibg=#81A1C1
    hi MyStatuslineAccentBody guifg=#81A1C1 gui=NONE guibg=#434C5E
  endif
  return ''
endfunction

function! SetModifiedSymbol(modified) " {{{
    if a:modified == 1
        hi MyStatuslineModifiedBody guifg=#BF616A gui=BOLD guibg=#434C5E
        hi MyStatuslineFilenameBody guifg=#BF616A gui=BOLD guibg=#434C5E
        hi MyFirstDir guifg=#BF616A
        hi MySecondDir guifg=#BF616A
        hi MyThirdDir guifg=#BF616A
        return '  '
    else
        hi MyStatuslineModifiedBody guifg=#434C5E gui=BOLD guibg=#434C5E
        hi MyStatuslineFilenameBody guifg=#ECEFF4 gui=BOLD guibg=#434C5E
        hi MyFirstDir guifg=#D8DEE9
        hi MySecondDir guifg=#A3BE8C
        hi MyThirdDir guifg=#88C0D0
        return ''
    endif
endfunction

function! SetFiletype(filetype) " {{{
  if a:filetype ==# ''
      return '-'
  else
      return a:filetype
  endif
endfunction

function! ShowDevIcons()
  return WebDevIconsGetFileTypeSymbol()
 endfunction

function! GitBranch()
  let git = gitbranch#name() 
  if git !=# ''
    return ' '.gitbranch#name().' '
  else
    hi MyStatuslineGitInfo ctermfg=0 cterm=NONE ctermbg=0
    hi MyStatuslineGitInfoBody ctermfg=0 cterm=NONE ctermbg=0
    return ''
  endif
endfunction

function! SetMyStatusLineDevIconHighlight()
  if &filetype ==# 'vim'
    hi MyStatuslineDevIcon guibg=#434C5E gui=NONE guifg=#A3BE8C
    return ''
  elseif &filetype ==# 'css'
    hi MyStatuslineDevIcon guibg=#434C5E gui=NONE guifg=#88C0D0
    return ''
  elseif &filetype ==# 'lua' 
    hi MyStatuslineDevIcon guibg=#434C5E gui=NONE guifg=#81A1C1
    return ''
  elseif &filetype ==# 'moon' 
    hi MyStatuslineDevIcon guibg=#434C5E gui=NONE guifg=#EBCB8B
    return ''
  elseif &filetype ==# 'cpp' 
    hi MyStatuslineDevIcon guibg=#434C5E gui=NONE guifg=#81A1C1
    return ''
  elseif &filetype ==# 'sh' 
    hi MyStatuslineDevIcon guibg=#434C5E gui=NONE guifg=#ECEFF4
    return ''
  elseif &filetype ==# 'html' 
    hi MyStatuslineDevIcon guibg=#434C5E gui=NONE guifg=#D08770
    return ''
  elseif &filetype ==# 'haml' 
    hi MyStatuslineDevIcon guibg=#434C5E gui=NONE guifg=#D08770
    return ''
  elseif &filetype ==# 'javascript' 
    hi MyStatuslineDevIcon guibg=#434C5E gui=NONE guifg=#EBCB8B
    return ''
  elseif &filetype ==# 'yaml' 
    hi MyStatuslineDevIcon guibg=#434C5E gui=NONE guifg=#EBCB8B
    return ''
  elseif &filetype ==# 'python' 
    hi MyStatuslineDevIcon guibg=#434C5E gui=NONE guifg=#88C0D0
    return ''
  elseif &filetype ==# 'ruby' 
    hi MyStatuslineDevIcon guibg=#434C5E gui=NONE guifg=#BF616A
    return ''
  elseif &filetype ==# 'eruby' 
    hi MyStatuslineDevIcon guibg=#434C5E gui=NONE guifg=#BF616A
    return ''
  else
    hi MyStatuslineDevIcon guifg=#88C0D0 guibg=#434C5E gui=NONE
    return ''
  endif
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'm'
  elseif (exists('kbytes'))
    return kbytes . 'k'
  else
    return bytes . 'b'
  endif
endfunction

function! BufferNumber()
  let bfnmbr = buffer_number()
  if bfnmbr == 1
    return ''
  elseif bfnmbr == 2
    return ''
  elseif bfnmbr == 3
    return ''
  elseif bfnmbr == 4
    return ''
  elseif bfnmbr == 5
    return ''
  else
    return '洛'
  endif
endfunction

function! Encoding()
  if &fileencoding ==# ''
    return 'ﰸ'
  else 
    return toupper(&fileencoding)
  endif
endfunction

function! FileType()
  if &filetype ==# 'vim'
    return 'Vim'
  elseif &filetype ==# 'javascript'
    return 'JavaScript'
  elseif &filetype ==# 'lua'
    return 'Lua'
  elseif &filetype ==# 'yml'
    return 'YAML'
  elseif &filetype ==# 'javascriptreact'
    return 'React'
  elseif &filetype ==# 'coffee'
    return 'CoffeeScript'
  elseif &filetype ==# 'markdown'
    return 'Markdown'
  elseif &filetype ==# 'sh'
    return 'Shell Script'
  elseif &filetype ==# 'ruby'
    return 'Ruby'
  else 
    return toupper(&filetype)
  endif
endfunction

function! FileFormat()
  if &fileformat ==# 'unix'
    return 'LF'
  else
    return toupper(&fileformat)
  endif
endfunction

let g:battery_level = ''
function! Battery(timer_id)
  let l:battery_level = system('acpi | grep -oP "(\d+)%" | tr -d "\n"')
    if (battery_level !=# '')
      let g:battery_level = l:battery_level
      redraw!
    endif
  call timer_start(30000, 'Battery')
endfunction

let g:battery_symbol = ''
function! BatterySymbol(timer_id)
  let l:battery_symbol = system('acpi | grep -oP "(\d+)%" | tr -d "\n"')
   if (battery_symbol ==# '100%')
      let g:battery_symbol = ' '
      hi MyBatterySymbol ctermfg=2
   elseif (battery_symbol >=# '80%')
      let g:battery_symbol = ' '
      hi MyBatterySymbol ctermfg=2
    elseif (battery_symbol >=# '75%')
     let g:battery_symbol = ' '
      hi MyBatterySymbol ctermfg=3
    elseif (battery_symbol >=# '50%')
      let g:battery_symbol = ' '
      hi MyBatterySymbol ctermfg=11
    elseif (battery_symbol >=# '25%')
      let g:battery_symbol = ' '
      hi MyBatterySymbol ctermfg=1
   endif
  call timer_start(30000, 'BatterySymbol')
endfunction

let g:uncommited = ''
function! GitCommitSymbol(timer_id)
  let l:uncommited = system('echo -n $(git checkout | grep -oP "(\M+)" -c)')
  if (uncommited !~# 'fatal')
    let g:uncommited = ' '
    hi MyGitSymbol guifg=#FF8A65
  else
    let g:uncommited = ''
  endif
  call timer_start(5000, 'GitCommitSymbol')
endfunction

let g:uncommitednumber = ''
function! GitCommitNumber(timer_id)
  let l:uncommitednumber = system('echo -n $(git checkout | grep -oP "(\M+)" -c)')
    if (uncommitednumber !~# 'fatal')
    let g:uncommitednumber = 'Git(' .uncommitednumber .') '
  elseif (uncommitednumber =~# 'your')
    let g:uncommitednumber = ' '
  else
    let g:uncommitednumber = ''
  endif
  call timer_start(5000, 'GitCommitNumber')
endfunction

" let g:file_dir = ''
" function! FileDir(timer_id)
"   let l:file_dir = system('echo -n $(pwd | grep -oP "hrq/\K(.*)$")')
"     if getcwd() == '/home/hrq'
"       let g:file_dir = '~'
"       hi MyFileDir ctermfg=11
"     else
"       let g:file_dir = file_dir
"     endif
"     call timer_start(5000, 'FileDir')
"     hi MyFileDir ctermfg=2
" endfunction

" let g:first_dir = ''
" let g:second_dir = ''
" function! FileDir(timer_id)
"   let l:first_dir = getcwd()
"   if (first_dir == '/home/hrq/.config/nvim')
"     let g:first_dir = '.config'
"     let g:second_dir = '/nvim/'
"     hi MySecondDir ctermfg=4
"   elseif (first_dir == '/home/hrq/.config/awesome')
"      let g:first_dir = '.config'
"      let g:second_dir = '/awesome/'
"      hi MySecondDir ctermfg=5
"   elseif (first_dir == '/home/hrq/.config/alacritty')
"      let g:first_dir = '.config'
"      let g:second_dir = '/alacritty/'
"      hi MySecondDir ctermfg=3
"   else
"      let g:first_dir = system('echo -n $(pwd | grep -oP "hrq/\K(.*)$")')."/"
"      let g:second_dir = ''
"   endif
"     call timer_start(1000, 'FileDir')
" endfunction
"

let g:first_dir = ''
let g:second_dir = ''
let g:third_dir = ''
function! FileDir(timer_id)
  let l:first_dir = getcwd()
  let l:second_dir = getcwd()
  let l:third_dir = getcwd()
  let l:slash = exists('+shellslash') && !&shellslash ? '\' : '/'
  if count(getcwd(), l:slash) >= 5 
    let g:first_dir = ''
    let g:second_dir = ''
    let g:third_dir = ''
  elseif count(getcwd(), l:slash) >= 4
    let g:first_dir = ''
    let g:second_dir = ''
    let g:third_dir = system("echo -n $(pwd | awk -F'/' '{print $5}')").'/'
  elseif count(getcwd(), l:slash) >= 3
  let g:first_dir = ''
  let g:second_dir = system("echo -n $(pwd | awk -F'/' '{print $4}')").'/'
  let g:third_dir = ''
  elseif (first_dir ==# '/home/hrq')
    let g:first_dir = ''
    let g:second_dir = ''
    let g:third_dir = ''
  endif
  call timer_start(1000, 'FileDir')
endfunction

" let g:gitbranch = ''
" function! GitBranch(timer_id)
"   let l:gitbranch = system('echo -n $(git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d "\n")')
"   if (gitbranch) != ''      
"     let g:gitbranch = ' ' . gitbranch
"   else
"     return ''
"   endif
"   call timer_start(5000, 'GitBranch')
" endfunction

function! Linter()
    if &filetype ==# 'vim'
        return '  Vint'
    elseif &filetype ==# 'javascript'
        return '  ESLint'
    elseif &filetype ==# 'css'
        return '  Prettier'
    else
        return ''
    endif
endfunction

let g:url = ''
function! GitUrl(timer_id)
  let l:url = system('echo -n $(git config --get remote.origin.url)')
  if (url ==# '')
    let g:url = ''
  elseif (url =~# 'https://github.com') || (url =~# 'git@github.com')
    let g:url = ' GitHub '
  elseif (url =~# 'https://gitlab.com')
    let g:url = ' GitLab '
  endif
  call timer_start(1000, 'GitUrl')
endfunction

" let g:url = ''
" function! GitUrl(timer_id)
"   let l:url = system('echo -n $(git ckout | grep -oP "(\M+)" -c)')
"   if (uncommited !~ 'fatal')
"     let g:uncommited = ' '
"     hi MyGitSymbol guifg=#FF8A65
"   else
"     let g:uncommited = ' '
"     hi MyGitSymbol guifg=#ECEFF4
"   endif
"   call timer_start(5000, 'GitCommitSymbol')
" endfunction


function! LinterOk ()
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    if l:counts.total == 0
      return '  '
      hi Linter guifg=#98DC9A
    else
     return ''
    endif
endfunction

function! LinterNonErrors()
  let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    if l:counts.total !=# 0
     return '  ' . ' ' . all_non_errors
    else
      return ''
    endif
endfunction

function! LinterErrors()
  let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    if l:counts.total !=# 0
     return '  ' . 'ﰸ ' . all_errors
    else
      return ''
    endif
endfunction
