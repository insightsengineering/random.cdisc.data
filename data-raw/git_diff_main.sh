#!/bin/bash

# A script to diff the current branch against the project's true main branch.
# It handles both forked and non-forked repository scenarios robustly.
# Its primary output (stdout) is the list of changed files.
#
# Usage: ./git_diff_main.sh <main_repo_url>

set -e # Exit immediately if a command exits with a non-zero status.

# --- Helper Function to Normalize Git URLs ---
# This function reliably extracts the 'owner/repo' part from various URL formats.
# This function reliably extracts the 'owner/repo' part from various URL formats.
normalize_git_url() {
  local url=$1
  # Step 1: Remove an optional trailing slash
  local repo_path=${url%/}
  # Step 2: Remove the optional .git suffix
  repo_path=${repo_path%.git}
  # Step 3: Use a regular expression to extract the 'owner/repo' part
  repo_path=$(echo "$repo_path" | sed -E 's|.*[:/]([^/]+/[^/]+)$|\1|')

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
echo "Info: Analyzing repository remotes..." >&2
TARGET_REMOTE=""
ORIGIN_URL=$(git remote get-url origin 2>/dev/null || echo "") # Get origin URL or empty string

# Normalize both URLs to get just the 'owner/repo' string for comparison.
NORM_UPSTREAM_URL=$(normalize_git_url "$UPSTREAM_URL")
NORM_ORIGIN_URL=$(normalize_git_url "$ORIGIN_URL")

# Show the normalized URLs for debugging
if [[ -z "$NORM_ORIGIN_URL" ]]; then
  echo "Warning: 'origin' remote not found or has no URL." >&2
else
  echo "Info: 'origin' remote URL found." >&2
fi

echo "Info: Normalized URLs (owner/repo):" >&2
echo "Info:      ORIGIN_URL  -  $NORM_ORIGIN_URL" >&2
echo "Info:    UPSTREAM_URL  -  $NORM_UPSTREAM_URL" >&2

# Check if the normalized 'owner/repo' strings match
if [[ -n "$NORM_ORIGIN_URL" && "$NORM_ORIGIN_URL" == "$NORM_UPSTREAM_URL" ]]; then
  # Scenario: Running in the main (non-forked) repository.
  echo "Info: Detected main repository." >&2
  TARGET_REMOTE="origin"
  echo "Info: Fetching latest data from 'origin' remote... (this may take a moment)" >&2
  git fetch origin main --quiet
else
  # Scenario: Running in a fork or a repo with a mismatched origin URL.
  echo "Info: Detected fork. Configuring 'upstream' remote." >&2
  TARGET_REMOTE="upstream"
  # Add or update the 'upstream' remote to point to the main repo
  if ! git remote get-url "$TARGET_REMOTE" &>/dev/null; then
    git remote add "$TARGET_REMOTE" "$UPSTREAM_URL"
  else
    git remote set-url "$TARGET_REMOTE" "$UPSTREAM_URL"
  fi
  echo "Info: Fetching latest data from 'upstream' remote... (this may take a moment)" >&2
  git fetch "$TARGET_REMOTE" main --quiet
fi

TARGET_BRANCH="$TARGET_REMOTE/main"

# --- 3. Safety Check: Avoid Diffing a Branch Against Itself ---
CURRENT_TRACKING_BRANCH=$(git rev-parse --abbrev-ref '@{u}' 2>/dev/null || echo "")

if [[ "$CURRENT_TRACKING_BRANCH" == "$TARGET_BRANCH" ]]; then
  echo "Warning: Current branch is already tracking '$TARGET_BRANCH'. No changes to diff." >&2
  # Exit successfully with no output
  exit 0
fi

# --- 4. Final Output ---
echo "Info: Comparing files against '$TARGET_BRANCH'..." >&2
git diff "$TARGET_BRANCH" --name-only

echo "Info: Done." >&2
