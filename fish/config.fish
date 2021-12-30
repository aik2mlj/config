if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "$HOME/.local/bin" $PATH

set hostip (cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
# if not in wsl, uncomment this line
# set hostip 127.0.0.1
set port 7890

set PROXY_HTTP "http://$hostip:$port"
set -gx http_proxy "$PROXY_HTTP"
set -gx HTTP_PROXY "$PROXY_HTTP"
set -gx https_proxy "$PROXY_HTTP"
set -gx HTTPS_PROXY "$PROXY_HTTP"
git config --global http.proxy "$PROXY_HTTP"
git config --global https.proxy "$PROXY_HTTP"
npm config set proxy="$PROXY_HTTP"

set -gx EDITOR lvim

fzf_configure_bindings --directory=\cf

alias ls="exa --group-directories-first --icons"
alias la="exa -l -a --group-directories-first --icons"
alias ll="exa -l --group-directories-first --icons"

alias ra="ranger"
alias vim="nvim"

alias lg="lazygit"
alias gs="git status"
alias gl="git log --graph --full-history --all --color --pretty=tformat:\"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%x1b[33m(%an)%x1b[0m\""

set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $NPM_PACKAGES/bin $PATH
set MANPATH $NPM_PACKAGES/share/man $MANPATH

set PATH /home/aik2/.local/share/gem/ruby/3.0.0/bin $PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

