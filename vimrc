" ========================================================================
" * Eric's mashed-together .vimrc file. Still needs hecca work!
"
"   Linux GUI: Open All New Docs in Just 1 Interface
"   See setup_Laptop.txt for a solution that works using GNOME preferences.
"

" ========================================================================
" * Key Mapping
"
"   Sanitize my cut and pase options to Mozilla- and GNOMEier friendly settings.
"   This map assign Ctrl-C and Ctrl-V to copy and paste, as with MS-Windows. NB, 
"   use Ctrl-Q to enter VISUAL BLOCK mode.
source $VIMRUNTIME/mswin.vim
"
"   DEPRECIATED
"   This map assigns Ctrl+C to copy in visual mode (ie. when highligted by mouse).
"vmap <C-C> "+y
"   This is still not perfect. Screen bobs around but better than nada. 
"
"   Ctrl-S saves in insert mode. Returns to insert mode after the save:
"imap <c-s> <c-o><c-s>
"
"   Insert a new line while remaining command mode, but stay on the line where 
"   the cursor is positioned:
map <S-Enter> O<Esc>j
map <CR> o<Esc>k
" 

" ========================================================================
" * Mobile Device  
"
"   My Nokia N810 uses pound sign for Esc. Currently using duplicate map settings
"   to work best with vi.
map £ <Esc>
map! £ <Esc>
imap £ <Esc> 
"
"   The following command will save and then re-enter insert mode in the same
"   place.
map € <Esc>:w<CR>a
map! € <Esc>:w<CR>a
imap € <Esc>:w<CR>a
"

" ========================================================================
" * Interface Options
"
"   Make smaller text w/ font avaliable on ubuntu.
set gfn=TlwgMono\ Bold\ 10
"   
"   Have interface colors be all cool colors & get rid of toolbar
"   on gvim GUI:
set guioptions-=T
"
"   Ensure vim works like vim instead of like vi:
set nocompatible
"
"   Syntax color highlighting enables parts of text (tags, functions, etc) to be
"   shown in a different color to ease the visualization of the text file. This 
"   is done based on the file extension (.php,.sql,.html,etc).
syntax enable
"

" ========================================================================
" * Line Tabs -- Python Style
"
"   Make current line's indent level set indent level for new lines
set autoindent
set smartindent
"   And have new line guess indent level based on old line using C language
"   standards.
"
"   Get tabs to be python-standard 4 spaces long, then 4 more, etc.
set tabstop=4
set shiftwidth=4
set expandtab
"   And make sure that the 'Tab' key inserts spaces instead of an actual Tab.
"
"   By default, the tab labels are shown at the top of the Vim window only
"   when tabs are open. If you want to see the tab bar all the time, you can 
"   modify the showtabline option in your .vimrc. To set this to display all 
"   of the time, use: 
set showtabline=2
"

" ========================================================================
" * Search & Replace
"
"   Make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
"   
"   Show the 'best match so far' as search strings are typed:
set incsearch
"
"   Search for text as you enter it, then press Enter to accept the match
"   Allows the cursor to freely roam anywhere it likes in command mode:
set virtualedit=all
"

" ========================================================================
" * 'Quicker Is Better' Editing 
" 
"   Often I have to insert only one character (typically a paren):
map ,i i?<Esc>r
"   and
map ,a a?<Esc>r
"
"   Work better with lines.
"   Mark the characters which are over an Nth character limit:
" :match ErrorMsg '\%>Nv.\+'
"   So, mark the character ovever the eighty character limit:
" :match ErrorMsg '\%>80v.\+'
"

" ========================================================================
" * Spelling -- Mistake Correction
"
"   Correct my common typos without me even noticing them:
abbreviate teh the
"

" ========================================================================
" * Keystrokes -- Editing in Command
" 
"   Insert space from command mode
"   
noremap <Space> i<Space><Esc>
"   [<Space> by default is like l, <BkSpc> like h, and - like k.]
vmap <Backspace> x
nmap <Backspace> hx
"

" ========================================================================
" * No Backup -- End Swap Madness
" 
"   No backup files, no write to backup while editing, and use no swap file.
set nobackup       
set nowritebackup  
set noswapfile
"

" ========================================================================
" * Word Wrap
"
"   Don't enable line #'s unless it doesn't look weird with displayed lines.
set nu
color murphy
hi LineNr guifg=white guibg=darkgreen
hi LineNr ctermfg=white ctermbg=darkgreen
"
" Don't linebreak on words, and show all lines possible (no @ lines).
set linebreak
set display+=lastline
"
"
"   Mapping in normal mode
"   Deal with moving around with j and k key in lines greater than width of vim
"   instance:
nmap j gj
nmap k gk
" 
"   Ditto for across lines:
nmap $ g$
nmap ^ g^
"   Ensure that up and down arrow keys also work when in normal & insert modes:
nmap <DOWN> gj
nmap <UP> gk
imap <DOWN> <Esc>gja
imap <UP> <Esc>gka
"

" ========================================================================
" * MS-Windows
"
"   Adjust file endcoding so that I can read my utf-8 files in Windows.
set enc=utf-8
"
"   This assigns the file endings in Windows to have no ^M.
set ffs=unix,dos
"

" ========================================================================
" * Functions
"
"   Parse Gutenberg text.
"
function Gutenberg()
"   Cut out stand, end.
    tabdo %s/The Project Gutenberg EBook\_.\{-}We need your donations./\r/g 
    tabdo %s/The Project Gutenberg EBook\_.\{-}\n *\n *\n *\n *\n/\r/g 
    tabdo %s/End of Project Gutenberg\_.\{-}newsletter to hear about new eBooks\./\r/g 
"   Join all intra-paragraph line endings.
"
    tabdo %s/\(\S\)\n\(\S\)/\1 \2/g
"
"   Half # duplicative line breaks.
    tabdo %s/\n *\n/\r/g
"
endfunction
"
"
"   Convert math markup to Greek/symbols.
"
function MathS()
"   Symbols
    %s/(within)/∈/g
    %s/(not within)/∉/g
    %s/(for all)/∀/g
    %s/(for every)/∀/g
    %s/(there exists)/∃/g
    %s/(exists)/∃/g
    %s/(and)/∧/g
    %s/(or)/∨/g
    %s/(less equal)/≤/g
    %s/(greater equal)/≥/g
    %s/(not equal)/≠/g
    %s/(isomorphic)/≅/g
    %s/(contains)/⊇/g
    %s/(subset)/⊆/g
    %s/(union)/U/g
    %s/(intersect)/Ո/g
    %s/(equivalent)/≡/g
    %s/(not equivalent)/≢/g
    %s/(plus or minus)/±/g
    %s/(not divides)/∤/g
    %s/(sub)/ˇ/g
"   Greek
    %s/(lalpha)/α/g
    %s/(bdelta)/Δ/g
    %s/(ltheta)/θ/g 
    %s/(lmu)/μ/g 
    %s/(lrho)/ρ/g
    %s/(lsigma)/σ/g
    %s/(bsigma)/Σ/g
    %s/(lphi)/φ/g
    %s/(bphi)/Φ/g
    %s/(lpsi)/ψ/g
    %s/(bpsi)/Ψ/g
    %s/(lomega)/ω/g
    %s/(bomega)/Ω/g
"
endfunction
"

" ========================================================================
" * Abbreviations
"      
"   You can use the strftime() function to insert the current data/time stamp
"   in a file. For example, you can use the following abbreviation:
    iabbrev dts <C-R>=strftime("%y/%m/%d %H:%M")<CR>
"
" * End Added
