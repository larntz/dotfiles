set __fish_git_prompt_color_branch 458588

function fish_prompt
  set_color 928374
  echo \n(pwd)
  echo -n (date +"%b %d %T%z")
  set_color normal
  printf '%s' (__fish_git_prompt)
  echo -n " \$ "
end
