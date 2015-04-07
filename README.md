# Robert's Dotfiles.

Repository of my personally used dotfiles (based on [Lion Krischer's dotfiles](https://github.com/krischer/dotfiles). Thanks!) for vim, zsh, termite, and tmux. I use Arch so I've localized some paths but it should work on OSX (Everything but the paths remain unchanged from the original branch) and other Linux distros.

Currently aims to be a development environment for Python & C.

## Screenshot
![Result](https://raw.github.com/rghamilton3/dotfiles/master/images/screenshot.png)

## Installation
### Requirements
* git from official repos
* tmux from official repos
* vim from official repos (Other distros may need vim with ruby bindings)
* zsh >= 4.3 from official repos
* Ctags from the official repos or [Exuberant Ctags](http://ctags.sourceforge.net/) (not the ctags that ships with OSX)
* The terminal emulator has to use a patched font. Otherwise the vim-powerline and the tmux status line will not work properly. Get all of them from the [AUR](https://aur.archlinux.org/packages/powerline-fonts-git), search the AUR for individual fonts or [here on Github](https://github.com/Lokaltog/powerline-fonts).
* [Termite colors solarized](https://github.com/alpha-omega/termite-colors-solarized) or [Solarized color scheme](http://ethanschoonover.com/solarized) for the terminal emulator.
* For Python syntax checking: flake8 and/or python2-flake8 from the official repos or [flake8](https://pypi.python.org/pypi/flake8) (`pip install flake8`)
* Optional: Install [Termite stable from the AUR](https://aur.archlinux.org/packages/termite/), [Termite-git from the AUR](https://aur.archlinux.org/packages/termite-git/), or [Termite from github](https://github.com/thestinger/termite)

### Actual installation

It **has to be installed to ~/.dotfiles** as otherwise it is just a pain to deal
with relative path in all the different ways. This makes it possible to use
absolute paths and thus avoids all these pitfalls.

    git clone https://github.com/rghamilton3/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    # The install script will init and update all submodules and symlink all
    # necessary files.
    sh install_dotfiles.sh
    # Optional: Change the default shell to zsh
    chsh -s `which zsh`

## Aliases

### General

    alias curl="curl -O -Li -#" | Write output to a local file named like the remote file, progress bar, location (follow redirects),
    alias s="sudo"
    alias sv="sudo vim" | I use [SudoEdit.vim](https://github.com/chrisbra/SudoEdit.vim) now
    alias refup="sudo reflector --verbose --country 'United States' -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist" | I have this as a service but just in case
    alias rh="cd ~/" | Return Home
    alias ping3="ping -c 3 www.google.com" | Quickly ping for troubleshooting
    alias py="python" | !!! This starts Python 3 (Arch's default)
    alias pyin="sudo pip install" | !!! This installs using Pip 3 (Always check to see if your distro provides a package first!)
    alias pyun="sudo pip uninstall" | !!! This uninstalls using Pip 3
    alias py2="python2" | This starts Python 2
    alias py2in="sudo pip2 install" | (Always check to see if your distro provides a package first!)
    alias py2un="sudo pip2 uninstall"
    alias cp='cp -iv' | Prompt before overwrite, verbose
    alias mv='mv -iv' | Prompt before overwrite, verbose
    alias rm='rm -iv' | Prompt before remove, verbose
    alias ln='ln -v' | verbose
    alias chmod="chmod -c" | Like verbose but report only when a change is made
    alias chown="chown -c" | Like verbose but report only when a change is made

### Arch specific

    alias pacman="powerpill" | Always use powerpill for multithreading (I use yaourt almost excusively so when it calls pacman this alias will use powerpill instead)

## Vim configuration

### General shortcuts

    ,sv<space>| (Source Vim) source (aka reload) the vimrc
    vap       | (Visual Around Paragraph) visually select this paragraph.
    ci"       | (Change Inside ") change inside the double quotes
    ci'       | (Change Inside ') change inside the single quotes
    cib       | (Change Inside Bracket) change inside brackets
    diw       | (Delete Inside Word) delete the current word
    gg=G      | Autoindent (=) the whole file

### How to use folding in vim

    zf#j      | Creates a fold from the cursor down # lines.
    zf/string | Creates a fold from the cursor to string .
    zj        | Moves the cursor to the next fold.
    zk        | Moves the cursor to the previous fold.
    zo        | Opens a fold at the cursor.
    zO        | Opens all folds at the cursor.
    zm        | Increases the foldlevel by one.
    zM        | Closes all open folds.
    zr        | Decreases the foldlevel by one.
    zR        | Decreases the foldlevel to zero -- all folds will be open.
    zd        | Deletes the fold at the cursor.
    zE        | Deletes all folds.
    [z        | Move to start of open fold.
    ]z        | Move to end of open fold.

(from [here](https://www.linux.com/learn/tutorials/442438-vim-tips-folding-fun))


### Regex in vim
    .  any character except new line
    \s whitespace character                      \S non-whitespace character
    \d digit                                     \D non-digit
    \x hex digit                                 \X non-hex digit
    \o octal digit                               \O non-octal digit
    \h head of word character (a-z,A-Z, and _)   \H non-head of word character
    \p printable character                       \P like \p, but excluding digits
    \w word character                            \W non-word character
    \a alphabetic character                      \A non-alphabetic character
    \l lowercase character                       \L non-lowercase character
    \u uppercase character                       \U non-uppercase character

    *      matches 0 or more of the preceding characters
    .*     matches everything including an empty line
    \+     matches 1 or more of the preceding characters
    \=     matches 0 or 1 more of the preceding characters
    \{n,m} matches from n to m of the precedingding characters
    \{n}   matches exactly n times of the preceding characterscters
    \{,m}  matches at most m (from 0 to m) of the preceding characters
    \{n,}  matches at least n of of the preceding characters
    where n and m are positive integers (>0)

(from [http://vimregex.com](http://vimregex.com) - also has much much more info on vim regex)

### vim-surround
Selecting something in visual mode and then pressing __S__ and a char wraps the selection with the char.

    cs"'      | (Changes Surrounding " to ')
    ds'       | (Delete Surrounding ')
    ysiwb     | (Yank Surround Inside Word Bracket) Surround the current word with brackets.
    ysiw[     | (Yank Surround Inside Word [) Wrap word with square brackets and one space.
    ysiw]     | (Yank Surround Inside Word [) Wrap word with square brackets without spaces.
    ysiw<em>  | Surround word with <em>word</em>. Correctly closes the ending tag.

Special __ss__ always wraps the whole line ignoring leading whitespaces.

    yssb      | (Yank Surround Brackets) Surround the current line with brackets.

### Tcomment

    TODO

### Syntastic

    ,s<space> | Toggle Syntastic. Useful as it is slow for very large files.
    ,er       | Toggle the Syntax error window. Off by default.

### TODO 
   
   Finish rest of plugins

