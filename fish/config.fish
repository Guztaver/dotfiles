if status is-interactive
    # Commands to run in interactive sessions can go here
end

#Bat in place of cat
alias cat="batcat"
alias catp="batcat --plain"

#Linux
alias apt="nala"

#Git
alias ga="git add ."
alias gc="git commit -m"
alias gp="git pull"
alias gs="gi push"

#Kitty
alias kitten="kitty +kitten"
starship init fish | source

#fish
alias fish_source="source $HOME/.config/fish/config.fish"
alias fish_edit_conf="editor $HOME/.config/fish/config.fish"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
