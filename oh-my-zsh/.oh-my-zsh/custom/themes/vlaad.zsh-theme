# Put your custom themes in this folder.
# Example:

PROMPT='%{$fg_bold[red]%}[%{$fg_bold[cyan]%} %n %{$fg_bold[white]%}@%{$fg_bold[cyan]%} %m %{$reset_color%}%~ %{$fg_bold[red]%}]%{$reset_color%} $(git_prompt_info)'
RPROMPT='%t'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
