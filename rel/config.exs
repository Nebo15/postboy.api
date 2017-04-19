use Mix.Releases.Config,
  default_release: :default,
  default_environment: :default

cookie = :sha256
|> :crypto.hash(System.get_env("ERLANG_COOKIE") || "brXPQUZasg/TSw3tKsZtHV13tk9PWDqVt1RCTfyYP8REyPGS/LUOEPRx/qNd8KY+")
|> Base.encode64

environment :default do
  set pre_start_hook: "bin/hooks/pre-start.sh"
  set dev_mode: false
  set include_erts: false
  set include_src: false
  set cookie: cookie
end

release :postboy_api do
  set version: current_version(:postboy_api)
  set applications: [
    postboy_api: :permanent
  ]
end
