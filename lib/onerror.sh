onerror(){
  log-error "There was an error in your script with code: $?"
  while caller $((n++)); do :; done; # Stack trace
}
