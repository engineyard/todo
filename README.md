[![Build Status](https://travis-ci.org/engineyard/todo.png?branch=update_rails)](https://travis-ci.org/engineyard/todo)
[![Code Climate](https://codeclimate.com/github/engineyard/todo.png)](https://codeclimate.com/github/engineyard/todo)


# Todo for everyone

Simple GTD app for task tracking.

Supports all Rubies and many stacks (passenger, unicorn, trinidad/jruby).

# To run individual tests: (for example)

bundle exec ruby -Itest test/functional/lists_controller_test.rb

# To run specific tests: (for example)

bundle exec ruby -Itest test/functional/lists_controller_test.rb --name test_should_create_list

# Running with Docker

Assuming [docker][1] is already installed in your system, use the following
command to build a docker image on the basis of [rails docker image][2] :

```sh
cd todo-rails-app
docker build -t engineyard/todo-rails-app .
```
Building an image might take a while depending on your Internet connection.

After the image is build you can run it:

```sh
docker run -d --name todo-app -p 3000:3000 -v "$PWD":/usr/src/app engineyard/todo-rails-app
```

This will start a rails server attached to localhost on port 3000. Mapping
"$PWD" to /usr/src/app here allows playing with the application by editing local
files without a need to rebuild the image every time.

[1]: https://www.docker.com/
[2]: https://hub.docker.com/_/rails/
