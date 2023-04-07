function pass --wraps=strings\ /dev/urandom\ \|\ grep\ -o\ \'\[\]\[\(\)!,_.\[:alnum:\]-\]\'\ \|\ head\ -n\ 32\ \|\ tr\ -d\ \'\\n\'\;\ echo --description alias\ pass=strings\ /dev/urandom\ \|\ grep\ -o\ \'\[\]\[\(\)!,_.\[:alnum:\]-\]\'\ \|\ head\ -n\ 32\ \|\ tr\ -d\ \'\\n\'\;\ echo
  strings /dev/urandom | grep -o '[][()!,_.[:alnum:]-]' | head -n 32 | tr -d '\n'; echo $argv; 
end
