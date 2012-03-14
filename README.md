# Todo for everyone

Simple GTD app for task tracking.

Supports all Rubies and many stacks (passenger, unicorn, trinidad/jruby).

# To run individual tests: (for example)

bundle exec ruby -Itest test/functional/lists_controller_test.rb

# To run specific tests: (for example)

bundle exec ruby -Itest test/functional/lists_controller_test.rb --name test_should_create_list

# Delayed Job branch

This branch includes delayed_job - the Rails gem and the EY Cloud recipes. It automatically installs all required EY Cloud changes during deploy. See `deploy/before_migrate.rb` and `deploy/cookbooks/delayed_job/recipes/`