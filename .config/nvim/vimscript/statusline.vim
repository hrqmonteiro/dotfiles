scriptencoding utf-8

source $HOME/.config/nvim/vimscript/functions.vim

let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

             let g:codi#interpreters = {
                   \ 'ruby': {
                       \ 'bin': 'irb',
                       \ 'prompt': '^\(>>>\|\.\.\.\) ',
                       \ },
                   \ }

" Left items
set statusline=%{RedrawModeColors(mode())}
set statusline+=%#MyStatuslineSpace#
set statusline+=%#NormalColor#%{(mode()=='n')?'N':''}
set statusline+=%#InsertColor#%{(mode()=='i')?'I':''}
set statusline+=%#ReplaceColor#%{(mode()=='R')?'R':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'V':''}
set statusline+=%#VisualColor#%{(mode()=='V')?'V':''}
set statusline+=%#CommandColor#%{(mode()=='c')?'C':''}
set statusline+=%#MyStatuslineAccent#
set statusline+=%#MyStatuslineAccentBody#
" set statusline+=%#MyStatuslineModifiedBody#\ \ %{SetModifiedSymbol(&modified)}
set statusline+=%{SetMyStatusLineDevIconHighlight()} 
set statusline+=%#MyStatuslineDevIcon#%{ShowDevIcons()}
set statusline+=%#MyStatuslineModifiedBody#%{SetModifiedSymbol(&modified)}\ %#MyFirstDir#%{g:first_dir}%#MySecondDir#%{g:second_dir}%#MyThirdDir#%{g:third_dir}%#MyStatuslineFilenameBody#%f\ 
set statusline+=%#MySeparator#\ 
set statusline+=%#MySeparator# 
set statusline+=%#MyStatuslineFilesizeBody#\ %{FileSize()}\ %#MyPercentage#%l:%c\ %P\ 
set statusline+=%#MySeparator#\ 
" set statusline+=%#MyStatuslineGitInfo#
" set statusline+=%#MyStatuslineGitInfoBody#\  
" set statusline+=%#MyStatuslineGitInfoBody#\ %{GitInfo()}\ 
" set statusline+=%#MyStatuslineGitInfo#

" Right items
set statusline+=%=
" set statusline+=%#MySeparator#
" set statusline+=%#MyBuffer#\ \ %#MyBufferNum#%n\ %#MyBuffer#❖\ %#MyBufferNum#%{winnr()}\ 
" set statusline+=%#MySeparator#\
" set statusline+=%#MySeparator#
" set statusline+=%#MyBatterySymbol#\ %{g:battery_symbol}\ %#MyBattery#%{g:battery_level}\ 
" set statusline+=%{g:url}
" set statusline+=%#MyGitSymbol#%{g:uncommited}%#MyGitNumber#%{g:uncommitednumber}
set statusline+=%#MyGitBranch#%{GitBranch()}
" set statusline+=%#MySeparator#\ 
" set statusline+=%#MySeparator#
" set statusline+=%#MyStatuslineLineColBody#\ %#MyFileFormat#%{FileFormat()}\ %{Encoding()}\ 
" set statusline+=%#MySeparator#\ 
set statusline+=%#MySeparator#
" set statusline+=%#FiletypeBody#\ %{FileType()}%#Linter#%{Linter()}%#LinterOk#%{LinterOk()}%#LinterNonErrors#%{LinterNonErrors()}%#LinterErrors#%{LinterErrors()}\ 
set statusline+=%#MySeparator#\ 
