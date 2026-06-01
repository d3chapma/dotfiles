#!/usr/bin/env bash
set -euo pipefail

HOOK_TYPE="${1:-notification}"
TOPIC="${NTFY_TOPIC:-teldio-dc}"
BASE_URL="${NTFY_URL:-https://ntfy.sh}"

case "$HOOK_TYPE" in
notification)
  TITLE="Claude Code"
  TAGS="bell,robot_face"
  MESSAGE="Claude Code is waiting for your input."
  ;;
stop)
  TITLE="Claude Code"
  TAGS="white_check_mark,robot_face"
  MESSAGE="Claude Code session stopped or completed."
  ;;
pre_tool_use)
  TITLE="Claude Code"
  TAGS="gear"
  MESSAGE="Claude Code is about to use a tool."
  ;;
*)
  TITLE="Claude Code"
  TAGS="robot_face"
  MESSAGE="Claude Code hook triggered: ${HOOK_TYPE}"
  ;;
esac

curl -fsS \
  -H "Title: ${TITLE}" \
  -H "Tags: ${TAGS}" \
  -d "${MESSAGE}" \
  "${BASE_URL}/${TOPIC}"
