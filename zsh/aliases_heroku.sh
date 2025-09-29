hdl() {
  local app=""
  local output=""
  local branch=""

  # Get current Git branch if we're in a Git repo
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git rev-parse --abbrev-ref HEAD)
  else
    echo "Not in a Git repo"
    return 1
  fi

  case "$PWD" in
  */d3m*)
    app="teldiod3"
    output="db/latest.dump"
    ;;
  */dealer_quote_tool*)
    case "$branch" in
    prod-msi)
      app="teldioquotetool-msi"
      output="db/msi.dump"
      ;;
    prod-otp)
      app="teldioquotetool-otp"
      output="db/otp.dump"
      ;;
    *)
      output="db/msi-${branch}.dump"
      ;;
    esac
    ;;
  *)
    echo "Unsupported project directory: $PWD"
    return 1
    ;;
  esac

  echo "Downloading backup for app: $app"
  echo "Saving to: $output"
  echo "Branch: $branch"

  heroku pg:backups:download -a "$app" -o "$output"
  curl -d "Download Complete for $app ($branch)" "https://ntfy.sh/teldio-$(whoami)"
}

hrs() {
  local db=""
  local dump=""
  local branch=""

  # Get current Git branch if we're in a Git repo
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git rev-parse --abbrev-ref HEAD)
  else
    echo "Not in a Git repo"
    return 1
  fi

  case "$PWD" in
  */d3m*)
    db="d3_development"
    dump="db/latest.dump"
    ;;
  */dealer_quote_tool*)
    db="dealer_quote_tool_development"
    case "$branch" in
    prod-msi)
      dump="db/msi.dump"
      ;;
    prod-otp)
      dump="db/otp.dump"
      ;;
    *)
      echo "Unsupported branch for dealer quote tool: $branch"
      return 1
      ;;
    esac
    ;;
  *)
    echo "Unsupported project directory: $PWD"
    return 1
    ;;
  esac

  echo "Restoring backup to: $db"
  echo "Using dump: $dump"
  echo "Branch: $branch"

  pg_restore --clean -d "$db" "$dump"
  curl -d "Restore Complete for $db ($branch)" "https://ntfy.sh/teldio-$(whoami)"
}
