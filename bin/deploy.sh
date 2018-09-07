#!/bin/bash
#
# only run this in a production environment
if [[ "$RAILS_ENV" = "production" ]]; then
  cd /data/cpease_todo_mushyyGH/current
  ey_bundler_binstubs/ey deploy -a EY-Dedicated-Internal -e pillpack_testing -m --serverside-version=2.6.14
fi
