# FoodTrucks

## Why tho?

Discover new food!

Run the project to see which non-expired licensed food trucks exist near you! Simple click "Show Trucks", select a truck, and view on the map it's location!

# Docs

Run the following command to view docs for the project in your browser:

```
open doc/index.html
```

# Setup

## Docker

Install Docker and Docker Compose. Once those tools are installed, run the following to: 

1. Build the container
2. Set up and seed the db
3. Run the containers

```
docker compose build
docker compose run web mix ecto.create
docker compose up
```

You can check to ensure the database and the server are running:

```
docker ps
```

Once the servers are running, you can go to your browser and navigate to `http://localhost:4000`.

Once there, you will be presented with a button that says "Run migrations for repo". Click on that button.

Once the migrations are complete, you should be good to go.

## Local

Project was initialized using the following:

* postgres (PostgreSQL) 14.6 (Homebrew)
* elixir 1.14.3-otp-25
* Phoenix 1.7.0-rc.2

### ASDF

Install asdf manage the installed binaries and versioning:

```
brew install asdf
```

The `.tool-versions` file should contain any info on versions uses to compile + run the application.

[Add asdf to path](https://asdf-vm.com/guide/getting-started.html#_3-install-asdf)

I use ZSH so added this line to my `.zshrc` file:

```
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
```

### Elixir

Install Elixir:

```
asdf plugin add elixir && asdf plugin install elixir latest
```

Node is a requirement for this project to run. If you don't have nodejs installed you can install it via asdf:

```
asdf plugin add nodejs && asdf plugin install nodejs latest
```

### Phoenix 1.7

At the time of initialization, Phoenix 1.7 is a release candidate:

```
mix archive.install hex phx_new 1.7.0-rc.2
```

### PostgreSQL 14

To ensure Homebrew does not accidentally force an upgrade, you can pin the version installed in the environment.
Leave out if you don't care.

```
brew install postgresql@14
brew pin postgresql@14
```

Create user for db management:

```
CREATE ROLE estee WITH LOGIN PASSWORD 'LAUD3R' CREATEDB CREATEROLE;
```

Verify user was created:

```
echo "\du" | psql postgres
```

If you want to alias easy access to the local db:

```
psql postgresql://estee:LAUDER@localhost/food_truck_finder_dev
```

### Install dependencies

For this step, user creation

```
mix deps.get
mix ecto.create
```

If successful, you should see something similar to:

```
The database for FoodTruckFinder.Repo has been created
```

The final step for local database setup is to run in the migrations.

See migrations with the following command:

```
mix ecto.migrations
```

Rum migrations with the following command:

```
mix ecto.migrate
```

# Phoenix Stuff

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
