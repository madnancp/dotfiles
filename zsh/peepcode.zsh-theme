git_repo_path() {
  command git rev-parse --git-dir 2>/dev/null
}

git_current_branch() {
  command git symbolic-ref --short HEAD 2>/dev/null || command git describe --tags --exact-match HEAD 2>/dev/null
}

git_prompt() {
  local cb=$(git_current_branch)
  if [[ -n "$cb" ]]; then
    local repo_path=$(git_repo_path)
    echo " %{$fg[green]%} $cb"
  fi
}

local smiley='%(?.%F{green}󰘧%f.%F{red}󰘧%f)'

PROMPT='
${VIRTUAL_ENV:+(${VIRTUAL_ENV:t}) }%~
${smiley}  '


RPROMPT='%F{white} $(ruby_prompt_info)$(git_prompt)%{$reset_color%}'

export VIRTUAL_ENV_DISABLE_PROMPT=1

