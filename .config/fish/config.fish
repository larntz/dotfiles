if status is-interactive
    # Commands to run in interactive sessions can go here
    export GOPATH=$HOME/.gopath
    export EDITOR=/usr/local/bin/vi
    fish_vi_key_bindings
    starship init fish | source
end
