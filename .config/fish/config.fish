if status is-interactive
    # Commands to run in interactive sessions can go here
    export GOPATH=$HOME/.gopath
    starship init fish | source
end
