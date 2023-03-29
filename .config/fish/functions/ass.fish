function ass --wraps='aws sso login --profile ' --description 'alias ass aws sso login --profile '
  if count $argv > /dev/null 
    aws sso login --profile $argv; 
  else 
    aws sso login
  end
end
