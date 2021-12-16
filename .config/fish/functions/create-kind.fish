function create-kind --argument cluster_name cluster_version cluster_size
kind create cluster --config $HOME/.config/kind/$cluster_size/$cluster_version.yaml --name $cluster_name
end
