defmodule SlackBridge.GroupMeWebhookTest do
  use SlackBridge.ModelCase

  alias SlackBridge.GroupMeWebhook

  @valid_attrs %{attachments: ["some content"], avatar_url: "some content", group_id: "some content", message_created_at: "2010-04-17 14:00:00", message_id: "some content", name: "some content", sender_id: "some content", sender_type: "some content", source_guid: "some content", system: true, text: "some content", user_id: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = GroupMeWebhook.changeset(%GroupMeWebhook{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = GroupMeWebhook.changeset(%GroupMeWebhook{}, @invalid_attrs)
    refute changeset.valid?
  end
end
