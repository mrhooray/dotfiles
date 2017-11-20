function fish_title
  echo -n (whoami)@(hostname|cut -d . -f 1):(prompt_pwd)
end
