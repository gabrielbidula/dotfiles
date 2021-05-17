export LC_ALL=en_US.UTF-8
set PATH $HOME/.cargo/bin $PATH
set -g fish_user_paths "/usr/local/opt/php@7.3/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/php@7.3/sbin" $fish_user_paths

# GOLANG configurations
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -x GOROOT /usr/local/opt/go/libexec
set PATH $GOBIN $GOROOT/bin $PATH

