gnudate() {
  if hash gdate 2>/dev/null; then
    gdate "$@"
  else
    date "$@"
  fi
}
