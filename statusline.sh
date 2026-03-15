#!/usr/bin/env bash

input=$(cat)

# Model display name
model=$(echo "$input" | jq -r '.model.display_name // "unknown"')

# Context used percentage
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Session duration from cost.total_duration_ms
duration_ms=$(echo "$input" | jq -r '.cost.total_duration_ms // empty')

# Git branch (skip if not in a git repo or git not available)
git_part=""
if command -v git >/dev/null 2>&1; then
    branch=$(git -C "$(echo "$input" | jq -r '.cwd // "."')" rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ] && [ "$branch" != "HEAD" ]; then
        git_part="🌿 ${branch} | "
    fi
fi

# Context percentage display
ctx_part=""
if [ -n "$used_pct" ]; then
    used_int=$(echo "$used_pct" | awk '{printf "%d", int($1 + 0.5)}')
    ctx_part=" | ctx: ${used_int}%"
fi

# Duration display
dur_part=""
if [ -n "$duration_ms" ]; then
    total_s=$(( ${duration_ms%.*} / 1000 ))
    mins=$(( total_s / 60 ))
    secs=$(( total_s % 60 ))
    dur_part=" | ${mins}m ${secs}s"
fi

printf "%s%s%s%s\n" "${git_part}" "${model}" "${ctx_part}" "${dur_part}"
