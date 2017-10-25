info "Hello there, STDOUT!"
warning "Hello there, STDERR!"
debug "Debug here, checking in!"

run "echo 'Hello from run, STDERR!' 1>&2"

on_utilities :elasticsearch do
  warning "This will not run - use strings instead of symbols, nitwit"
end
