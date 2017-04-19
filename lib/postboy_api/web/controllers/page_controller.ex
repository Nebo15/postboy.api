defmodule Postboy.Web.PageController do
  @moduledoc """
  Sample controller for generated application.
  """
  use Postboy.Web, :controller

  action_fallback Postboy.Web.FallbackController

  def index(conn, _params) do
    render conn, "page.json"
  end
end
