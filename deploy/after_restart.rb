info "Hello there, STDOUT!"
warning "Hello there, STDERR!"
debug "Debug here, checking in!"

run "echo 'Hello from run, STDERR!' 1>&2"
