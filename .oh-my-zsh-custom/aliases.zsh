if command -v thefuck 2>&1 >/dev/null
then
    eval $(thefuck --alias)
fi

alias c="clear"
alias config='/usr/bin/git --git-dir=$HOME/.configs/ --work-tree=$HOME'
alias f="fuck"
alias lh="ls -alth |head"
alias ll="ls -alh"
alias m="man"
alias n="nvim"
alias p="python3"
alias ss="ssh pokerfacowaty@212.7.200.55 -p 2000"
alias t="tldr --theme base16"
alias te="xfce4-terminal"
alias th="thunar"
alias v="vim"

# Main PC aliases
alias ebook-convert="/var/lib/flatpak/app/com.calibre_ebook.calibre/x86_64/stable/active/files/lib/calibre/ebook-convert"


