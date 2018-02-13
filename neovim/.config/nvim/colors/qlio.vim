" Vim Qlio color scheme 
" Notes: To check the meaning of the highlight groups, :help 'highlight'

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif
set t_Co=256
let g:colors_name="qlio"

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
hi Normal          ctermfg=none    ctermbg=none    cterm=none
hi Cursor          ctermfg=none    ctermbg=none    cterm=none
hi CursorLine      ctermfg=none    ctermbg=none    cterm=none
hi LineNr          ctermfg=238     ctermbg=none    cterm=none
hi CursorLineNR    ctermfg=172     ctermbg=none    cterm=bold

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=235     ctermbg=none    cterm=none
hi FoldColumn      ctermfg=014     ctermbg=242     cterm=none
hi SignColumn      ctermfg=014     ctermbg=242     cterm=none
hi Folded          ctermfg=103     ctermbg=238     cterm=none

" -------------------------
" - Window/Tab delimiters - 
" -------------------------
hi VertSplit       ctermfg=059     ctermbg=059     cterm=none
hi ColorColumn     ctermfg=none    ctermbg=001     cterm=none
hi TabLine         ctermfg=none    ctermbg=007     cterm=none
hi TabLineFill     ctermfg=247     ctermbg=none    cterm=none
hi TabLineSel      ctermfg=none    ctermbg=0255    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory       ctermfg=242     ctermbg=none    cterm=bold
hi Search          ctermfg=000     ctermbg=011     cterm=none
hi IncSearch       ctermfg=none    ctermbg=none    cterm=reverse

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      ctermfg=255     ctermbg=239     cterm=none
hi StatusLineNC    ctermfg=007     ctermbg=059     cterm=none
hi WildMenu        ctermfg=000     ctermbg=011     cterm=none
hi Question        ctermfg=121     ctermbg=none    cterm=none
hi Title           ctermfg=225     ctermbg=none    cterm=none
hi ModeMsg         ctermfg=none    ctermbg=none    cterm=bold
hi MoreMsg         ctermfg=121     ctermbg=none    cterm=bold

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=015     ctermbg=108     cterm=bold
hi Visual          ctermfg=none    ctermbg=101     cterm=none
hi VisualNOS       ctermfg=none    ctermbg=none    cterm=none
hi NonText         ctermfg=008     ctermbg=none    cterm=bold

hi Todo            ctermfg=000     ctermbg=011     cterm=none
hi Underlined      ctermfg=005     ctermbg=none    cterm=underline
hi Error           ctermfg=015     ctermbg=009     cterm=none
hi ErrorMsg        ctermfg=015     ctermbg=001     cterm=none
hi WarningMsg      ctermfg=024     ctermbg=none    cterm=none
hi Ignore          ctermfg=015     ctermbg=none    cterm=none
hi SpecialKey      ctermfg=051     ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=009     ctermbg=none    cterm=none
hi String          ctermfg=065     ctermbg=none    cterm=none
hi StringDelimiter ctermfg=058     ctermbg=none    cterm=none
hi Character       ctermfg=173     ctermbg=none    cterm=none
hi Number          ctermfg=009     ctermbg=none    cterm=none
hi Boolean         ctermfg=001     ctermbg=none    cterm=none
hi Float           ctermfg=009     ctermbg=none    cterm=none
hi Identifier      ctermfg=006     ctermbg=none    cterm=none
hi Function        ctermfg=058     ctermbg=none    cterm=none

" --------------------------------
" Language constructs
" --------------------------------
hi Statement       ctermfg=179     ctermbg=none    cterm=bold
"hi Conditional     ctermfg=none    ctermbg=none    cterm=none
"hi Repeat          ctermfg=none    ctermbg=none    cterm=none
"hi Label           ctermfg=none    ctermbg=none    cterm=none
"hi Operator        ctermfg=none    ctermbg=none    cterm=none
"hi Keyword         ctermfg=none    ctermbg=none    cterm=none
"hi Exception       ctermfg=none    ctermbg=none    cterm=none
hi Comment         ctermfg=008     ctermbg=none    cterm=none

hi Special         ctermfg=051     ctermbg=none    cterm=none
"hi SpecialChar     ctermfg=none    ctermbg=none    cterm=none
"hi Tag             ctermfg=none    ctermbg=none    cterm=none
"hi Delimiter       ctermfg=none    ctermbg=none    cterm=none
"hi SpecialComment  ctermfg=none    ctermbg=none    cterm=none
"hi Debug           ctermfg=none    ctermbg=none    cterm=none

" ----------
" - C like -
" ----------
hi PreProc         ctermfg=051     ctermbg=none    cterm=none
hi Include         ctermfg=179     ctermbg=none    cterm=none
hi Define          ctermfg=058     ctermbg=none    cterm=bold
hi Macro           ctermfg=179     ctermbg=none    cterm=none
hi PreCondit       ctermfg=179     ctermbg=none    cterm=none

hi Type            ctermfg=002     ctermbg=none    cterm=none
"hi StorageClass    ctermfg=none    ctermbg=none    cterm=none
hi Structure       ctermfg=247     ctermbg=none    cterm=none
"hi Typedef         ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd         ctermfg=none    ctermbg=none    cterm=none
hi DiffChange      ctermfg=none    ctermbg=none    cterm=none
hi DiffDelete      ctermfg=none    ctermbg=none    cterm=none
hi DiffText        ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Completion menu
" --------------------------------
hi Pmenu           ctermfg=none    ctermbg=none    cterm=none
hi PmenuSel        ctermfg=none    ctermbg=none    cterm=none
hi PmenuSbar       ctermfg=none    ctermbg=none    cterm=none
hi PmenuThumb      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad        ctermfg=none    ctermbg=009     cterm=none
hi SpellCap        ctermfg=none    ctermbg=012     cterm=none
hi SpellLocal      ctermfg=none    ctermbg=014     cterm=none
hi SpellRare       ctermfg=none    ctermbg=013     cterm=none

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------
