FROM rails:onbuild

RUN bundle install
RUN rails generate simple_form:install
RUN rake db:migrate RAILS_ENV=development
