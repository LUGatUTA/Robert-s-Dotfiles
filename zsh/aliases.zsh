alias pacman="powerpill"
alias curl="curl -OL#"
alias s="sudo"
alias sv="sudo vim"
alias refup="sudo reflector --verbose --country 'United States' -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist"
alias rh="cd ~/"
alias ping3="ping -c 3 www.google.com"
alias py="python"
alias pyin="sudo pip install"
alias pyun="sudo pip uninstall"
alias py2="python2"
alias py2in="sudo pip2 install"
alias py2un="sudo pip2 uninstall"
alias cp='cp -iv'
alias rcp='rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --'
alias rmv='rsync -v --progress --remove-source-files'
alias mv='mv -iv'
alias rm='rm -iv'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias chmod="chmod -c"
alias chown="chown -c"

if command -v colordiff > /dev/null 2>&1; then
	alias diff="colordiff -Nuar"
else
	alias diff="diff -Nuar"
fi

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias ls='ls --color=auto --human-readable --group-directories-first --classify'
