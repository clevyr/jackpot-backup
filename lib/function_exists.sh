# Determines if a function exists.
#
# @param    {string} $1   - The function name
# @returns  {string}      - The function if it exists, otherwise nothing
function_exists() {
  declare -f -F $1
}
