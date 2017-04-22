# Text colors
ERROR='\033[0;31m'    # Red
SUCCESS='\033[0;32m'  # Green
INFO='\033[0;36m'     # Cyan
NC='\033[0m'          # No Color

log () {
  echo -e "${INFO}$1${NC}"
}

log-success () {
  echo -e "${SUCCESS}$1${NC}"
}

log-error () {
  echo -e "${ERROR}$1${NC}"
}
