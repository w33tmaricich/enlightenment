# A prompt that fills my needs.
#
# Clojure features:
#  - None yet.
# Python features:
#  - None yet.

CLJ_PROJ=" λ"
PY_PROJ=" 🐍"
JVA_PROJ=" ☕"
JS_PROJ=" ⬡"
#UN_PROJ="⛤"
UN_PROJ="⛬"
TF_SYMB="↳"

ENL_EXEC_TIME_SECONDS=5

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="-[%{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="-[✔"
ZSH_THEME_GIT_PROMPT_ADDED="-[%{$fg[red]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="-[%{$fg[red]%}✚%{$reset_color%}"

function displaytime {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%dd' $D
  [[ $H > 0 ]] && printf '%dh' $H
  [[ $M > 0 ]] && printf '%dm' $M
  printf '%ds' $S
}

function _in_repo() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1
}

function _path_color() {
  # If we are in a git repo, color the path green
  if $(_in_repo); then
    echo "%{%F{green}%}ᴳ"
  else
    echo ' '
  fi
}

function _node_version() {
  # If we are in a git repo
  if $(_in_repo); then
    # And we see a project.clj file.
    if $(find package.json >/dev/null 2>&1); then
      echo "" $(node --version)
    else
      echo ''
    fi
  else
    echo ''
  fi
}

function _clj_version() {
  # If we are in a git repo
  if $(_in_repo); then
    # And we see a project.clj file.
    if $(find project.clj >/dev/null 2>&1); then
      echo "" $(cat project.clj | grep org.clojure/clojure\ | awk '{ print $3 }' | sed s/\"//g | sed s/\]//g)
    else
      echo ''
    fi
  else
    echo ''
  fi
}

function _py_version() {
  # If we are in a git repo
  if $(_in_repo); then
    # And we see a project.clj file.
    if $(find *.py >/dev/null 2>&1); then
      echo "" $(python -c 'import sys; print(sys.version_info[:])' | sed s/\(//g | sed s/,\ /./g | sed s/\)//g | sed s/[a-z]//g | sed s/\'//g | sed s/\\.\\././g)
    else
      echo ''
    fi
  else
    echo ''
  fi
}

function _proj() {
}

function _js_info() {
  # If lein is installed, show lambda.
  if $(type nvm >/dev/null 2>&1); then
    echo "%{$fg[yellow]%}$JS_PROJ$(_node_version)%{$reset_color%}"
  else
    echo ''
  fi
}

function _clj_info() {
  # If lein is installed, show lambda.
  if $(type lein >/dev/null 2>&1); then
    echo "%{$fg[yellow]%}$CLJ_PROJ$(_clj_version)%{$reset_color%}"
  else
    echo ''
  fi
}

function _py_info() {
  # If lein is installed, show lambda.
  if $(type python >/dev/null 2>&1); then
    echo "%{$fg[yellow]%}$PY_PROJ$(_py_version)%{$reset_color%}"
  else
    echo ''
  fi
}

function _vi_mode() {
  NORMAL_MODE="%{$fg[red]%}"
  echo "${${KEYMAP/vicmd/$NORMAL_MODE}/(main|viins)/}"
}

PROMPT='%{$fg[cyan]%}$(_vi_mode)$UN_PROJ%{$reset_color%} %{$fg[yellow]%}%1~$(_path_color)%{$reset_color%}%{$fg[cyan]%}%{$reset_color%}
 %{$fg[cyan]%}$TF_SYMB %{$reset_color%}'

RPROMPT='$(_clj_info)$(_py_info)$(_js_info) $(git_prompt_info)%'
