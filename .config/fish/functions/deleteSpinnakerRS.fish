function deleteSpinnakerRS --wraps=kubectl\ get\ rs\ -n\ spinnaker\ -o\ json\ \|\ jq\ -r\ \'.items\[\]\|\ select\(.status.replicas\ ==\ 0\)\ \|\ .metadata.name\'\ \|\ xargs\ kubectl\ delete\ -n\ spinnaker\ rs --description alias\ deleteSpinnakerRS=kubectl\ get\ rs\ -n\ spinnaker\ -o\ json\ \|\ jq\ -r\ \'.items\[\]\|\ select\(.status.replicas\ ==\ 0\)\ \|\ .metadata.name\'\ \|\ xargs\ kubectl\ delete\ -n\ spinnaker\ rs
  kubectl get rs -n spinnaker -o json | jq -r '.items[]| select(.status.replicas == 0) | .metadata.name' | xargs kubectl delete -n spinnaker rs $argv; 
end
