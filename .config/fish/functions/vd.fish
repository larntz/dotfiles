function vd --wraps='velero describe backup --details' --description 'alias vd=velero describe backup --details'
  velero describe backup --details $argv; 
end
