function kk --wraps='kubectl kustomize ' --description 'alias kk=kubectl kustomize '
  kubectl kustomize  $argv; 
end
