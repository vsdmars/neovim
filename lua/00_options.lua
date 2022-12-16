VIM_OPT.belloff = "all"
-- Specifies for which events the bell will not be rung. It is a comma-
-- separated list of items. For each item that is present, the bell will be
-- silenced. This is most useful to specify specific events in insert mode to
-- be silenced.
-------------------------------------------------------------------------------

VIM_OPT.compatible = false
-- not compatible with the old-fashion vi mode
VIM_OPT.hidden = true
-- set buffer hidden
VIM_OPT.exrc = true
-- beware of potential security issues

-- When secure is on, ":autocmd", shell and write commands are not allowed in
-- .nvimrc" and ".exrc" in the current directory and map commands are
-- displayed.
VIM_OPT.secure = true
-- go with set exrc

VIM_G.hostname = vim.fn.hostname()
VIM_G.python3_host_prog = "python3"

VIM_CMD 'source $HOME/.config/nvim/layer/all-packages.vim'
-- init. with vim script

--[[
https://vi.stackexchange.com/a/10125
Same as:
filetype on
filetype plugin on
filetype indent on
this is NEEDED for auto completion to run ]]--
VIM_API.nvim_command('filetype plugin indent on')

vim.g.mapleader = ","
vim.mapleader = ","

vim.g.vimsyn_embed = "l"
-- get Lua syntax highlighting inside .vim

VIM_O.syntax = true
-------------------------------------------------------------------------------

vim.wildmode = { "full", "longest", "lastused" }
-- Completion mode that is used for the character specified with 'wildchar'
-- "full"
--    Complete the next full match.  After the last match, the original string
--    is used and then the first match again.  Will also start 'wildmenu' if it
--    is enabled.
-- "longest"
--    Complete till longest common string.  If this doesn't result in a longer
--    string, use the next part.
-- "lastused"
--    When completing buffer names and more than one buffer matches, sort
--    buffers by time last used (other than the current buffer).
-------------------------------------------------------------------------------

vim.wildoptions = "pum"
-- Display the completion matches using the popupmenu in the same style as the
-- |ins-completion-menu|.
-------------------------------------------------------------------------------

VIM_OPT.backup = false
VIM_OPT.writebackup = false
-- Make a backup before overwriting a file.  Leave it around after the
-------------------------------------------------------------------------------

VIM_OPT.cmdheight = 2
-- Number of screen lines to use for the command-line.  Helps avoiding
-------------------------------------------------------------------------------

VIM_OPT.completeopt = { "menuone", "noselect", "menu", "preview", "noinsert" }
-- A comma-separated list of options for Insert mode completion
-- |ins-completion|.
-- menuone
--    Use the popup menu also when there is only one match. Useful when there
--    is additional information about the match, e.g., what file it comes from.
-- noselect
--    Do not select a match in the menu, force the user to select one from the
--    menu. Only works in combination with "menu" or "menuone".
-------------------------------------------------------------------------------

VIM_OPT.conceallevel = 2
VIM_OPT.concealcursor = niv
-- Determine how text with the "conceal" syntax attribute |:syn-conceal| is
-- shown:
-- 0		Text is shown normally
-------------------------------------------------------------------------------

VIM_OPT.fileencoding = "utf-8"
VIM_OPT.encoding = "utf-8"
VIM_OPT.termencoding = "utf-8"
VIM_OPT.fileencoding = "utf-8"
-- VIM_OPT.fileencodings = "ucs-bom,utf-8,big5,gb2312,latin1

-------------------------------------------------------------------------------

VIM_OPT.hlsearch = true
-- When there is a previous search pattern, highlight all its matches.
VIM_OPT.ignorecase = false
VIM_OPT.smartcase = true
-- ignore case if search pattern is all lowercase,case-sensitive otherwise
VIM_OPT.smarttab = true
-- insert tabs on the start of a line according to context
-------------------------------------------------------------------------------

VIM_OPT.mouse = "a"
-------------------------------------------------------------------------------

