defmodule SlackBridge.SlackWebhookControllerTest do
  use SlackBridge.ConnCase

  alias SlackBridge.Webhook

  @valid_attrs %{"a" => 1}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, slack_webhook_path(conn, :create), @valid_attrs
    assert json_response(conn, 201) == ""
    assert Repo.one!(Webhook).type == "slack"
  end
end
