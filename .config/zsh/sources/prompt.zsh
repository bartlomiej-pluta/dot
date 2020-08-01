fetch_vcs_info() {
  autoload -Uz vcs_info 
  precmd_vcs_info() { vcs_info }
  precmd_functions+=( precmd_vcs_info )
  setopt prompt_subst
  zstyle ':vcs_info:*'                  enable            git
  zstyle ':vcs_info:git:*'              stagedstr         "%F{green}"
  zstyle ':vcs_info:git:*'              unstagedstr       "%F{cyan}"
  zstyle ':vcs_info:git*+set-message:*' hooks             git-untracked
  zstyle ':vcs_info:git:*'              check-for-changes true
  zstyle ':vcs_info:git:*'              formats           '%b%c%u%m%a'
}

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='%F{magenta}'
  fi
}

prompt_git_info() {
  [ ! -z "$vcs_info_msg_0_" ] && echo "$vcs_info_msg_0_ "
}

load_prompt() {
  autoload -Uz add-zsh-hook    
  fetch_vcs_info

  sign='%(?.%F{blue}λ%f.%F{red}%f)'
  RPROMPT='%F{green}%*%f'
  PROMPT=$'%F{green}%~ %F{yellow}$(prompt_git_info)$sign '
}

load_prompt