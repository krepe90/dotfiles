#!/bin/bash
# Read JSON input once
input=$(cat)

# Helper functions for common extractions
get_model_name() { echo "$input" | jq -r '.model.display_name'; }
get_current_dir() { echo "$input" | jq -r '.workspace.current_dir'; }
get_project_dir() { echo "$input" | jq -r '.workspace.project_dir'; }
get_version() { echo "$input" | jq -r '.version'; }
get_cost() { echo "$input" | jq -r '.cost.total_cost_usd'; }
get_duration() { echo "$input" | jq -r '.cost.total_duration_ms'; }
get_lines_added() { echo "$input" | jq -r '.cost.total_lines_added'; }
get_lines_removed() { echo "$input" | jq -r '.cost.total_lines_removed'; }
get_rate_limit_5h_used() { echo "$input" | jq -r '.rate_limits.five_hour.used_percentage'; }
get_rate_limit_5h_resets() { echo "$input" | jq -r '.rate_limits.five_hour.resets_at'; }
get_rate_limit_7d_used() { echo "$input" | jq -r '.rate_limits.seven_day.used_percentage'; }
get_rate_limit_7d_resets() { echo "$input" | jq -r '.rate_limits.seven_day.resets_at'; }

# Use the helpers
model_name=$(get_model_name)
cwd=$(get_current_dir)
username=$(whoami)
rate_limit_5h_used=$(get_rate_limit_5h_used)

# Color codes
CYAN=$(tput setaf 45)
YELLOW=$(tput setaf 11)
GREEN=$(tput setaf 2)
GRAY=$(tput setaf 8)
RESET=$(tput sgr0)
BOLD=$(tput bold)

# Get git branch info (use original path before collapsing)
git_info=''
if cd "$cwd" 2>/dev/null && git --no-optional-locks rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || git --no-optional-locks rev-parse --short HEAD 2>/dev/null)
    [ -n "$branch" ] && git_info=" ($branch)"
fi

# Collapse $HOME to ~ for display
cwd="${cwd/#$HOME/~}"

printf "${CYAN}%s${RESET} ${GREEN}%s${RESET} ${GRAY}%s%%${RESET} %s" "$username" "$model_name" "$rate_limit_5h_used" "$cwd"
[ -n "$git_info" ] && printf "${YELLOW}%s${RESET}" "$git_info"

exit 0
