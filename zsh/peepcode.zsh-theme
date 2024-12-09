git_repo_path() {
  command git rev-parse --git-dir 2>/dev/null
}

git_current_branch() {
  command git symbolic-ref --short HEAD 2>/dev/null || command git describe --tags --exact-match HEAD 2>/dev/null
}

git_status_color() {
  local unstaged_files=$(git diff --name-only)
  local untracked_files=$(git ls-files --others --exclude-standard)

  if [[ -n "$unstaged_files" && -n "$untracked_files" ]]; then
    echo "%F{red}"
  elif [[ -n "$unstaged_files" ]]; then
    echo "%F{yellow}" 
  elif [[ -n "$untracked_files" ]]; then
    echo "%F{red}"
  else
    echo "%F{green}"
  fi
}

git_prompt() {
  local cb=$(git_current_branch)
  if [[ -n "$cb" ]]; then
    local repo_path=$(git_repo_path)
    local color=$(git_status_color)
    echo "$color  $cb"
  fi
}

local smiley='%(?.%F{green}󰘧%f.%F{red}󰘧%f)'

PROMPT='
${VIRTUAL_ENV:+(${VIRTUAL_ENV:t}) }%~
${smiley}  '

RPROMPT='%F{white} $(ruby_prompt_info)$(git_prompt)%{$reset_color%}'

export VIRTUAL_ENV_DISABLE_PROMPT=1

