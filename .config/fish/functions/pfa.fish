function pfa --wraps='kubectl port-forward svc/argocd-server 8080:80 -n argocd' --description 'alias pfa=kubectl port-forward svc/argocd-server 8080:80 -n argocd'
  kubectl port-forward svc/argocd-server 8080:80 -n argocd $argv; 
end