VIM_OPT.wildignore = { "*.o", "*~", "*.pyc", "*pycache*", "*.o", "*.so", "*.swp", "*.zip", "*.out" }
-- ignore these files while expanding wild chars
-- A list of file patterns.  A file that matches with one of these patterns is
-- ignored when expanding |wildcards|, completing file or directory names, and
-- influences the result of |expand()|, |glob()| and |globpath()| unless a flag
-- is passed to disable this.
-------------------------------------------------------------------------------

VIM_OPT.pumblend = 20
VIM_OPT.pumheight = 15
-- Popup menu options
-- pumblend - Enables pseudo-transparency for the |popup-menu|
-- pumheight - Popup menu height
-------------------------------------------------------------------------------

VIM_OPT.showtabline = 2
-------------------------------------------------------------------------------

VIM_OPT.smartindent = true
VIM_OPT.autoindent = true

-------------------------------------------------------------------------------
-- formatoptions default: "tcqj"
--  + "t" -- Auto-wrap text using textwidth
--  + "c" -- Auto-wrap comments using textwidth, inserting the current comment
--  -- leader automatically.
--  + "q" -- Allow formatting of comments with "gq".
--  + "j" -- Where it makes sense, remove a comment leader when joining lines.

VIM_OPT.formatoptions:append("rn1")
--  + "r" -- Automatically insert the current comment leader after hitting
--  -- <Enter> in Insert mode.
--  + "n" -- When formatting text, recognize numbered lists.
--  + "1" -- Don't break a line after a one-letter word. It's broken before it
--  -- instead (if possible).

VIM_OPT.formatoptions:remove("oa2")
--  - "o" -- Automatically insert the current comment leader after hitting 'o' or
--  -- 'O' in Normal mode. In case comment is unwanted in a specific place
--  - "a" -- Automatic formatting of paragraphs. Every time text is inserted or
--  -- deleted the paragraph will be reformatted. See |auto-format|.
--  - "2" -- When formatting text, use the indent of the second line of a
--  -- paragraph for the rest of the paragraph, instead of the indent of
--  -- the first line. This supports paragraphs in which the first line has
--  -- a

VIM_OPT.joinspaces = false
-- Concept credit: https://github.com/tjdevries
-------------------------------------------------------------------------------

VIM_OPT.splitbelow = true
-- When on, splitting a window will put the new window below the current one.
VIM_OPT.splitright = true
-- When on, splitting a window will put the new window right of the current
-- one.
-------------------------------------------------------------------------------

VIM_OPT.swapfile = false
-------------------------------------------------------------------------------

VIM_OPT.fillchars = {
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
}
-- Characters to fill the statuslines and vertical separators
-------------------------------------------------------------------------------

VIM_OPT.termguicolors = true
-- Enables 24-bit RGB color in the |TUI|. Uses "gui" |:highlight|
-------------------------------------------------------------------------------

VIM_OPT.timeoutlen = 800
-- Time in milliseconds to wait for a mapped sequence to complete.
-------------------------------------------------------------------------------

VIM_OPT.undofile = true
VIM_OPT.undodir = vim.fn.expand("~/.vim-undo")
-- https://github.com/neovim/neovim/issues/15720
-- Don't unload abandoned buffers
-------------------------------------------------------------------------------

VIM_OPT.updatetime = 300
-- If this many milliseconds nothing is typed the swap file will be written to
-- disk (see |crash-recovery|). Also used for the |CursorHold| autocommand
-- event.
-------------------------------------------------------------------------------

VIM_OPT.expandtab = true
VIM_OPT.shiftwidth = 2
VIM_OPT.tabstop = 2
VIM_OPT.softtabstop = 4
VIM_OPT.shiftwidth = 4
VIM_OPT.tabstop = 4

-- Tab settings
-- expandtab
--  In Insert mode: Use the appropriate number of spaces to insert a tab
-- shiftwidth
--  Number of spaces to use for each step of (auto)indent
-- tabstop
--  Number of spaces that a <Tab> in the file counts for
-------------------------------------------------------------------------------

VIM_OPT.number = true
-- Print the line number in front of each line.  When the 'n' option is
VIM_OPT.relativenumber = false
-- Show the line number relative to the line with the cursor in front of
-- each line. Relative line numbers help you use the |count| you can
-------------------------------------------------------------------------------

