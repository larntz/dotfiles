function t --wraps=task --wraps=clear --wraps='clear; task' --description 'alias t clear; task'
  clear; task $argv; 
end
