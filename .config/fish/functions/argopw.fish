function argopw --wraps='kubectl get secret argocd-initial-admin-secret -n argocd -o json | jq -r .data.password | base64 -d | xclip -i -selection clipboard -o' --wraps='kubectl get secret argocd-initial-admin-secret -n argocd -o json | jq -r .data.password | base64 -d | xclip -i -selection clipboard' --wraps='kubectl get secret argocd-initial-admin-secret -n argocd -o json | jq -r .data.password | base64 -d | xclip -i -selection clipboard;echo password copied to clipboard' --description 'alias argopw=kubectl get secret argocd-initial-admin-secret -n argocd -o json | jq -r .data.password | base64 -d | xclip -i -selection clipboard;echo password copied to clipboard'
  kubectl get secret argocd-initial-admin-secret -n argocd -o json | jq -r .data.password | base64 -d | xclip -i -selection clipboard;echo password copied to clipboard $argv; 
end