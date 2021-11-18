if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH "$HOME/.cargo/bin" $PATH;

set hostip (cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
set port 7890

set PROXY_HTTP "http://$hostip:$port"
set -gx http_proxy "$PROXY_HTTP"
set -gx HTTP_PROXY "$PROXY_HTTP"
set -gx https_proxy "$PROXY_HTTP"
set -gx HTTPS_PROXY "$PROXY_HTTP"
git config --global http.proxy "$PROXY_HTTP"
git config --global https.proxy "$PROXY_HTTP"

set -gx EDITOR nvim

fzf_configure_bindings --directory=\cf

alias ls="exa --group-directories-first --icons"
alias la="exa -l -a --group-directories-first --icons"
alias ll="exa -l --group-directories-first --icons"

alias ra="ranger"
alias vim="nvim"
