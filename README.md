# Wally

A toy software status wall application built with [Elixir][], [Phoenix][] and
[React][]. Use it to display you CI build status and latest project activity on
a big screen in the office.

**Quite a work in progress**.

## Installation

This project requires both a working installation of [Elixir][] and [Node.js][]
(with [NPM][] installed). It uses [PostgreSQL][] as its database.

To start your new Phoenix application:

1. Install dependencies with `mix deps.get` and then `npm install`.
2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser.

## Overview

This application renders a list of projects and their status on the client side,
while receiving web hooks from external services on the server side. Using
websockets, the client is updated immediately.

Currently the only implemented web hook is a Heroku depoyment notification.

## Deploy to Heroku

To deploy this application to a new Heroku application, use this button:

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Note that Wally requires Postgres 9.4 with JSONB support. This is only available
in beta at Heroku right now, so after creating your application, you have to add
a Postgres 9.4 database using the CLI:

    $ heroku addons:remove heroku-postgresl:hobby-dev
    $ heroku addons:add heroku-postgresql:hobby-dev --version=9.4

Now you can actually prepare your database and start using the app:

    % heroku run mix ecto.migrate

Of course, you could always change the app to use a `json` isntead of a `jsonb`
column, which is less performant but easier to set up, as it requires only
Postgres 9.3.

[Elixir]: http://elixir-lang.org/
[Phoenix]: http://www.phoenixframework.org/
[React]: https://facebook.github.io/react/
[Node.js]: https://nodejs.org/
[NPM]: https://www.npmjs.com/
[PostgreSQL]: http://www.postgresql.org/
