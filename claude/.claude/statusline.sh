#!/bin/bash
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
DIR=$(echo "$input" | jq -r '.workspace.current_dir')
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
DURATION_MS=$(echo "$input" | jq -r '.cost.total_duration_ms // 0')

# COLORS
BOLD_RED='\033[1;31m'; BOLD_CYAN='\033[1;36m'; BOLD_WHITE='\033[1;37m'
BOLD_BLUE='\033[1;34m'; RED='\033[31m'; YELLOW='\033[33m'; BLUE='\033[34m'
CYAN='\033[36m'; GREEN='\033[32m'; RESET='\033[0m'

# CONTEXT BAR
if [ "$PCT" -ge 90 ]; then BAR_COLOR="$RED"
elif [ "$PCT" -ge 70 ]; then BAR_COLOR="$YELLOW"
else BAR_COLOR="$GREEN"; fi

FILLED=$((PCT / 10)); EMPTY=$((10 - FILLED))
# FFFEEEEEEE
# ▒▒▒░░░░░░░
BAR=$(printf "%${FILLED}s" | sed -e 's/\s/░/g')$(printf "%${EMPTY}s" | sed -e 's/\s/▒/g')

# COST
MINS=$((DURATION_MS / 60000)); SECS=$(((DURATION_MS % 60000) / 1000))
COST_FMT=$(printf '$%.2f' "$COST")

# GIT 
BRANCH=""
git rev-parse --git-dir > /dev/null 2>&1 && BRANCH="git:(${BOLD_RED}$(git branch --show-current 2>/dev/null)${RESET})"

# STATUSLINE
echo -e "${BOLD_RED}[${RESET}${BOLD_WHITE}${MODEL}${RESET} @ ${DIR##*/} ${BOLD_RED}]${RESET} ${BRANCH}"
echo -e "${BAR_COLOR}${BAR}${RESET} ${PCT}% | ${BOLD_CYAN}${COST_FMT}${RESET} | ${BOLD_WHITE}${MINS}m ${SECS}s${RESET}"
