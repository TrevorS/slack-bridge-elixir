defmodule SlackBridge.GroupMeWebhookControllerTest do
  use SlackBridge.ConnCase

  alias SlackBridge.GroupMeWebhook

  @valid_attrs %{attachments: ["some content"], avatar_url: "some content", group_id: "some content", message_created_at: "2010-04-17 14:00:00", message_id: "some content", name: "some content", sender_id: "some content", sender_type: "some content", source_guid: "some content", system: true, text: "some content", user_id: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, group_me_webhook_path(conn, :create), group_me_webhook: @valid_attrs
    assert json_response(conn, 201) == ""
    assert Repo.get_by(GroupMeWebhook, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, group_me_webhook_path(conn, :create), group_me_webhook: @invalid_attrs
    assert json_response(conn, 422) == ""
  end
end
