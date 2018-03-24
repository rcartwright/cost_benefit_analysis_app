# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cost_benefit_analysis_app,
  ecto_repos: [CostBenefitAnalysisApp.Repo]

# Configures the endpoint
config :cost_benefit_analysis_app, CostBenefitAnalysisAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mNkuT/Rf8Ay3yMc6LGM8VceejzR3340w3+KVvpthzBCs2M59wmxv8/s0JRI7Po8B",
  render_errors: [view: CostBenefitAnalysisAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CostBenefitAnalysisApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
