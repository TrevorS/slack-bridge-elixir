defmodule SlackBridge.GroupMeWebhookControllerTest do
  use SlackBridge.ConnCase

  alias SlackBridge.Webhook

  @valid_attrs %{content: %{"a" => 1}, type: "groupme"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, group_me_webhook_path(conn, :create), @valid_attrs
    assert json_response(conn, 201) == ""
    assert Webhook |> Repo.one!
  end
end
