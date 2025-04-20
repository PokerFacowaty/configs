if command -v thefuck 2>&1 >/dev/null
then
    eval $(thefuck --alias)
fi

alias f="fuck"
alias ss="ssh pokerfacowaty@212.7.200.55 -p 2000"
alias p="python3"
alias ll="ls -alh"
alias lh="ls -alth |head"
alias n="nvim"
alias v="vim"

# Main PC aliases
alias ebook-convert="/var/lib/flatpak/app/com.calibre_ebook.calibre/x86_64/stable/active/files/lib/calibre/ebook-convert"

alias config='/usr/bin/git --git-dir=$HOME/.configs/ --work-tree=$HOME'

