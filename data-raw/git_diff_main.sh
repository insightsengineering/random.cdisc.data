#!/bin/bash

# A script to diff the current branch against the project's true main branch.
# It handles both forked and non-forked repository scenarios robustly.
# Its primary output (stdout) is the list of changed files.
#
# Usage: ./git_diff_main.sh <main_repo_url>

set -e # Exit immediately if a command exits with a non-zero status.

# --- Helper Function to Normalize Git URLs ---
# This function reliably extracts the 'owner/repo' part from various URL formats.
normalize_git_url() {
  local url=$1
  # First, remove the optional .git suffix
  local repo_path=${url%.git}

  # Then, remove everything before the last colon or slash,
  # which typically separates the host from the repo path.
  repo_path=${repo_path##*[:/]}

  echo "$repo_path"
}

# --- 1. Validate Input ---
UPSTREAM_URL="$1"
if [ -z "$UPSTREAM_URL" ]; then
  # Print usage instructions to standard error
  echo "Usage: $0 <main_repo_url>" >&2
  exit 1
fi

# --- 2. Determine Target and Fetch ---
TARGET_REMOTE=""
ORIGIN_URL=$(git remote get-url origin 2>/dev/null || echo "") # Get origin URL or empty string

# Normalize both URLs to get just the 'owner/repo' string for comparison.
NORM_UPSTREAM_URL=$(normalize_git_url "$UPSTREAM_URL")
NORM_ORIGIN_URL=$(normalize_git_url "$ORIGIN_URL")

# Check if the normalized 'owner/repo' strings match
if [[ -n "$NORM_ORIGIN_URL" && "$NORM_ORIGIN_URL" == "$NORM_UPSTREAM_URL" ]]; then
  # Scenario: Running in the main (non-forked) repository.
  echo "Info: Running in main repo. Comparing against 'origin/main'." >&2
  TARGET_REMOTE="origin"
  git fetch origin main --quiet # Quietly fetch the main branch
else
  # Scenario: Running in a fork or in a misconfigured repo.
  echo "Info: Running in a fork. Comparing against 'upstream/main'." >&2
  echo "$NORM_ORIGIN_URL $NORM_UPSTREAM_URL" >&2
  TARGET_REMOTE="upstream"
  # Add or update the 'upstream' remote to point to the main repo
  if ! git remote get-url "$TARGET_REMOTE" &>/dev/null; then
    git remote add "$TARGET_REMOTE" "$UPSTREAM_URL"
  else
    git remote set-url "$TARGET_REMOTE" "$UPSTREAM_URL"
  fi
  git fetch "$TARGET_REMOTE" main --quiet # Quietly fetch the main branch
fi

TARGET_BRANCH="$TARGET_REMOTE/main"

# --- 3. Safety Check: Avoid Diffing a Branch Against Itself ---
CURRENT_TRACKING_BRANCH=$(git rev-parse --abbrev-ref @{u} 2>/dev/null || echo "")

if [[ "$CURRENT_TRACKING_BRANCH" == "$TARGET_BRANCH" ]]; then
  echo "Warning: Current branch is already tracking '$TARGET_BRANCH'. No changes to diff." >&2
  # Exit successfully with no output
  exit 0
fi

# --- 4. Final Output ---
# This is the script's primary output. It prints the list of changed
# files to standard output, which the calling script can capture.
git diff "$TARGET_BRANCH" --name-only
