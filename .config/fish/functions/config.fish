function config --wraps='/usr/bin/git --git-dir=$HOME/Documents/desktop-configuration/dotfiles/ --work-tree=$HOME' --description 'alias config=/usr/bin/git --git-dir=$HOME/Documents/desktop-configuration/dotfiles/ --work-tree=$HOME'
  /usr/bin/git --git-dir=$HOME/Documents/desktop-configuration/dotfiles/ --work-tree=$HOME $argv; 
end
