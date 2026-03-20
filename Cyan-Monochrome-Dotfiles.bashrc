#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias pac="sudo pacman -S"
alias pacs="sudo pacman -Ss"
alias pacu="sudo pacman -Syy"
alias update="sudo pacman -Syyu"
alias mirrors="sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias clean="sudo pacman -Scc"
alias remove="sudo pacman -R"
alias info="sudo pacman -Qi"
alias aur="yay -S"
alias aurno="yay -S --noconfirm"

export PATH="/usr/local/bin:$HOME/.cargo/bin:$PATH"
eval "$(starship init bash)"
