# A prompt that fills my needs.
#
# Clojure features:
#  - None yet.
# Python features:
#  - None yet.

CLJ_PROJ=" λ"
PY_PROJ=" ℘"
UN_PROJ=" 🢖"
JVA_PROJ=" ♨"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}/"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="-[%{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="-[✔"

PROMPT='%{$fg[yellow]%}%1~%{$reset_color%}%{$fg[cyan]%}%{$reset_color%}$(git_prompt_info)%{$fg[cyan]%}$CLJ_PROJ%{$reset_color%} '
