defmodule Postboy.Web.Controllers.PageAcceptanceTest do
  use EView.AcceptanceCase,
    async: true,
    otp_app: :postboy_api,
    endpoint: Postboy.Web.Endpoint,
    repo: Postboy.Repo,
    headers: [{"content-type", "application/json"}]

  test "GET /page" do
    %{body: body} = get!("page")

    # This assertion checks our API struct that is described in Nebo #15 API Manifest.
    assert %{
      "meta" => %{
        "url" => _,
        "type" => "object",
        "request_id" => _,
        "code" => 200
      },
      "data" => %{
        "page" => %{
          "detail" => "This is page."
        },
        "type" => "page"
      }
    } = body
  end
end
