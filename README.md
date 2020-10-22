# Git Some Skill

An application used as an example to show how you can make a REST API using Ruby on Rails.
The application allows you create, edit, update and see a list of your favorite
Git repositories. The API accepts requests and responds in [JSON:API](https://jsonapi.org/format/) format.

## Getting started

Before you try to run the application make sure you
* have a Ruby version `2.7.1` installed
* have PostgreSQL driver `pg` installed

To install specific version of Ruby you can use [RVM](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv).
### Creating database role
First, you must create the PostgreSQL role that will be used to create and
manage the application's database.

Within the PostgreSQL interactive terminal, type the following:
```
create role git_some_skill with createdb login password '<your-password>';
```
This statement will create a role `git_some_skill` with abilities to login, create a
database and with the password you provide.

### Setting an environment variable

If you take a look at the file `config/database.yml` there is a section named `default` where the `password`
key has been set to
```
<%= ENV['GIT_SOME_SKILL_DATABASE_PASSWORD'] %>
```

This means that the environment must contain a variable named `GIT_SOME_SKILL_DATABASE_PASSWORD`.

To achieve that we can add this line within the startup file of your shell (`.bashrc`, `.zshrc` or similar file depending on the shell you use):
```
export GIT_SOME_SKILL_DATABASE_PASSWORD=<your-password>
```
### Installing gems

While being in the project directory, execute
```
bundle install
```
to install gems from the `Gemfile`.

### Preparing database

There is one step left before we can run the application server - we must prepare our database.
To do that run the rake tasks with the command
```
rake db:create db:migrate db:seed
```

### Starting application server

To start the application server run
```
rails s
```

By default the application will be accessible on `localhost:3000/`.
