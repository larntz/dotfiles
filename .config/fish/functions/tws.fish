function tws --wraps='terraform workspace select' --description 'alias tws=terraform workspace select'
  terraform workspace select $argv; 
end