VIM_OPT.signcolumn = "yes"
-- When and how to draw the signcolumn.
--  "yes" always
-------------------------------------------------------------------------------

VIM_OPT.wrap = true
-- This option changes how text is displayed.  It doesn't change the text
-- in the buffer, see 'textwidth' for that.
-------------------------------------------------------------------------------

VIM_OPT.scrolloff = 5
-- Minimal number of screen lines to keep above and below the cursor.
-------------------------------------------------------------------------------

VIM_OPT.sidescrolloff = 8
-- The minimal number of screen columns to keep to the left and to the right of
-- the cursor if 'nowrap' is set.
-------------------------------------------------------------------------------

VIM_OPT.laststatus = 2
-- The value of this option influences when the last window will have a status
-- line:
--  0: never
-- 	1: only if there are at least two windows
-- 	2: always
-- 	3: always and ONLY the last window
-------------------------------------------------------------------------------

VIM_OPT.backspace = { "eol", "start", "indent" }
-- Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode.
--  indent
--    allow backspacing over autoindent
--  eol
--    allow backspacing over line breaks (join lines)
--  start
--    allow backspacing over the start of insert; CTRL-W and CTRL-U stop once
--    at the start of insert.
--  nostop
--    like start, except CTRL-W and CTRL-U do not stop at the start of insert.
-------------------------------------------------------------------------------

VIM_OPT.whichwrap = VIM_OPT.whichwrap
    + "<" -- <   <Left>    Normal and Visual
    + ">" -- >   <Right>   Normal and Visual
    + "h" -- h   "h"       Normal and Visual (not recommended)
    + "l" -- l   "l"       Normal and Visual (not recommended)
-- This was from my vimrc. I don't really know why these are there though.
-- The docs now say "h" and "l" are not recommended.
-------------------------------------------------------------------------------

VIM_OPT.list = true
-- List mode: By default, show tabs as ">", trailing spaces as "-", and
-- non-breakable space characters as "+". Useful to see the difference between
-- tabs and spaces and for trailing blanks. Further changed by
-- set listchars=tab:»·,trail:·,extends:↪,precedes:↩
VIM_OPT.listchars = {
    tab = "»·",
    trail = "·",
    extends = "↪",
    precedes = "↩",
}
-------------------------------------------------------------------------------

VIM_OPT.shada = {
    "!", -- When included, save and restore global variables that start
    -- with an uppercase letter, and don't contain a lowercase
    -- letter.  Thus "KEEPTHIS and "K_L_M" are stored, but "KeepThis"
    -- and "_K_L_M" are not.  Nested List and Dict items may not be
    -- read back correctly, you end up with an empty item.
    "'1000",
    -- Maximum number of previously edited files for which the marks
    -- are remembered.  This parameter must always be included when
    -- 'shada' is non-empty.
    -- Including this item also means that the |jumplist| and the
    -- |changelist| are stored in the shada file.
    "<50", -- Maximum number of lines saved for each register.  If zero then
    -- registers are not saved.  When not included, all lines are
    "s100",
    -- Maximum size of an item contents in KiB.
    "h", -- Disable the effect of 'hlsearch' when loading the shada
    -- file. When not included, it depends on whether ":nohlsearch"
}
-- If you exit Vim and later start it again, you would normally lose a lot of
-- information.  The ShaDa file can be used to remember that information, which
-- enables you to continue where you left off.  Its name is the abbreviation of
-- SHAred DAta because it is used for sharing data between Neovim sessions.
--
-- This is introduced in section |21.3| of the user manual.
--
-- The ShaDa file is used to store:
-- - The command line history.
-- - The search string history.
-- - The input-line history.
-- - Contents of non-empty registers.
-- - Marks for several files.
-- - File marks, pointing to locations in files.
-- - Last search/substitute pattern (for 'n' and '&').
-- - The buffer list.
-- - Global variables.
-------------------------------------------------------------------------------

VIM_OPT.background = "dark"
-------------------------------------------------------------------------------

