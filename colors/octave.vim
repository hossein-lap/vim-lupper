" Name:       octave.vim
" Version:    0.1.0
" Maintainer: github.com/hossein-lap
" License:    The MIT License (MIT)
"
" A minimal orange colorscheme for Vim.
"
" Forked from sunbather:
" https://github.com/nikolvs/vim-sunbather
"
"""
hi clear

if exists('syntax on')
    syntax reset
endif

" Toggle bold, italics, underline {{{
let g:boldface = 0
let g:italicface = 0
let g:urlface = 0

if g:boldface == 1
    let s:thebold = 'bold'
else
    let s:thebold = 'none'
endif

if g:italicface == 1
    let s:theitalic = 'italic'
else
    let s:theitalic = 'none'
endif

if g:urlface == 1
    let s:theurl = 'underline'
else
    let s:theurl = 'none'
endif
" }}}

let g:colors_name='octave'

let s:black           = { "gui": "#000000", "cterm": "232"  }
let s:actual_black    = { "gui": "NONE",    "cterm": "NONE" }
let s:medium_gray     = { "gui": "#767676", "cterm": "243"  }
let s:white           = { "gui": "#F1F1F1", "cterm": "15"   }
let s:actual_white    = { "gui": "#FFFFFF", "cterm": "231"  }
let s:subtle_black    = { "gui": "#121212", "cterm": "233"  }
let s:light_black     = { "gui": "#262626", "cterm": "235"  }
let s:lighter_black   = { "gui": "#4E4E4E", "cterm": "239"  }
let s:light_gray      = { "gui": "#A8A8A8", "cterm": "248"  }
let s:lighter_gray    = { "gui": "#C6C6C6", "cterm": "251"  }
let s:lightest_gray   = { "gui": "#EEEEEE", "cterm": "255"  }
let s:dark_pink       = { "gui": "#ff5f87", "cterm": "204"  }
let s:light_pink      = { "gui": "#d75f87", "cterm": "168"  }
let s:dark_red        = { "gui": "#8b0000", "cterm": "1"    }
let s:light_red       = { "gui": "#EC1717", "cterm": "1"    }
let s:dark_orange     = { "gui": "#DA5000", "cterm": "167"  }
let s:light_orange    = { "gui": "#FF8C00", "cterm": "167"  }
let s:darker_blue     = { "gui": "#005F87", "cterm": "18"   }
let s:dark_blue       = { "gui": "#008EC4", "cterm": "32"   }
let s:blue            = { "gui": "#20BBFC", "cterm": "12"   }
let s:light_blue      = { "gui": "#b6d6fd", "cterm": "153"  }
let s:dark_cyan       = { "gui": "#20A5BA", "cterm": "6"    }
let s:light_cyan      = { "gui": "#4FB8CC", "cterm": "14"   }
let s:dark_green      = { "gui": "#10A778", "cterm": "2"    }
let s:light_green     = { "gui": "#5FD7A7", "cterm": "10"   }
let s:light_purple    = { "gui": "#a790d5", "cterm": "140"  }
let s:yellow          = { "gui": "#ffdd00", "cterm": "11"   }
let s:light_yellow    = { "gui": "#ffff87", "cterm": "228"  }
let s:dark_yellow     = { "gui": "#A89C14", "cterm": "3"    }

let s:background = &background

if &background == "dark"
  let s:bg              = s:black
  let s:bg_subtle       = s:lighter_black
  let s:bg_very_subtle  = s:subtle_black
  let s:norm            = s:lighter_gray
  let s:norm_subtle     = s:medium_gray
  let s:pink            = s:light_pink
  let s:cyan            = s:light_cyan
  let s:green           = s:light_green
  let s:red             = s:light_red
  let s:visual          = s:light_blue
  let s:yellow          = s:light_yellow
  let s:blue            = s:light_blue
  let s:orange          = s:light_orange
else
  let s:bg              = s:actual_white
  let s:bg_subtle       = s:light_gray
  let s:bg_very_subtle  = s:lightest_gray
  let s:norm            = s:light_black
  let s:norm_subtle     = s:medium_gray
  let s:pink            = s:dark_pink
  let s:cyan            = s:dark_cyan
  let s:green           = s:dark_green
  let s:red             = s:dark_red
  let s:visual          = s:dark_blue
  let s:yellow          = s:dark_yellow
  let s:orange          = s:dark_orange
endif

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})
call s:h("PlainNormal",   {"bg": s:actual_black, "fg": s:norm})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
   execute "set background=" . s:background
endif

call s:h("Cursor",        {"bg": s:orange, "fg": s:norm })
call s:h("Comment",       {"fg": s:bg_subtle, "gui": s:theitalic, "cterm": s:theitalic})

call s:h("Constant",      {"fg": s:orange})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

"call s:h("Identifier",    {"fg": s:dark_orange})
hi! link Identifier       PlainNormal
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:norm_subtle})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("Operator",      {"fg": s:norm, "cterm": s:thebold, "gui": s:thebold})

call s:h("PreProc",     {"fg": s:norm_subtle})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:norm})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:norm_subtle, "gui": s:theitalic})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": s:theurl, "cterm": s:theurl})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:actual_white, "bg": s:red, "cterm": s:thebold})
call s:h("Todo",          {"fg": s:orange, "gui": s:theurl, "cterm": s:theurl})
call s:h("SpecialKey",    {"fg": s:light_green})
call s:h("NonText",       {"fg": s:medium_gray})
call s:h("Directory",     {"fg": s:dark_orange})
call s:h("ErrorMsg",      {"fg": s:red})
call s:h("IncSearch",     {"bg": s:yellow, "fg": s:light_black})
call s:h("Search",        {"bg": s:light_green, "fg": s:light_black})
call s:h("MoreMsg",       {"fg": s:medium_gray, "cterm": s:thebold, "gui": s:thebold})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bg_subtle})
call s:h("CursorLineNr",  {"fg": s:orange, "bg": s:bg_very_subtle})
call s:h("Question",      {"fg": s:red})
call s:h("StatusLine",    {"bg": s:bg_very_subtle})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:medium_gray})
call s:h("VertSplit",     {"bg": s:black, "fg": s:white})
call s:h("Title",         {"fg": s:dark_orange})
call s:h("Visual",        {"fg": s:black, "bg": s:visual})
call s:h("VisualNOS",     {"bg": s:bg_subtle})
call s:h("WarningMsg",    {"fg": s:yellow})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:medium_gray})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffChange",    {"fg": s:dark_yellow})
call s:h("DiffText",      {"fg": s:dark_orange})
call s:h("SignColumn",    {"fg": s:light_green})


if has("gui_running")
  call s:h("SpellBad",    {"gui": s:theurl, "sp": s:red})
  call s:h("SpellCap",    {"gui": s:theurl, "sp": s:light_green})
  call s:h("SpellRare",   {"gui": s:theurl, "sp": s:light_purple})
  call s:h("SpellLocal",  {"gui": s:theurl, "sp": s:dark_green})
else
  call s:h("SpellBad",    {"cterm": s:theurl, "fg": s:red})
  call s:h("SpellCap",    {"cterm": s:theurl, "fg": s:light_green})
  call s:h("SpellRare",   {"cterm": s:theurl, "fg": s:light_purple})
  call s:h("SpellLocal",  {"cterm": s:theurl, "fg": s:dark_green})
endif

call s:h("Pmenu",         {"fg": s:norm, "bg": s:black})
call s:h("PmenuSel",      {"fg": s:black, "bg": s:orange})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("TabLineSel",    {"fg": s:subtle_black, "bg": s:orange, "gui": s:thebold, "cterm": s:thebold})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("CursorColumn",  {"bg": s:bg_very_subtle})
call s:h("CursorLine",    {"bg": s:bg_very_subtle})
call s:h("ColorColumn",   {"bg": s:subtle_black})

call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:medium_gray})

call s:h("htmlH1",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",        {"bg": s:bg, "fg": s:norm})

" Syntastic
call s:h("SyntasticWarningSign",    {"fg": s:yellow})
call s:h("SyntasticWarning",        {"bg": s:yellow, "fg": s:black, "gui": s:thebold, "cterm": s:thebold})
call s:h("SyntasticErrorSign",      {"fg": s:red})
call s:h("SyntasticError",          {"bg": s:red, "fg": s:white, "gui": s:thebold, "cterm": s:thebold})

" which-key.nvim
call s:h("WhichKey",                {"bg": s:bg, "fg": s:orange, "gui": s:thebold, "cterm": s:thebold})
call s:h("WhichKeyDesc",            {"bg": s:bg, "fg": s:norm_subtle, "gui": s:thebold, "cterm": s:thebold})
call s:h("WhichKeySeparator",       {"bg": s:bg, "fg": s:norm, "gui": s:thebold, "cterm": s:thebold})
call s:h("WhichKeyFloat",           {"bg": s:bg})

hi link WhichKeyGroup WhichKey

" Neomake
hi link NeomakeWarningSign	SyntasticWarningSign
hi link NeomakeErrorSign	SyntasticErrorSign

" ALE
hi link ALEWarningSign	SyntasticWarningSign
hi link ALEErrorSign	SyntasticErrorSign

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
hi link GitGutterAdd                LineNr
hi link GitGutterDelete             LineNr
hi link GitGutterChange             LineNr
hi link GitGutterChangeDelete       LineNr
