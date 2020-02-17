[![Build Status](https://travis-ci.org/engineyard/todo.png?branch=update_rails)](https://travis-ci.org/engineyard/todo)
[![Code Climate](https://codeclimate.com/github/engineyard/todo.png)](https://codeclimate.com/github/engineyard/todo)


# Todo for everyone

Simple GTD app for task tracking.

Supports all Rubies and many stacks (passenger, unicorn, trinidad/jruby).

# To run individual tests: (for example)

bundle exec ruby -Itest test/functional/lists_controller_test.rb

# To run specific tests: (for example)

bundle exec ruby -Itest test/functional/lists_controller_test.rb --name test_should_create_list
