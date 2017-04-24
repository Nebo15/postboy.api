use Mix.Releases.Config,
  default_release: :default,
  default_environment: :default

cookie = :sha256
|> :crypto.hash(System.get_env("ERLANG_COOKIE") || "WshVkSRz8G6aiBxmaI4ytwcgk6J0QFRPAMcUA5X2hLdRRAAxLUtPFei2h/cBpHVL")
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
