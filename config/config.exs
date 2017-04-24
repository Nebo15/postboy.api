# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure for your application as:
#
#     config :postboy_api, key: :value
#
# And access this configuration in your application as:
#
#     Application.get_env(:postboy_api, :key)
#
# Or configure a 3rd-party app:
#
#     config :logger, level: :info
#
# Or read environment variables in runtime (!) as:
#
#     :var_name, "${ENV_VAR_NAME}"
config :postboy_api,
  ecto_repos: [Postboy.Repo]

# Configure your database
config :postboy_api, Postboy.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: {:system, "DB_NAME", "postboy_api_dev"},
  username: {:system, "DB_USER", "postgres"},
  password: {:system, "DB_PASSWORD", "postgres"},
  hostname: {:system, "DB_HOST", "localhost"},
  port: {:system, :integer, "DB_PORT", 5432}
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration

config :postboy_api,
  namespace: Postboy

# Configures the endpoint
config :postboy_api, Postboy.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "c0OM25sl/IDrGMN7hUMA+uLTK7JydOWB2e1DS0d6qTx0NSZxhDnWPohD52FfQeSq",
  render_errors: [view: EView.Views.PhoenixError, accepts: ~w(json)]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure JSON Logger back-end
config :logger_json, :backend,
  on_init: {Postboy, :load_from_system_env, []},
  json_encoder: Poison,
  metadata: :all

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
import_config "#{Mix.env}.exs"
