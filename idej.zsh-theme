# idej prompt

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg[yellow]%}${PWD/#$HOME/~}$(git_prompt_info)%{$reset_color%} %{$reset_color%}'

#show ruby version for rvm and rbenv
if which rvm-prompt &> /dev/null; then
  RPROMPT='%{$fg[grey]%}$(rvm-prompt i v g)%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    RPROMPT='%{$fg[grey]%}$(rbenv version-name)%{$reset_color%}'
  fi
fi