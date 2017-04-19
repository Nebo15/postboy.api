#!/bin/sh
# `pwd` should be /opt/postboy_api
APP_NAME="postboy_api"

if [ "${DB_MIGRATE}" == "true" ]; then
  echo "[WARNING] Migrating database!"
  ./bin/$APP_NAME command "Elixir.Postboy.ReleaseTasks" migrate!
fi;