VIM_OPT.autoread = true
-- auto read when file is changed from outside
VIM_OPT.copyindent = true
-- copy the previous indentation on autoindenting
-- set clipboard=unnamed   " yank to the system register (*) by default
VIM_OPT.directory = "/tmp"
-- set vim swap file resides
VIM_OPT.foldmethod = "indent"
VIM_OPT.foldlevel = 99
VIM_OPT.history = 1000
VIM_OPT.incsearch = true
--incremental search
-------------------------------------------------------------------------------

VIM_OPT.errorbells = false
VIM_OPT.visualbell = false
-- disable sound on errors
-------------------------------------------------------------------------------

--[[ Nvim does not have special t_XX options nor <t_XX> keycodes to configure
     terminal capabilities. Instead Nvim treats the terminal as any other UI,
     e.g. 'guicursor' sets the terminal cursor style if possible. ]]--
-- VIM_OPT.t_vb = nil

VIM_OPT.ruler = true
-- show the cursor position all the time
VIM_OPT.showmatch = true
-- Cursor shows matching ) and }
VIM_OPT.showmode = false
-- Show current mode

--[[ Tell vim to remember certain things when we exit
  '10  :  marks will be remembered for up to 10 previously edited files
  "100 :  will save up to 100 lines for each register
  :20  :  up to 20 lines of command-line history will be remembered
  %    :  saves and restores the buffer list
  n... :  where to save the viminfo files ]]--
VIM_OPT.viminfo = vim.fn.expand("\'10,\"100,:20,%,n~/.viminfo")

VIM_OPT.wildchar = ('\t'):byte()
-- https://github.com/neovim/neovim/issues/18000
-- wild char completion menu

VIM_OPT.wildmenu = true
-- wild char completion menu

VIM_OPT.tm = 500
-- Time in milliseconds to wait for a mapped sequence to complete.
VIM_OPT.wmw = 0
-- set the min width of a window to 0 so we can maximize others
VIM_OPT.wmh = 0
-- set the min height of a window to 0 so we can maximize others
-- GUI
-------------------------------------------------------------------------------

VIM_OPT.modeline = false
VIM_OPT.foldenable = true

-- Work nicely with the system clipboard
-- set clipboard=unnamedplus
-- Number formats, for incrementing
VIM_OPT.nrformats = { "alpha", "octal", "hex" }

-- Use a short timeout for incomplete mappings
VIM_OPT.ttimeout = true
VIM_OPT.ttimeoutlen = 100

-- Highlight the current line
VIM_OPT.cursorline = true

-- Delete comment character(s) when joining commented lines
VIM_OPT.formatoptions = VIM_OPT.formatoptions + 'j'

-- Indent Guides
-- http://goo.gl/qfF9od
-- http://www.vim.org/scripts/script.php?script_id=3361
-- let g:indent_guides_guide_size = 1
VIM_OPT.colorcolumn = "120"

-- Highlight boundary
-- Show overlength line in different color.
VIM_CMD[[highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white]]
VIM_CMD[[match OverLength /\%121v.\+/]]


-- Search while typing
VIM_OPT.incsearch = true

-- Ignore certain patterns while searching
VIM_OPT.wildignore = "target,out,build_debug,build_release,build"
VIM_OPT.wildignore = VIM_OPT.wildignore + "Library,*.csproject,*.meta"
VIM_OPT.wildignore = VIM_OPT.wildignore + "_site,vendor,node_modules"
VIM_OPT.wildignore = VIM_OPT.wildignore + "*.o,*.d,*.a,*.c3b,*.ccz,Resource,*.class,*.jar,*.strings,*.plist,*.filters"
VIM_OPT.wildignore = VIM_OPT.wildignore + "*.xcscheme,*.xcworkspacedata,*.xcscmblueprint,*.properties,*.keystore"
VIM_OPT.wildignore = VIM_OPT.wildignore + "boost_*,googletest,*.proto,protobuf,*.txt,Frameworks,*.framework"
VIM_OPT.wildignore = VIM_OPT.wildignore + "*.vcxitems,*.xib,*.nib,*.pbxproj,*.xcuserstate,*.props"
VIM_OPT.wildignore = VIM_OPT.wildignore + "*.apk,*.iml"
VIM_OPT.wildignore = VIM_OPT.wildignore + "*.ogg,*.wav,*.mp3,*.mid,*.png,*.jpg,*.jpeg"
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
