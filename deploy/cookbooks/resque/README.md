# Resque recipe for EY Cloud

Resque is a Redis-backed Ruby library for creating background jobs, placing those jobs on multiple queues, and processing them later.

This recipe will setup `resque` on a Solo instance environment or on named Utility instances in a cluster environment. 

Name your Utility instances with prefixes: `resque`. For example, `resque`, or `resque123`. Naming them all `resque` works just fine.

This recipe assumes that redis is running within the environment. Fortunately, it is. By default EY Cloud runs redis on your `solo` or `db_master` instance. Optionally, this recipe will use a custom `redis` utility instance that you might have in your environment. It's clever like that.

## Installation

## Simple Installation

To add this recipe to your collection of recipes, or as your first recipe, you can use the helpful `ey-recipes` command line tool:

    cd myapp
    gem install engineyard engineyard-recipes
    ey-recipes init
    ey-recipes clone git://github.com/engineyard/eycloud-recipe-resque.git -n resque
    ey recipes upload --apply

If you want to have your recipes run during deploy (rather than the separate `ey recipes upload --apply` step):

    ey-recipes init -d
    ey-recipes clone git://github.com/engineyard/eycloud-recipe-resque.git -n resque
    git add .; git commit -m "added delayed job recipe"; git push origin master
    ey deploy

## Manual Installation

Clone/copy this repository into a `cookbooks/resque` folder (such that you have a `cookbooks/resque/recipes/default.rb` file). This recipe must be installed as `resque` and not `eycloud-recipe-resque` or anything fancy.

Then add the following to `cookbooks/main/recipes/default.rb`:

    require_recipe "resque"
    
Make sure this and any customizations to the recipe are committed to your own fork of this 
repository.

Then to upload and apply to EY Cloud for a given environment:

    ey recipes upload --apply -e target-environment
