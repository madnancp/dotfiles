preexec() {
  timer=$(($(date +%s%N)/1000000)) # Start timer in milliseconds
}

# Print elapsed time after the command execution
precmd() {
  if [[ -n "$timer" ]]; then
    local now=$(($(date +%s%N)/1000000))
    local elapsed=$((now - timer))
    timer="" # Reset timer

  # Convert milliseconds to seconds and print in yellow
    if [[ $elapsed -ge 1000 ]]; then
      echo -e "\n\033[1;33m$(printf "%d.%03d" $((elapsed / 1000)) $((elapsed % 1000))) s\033[0m"
    else
      echo -e "\n\033[1;33m$elapsed ms\033[0m"
    fi
  fi
}

# Function for the Git information
git_repo_path() {
  command git rev-parse --git-dir 2>/dev/null
}

git_commit_id() {
  command git rev-parse --short HEAD 2>/dev/null
}

git_mode() {
  if [[ -e "$repo_path/BISECT_LOG" ]]; then
    echo "+bisect"
  elif [[ -e "$repo_path/MERGE_HEAD" ]]; then
    echo "+merge"
  elif [[ -e "$repo_path/rebase" || -e "$repo_path/rebase-apply" || -e "$repo_path/rebase-merge" || -e "$repo_path/../.dotest" ]]; then
    echo "+rebase"
  fi
}

git_dirty() {
  if [[ "$repo_path" != '.' && -n "$(command git ls-files -m)" ]]; then
    echo " %{$fg_bold[grey]%}✗%{$reset_color%}"
  fi
}

git_current_branch() {
  command git symbolic-ref --short HEAD 2>/dev/null || command git describe --tags --exact-match HEAD 2>/dev/null
}

git_prompt() {
  local cb=$(git_current_branch)
  if [[ -n "$cb" ]]; then
    local repo_path=$(git_repo_path)
    echo " %{$fg[white]%}git:$cb %{$fg[white]%}$(git_commit_id)%{$reset_color%}$(git_mode)$(git_dirty)"
  fi
}

# Define smiley for the left prompt
local smiley='%(?.%F{green}󰘧%f.%F{red}󰘧%f)'

PROMPT='
${VIRTUAL_ENV:+(${VIRTUAL_ENV:t}) }%~
${smiley}  '

RPROMPT='%F{white} $(ruby_prompt_info)$(git_prompt)%{$reset_color%}'

# Disable automatic virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1


