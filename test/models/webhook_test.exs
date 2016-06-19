defmodule SlackBridge.WebhookTest do
  use SlackBridge.ModelCase

  alias SlackBridge.Webhook

  @valid_attrs %{content: %{"a" => 1}, type: "groupme"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Webhook.changeset(%Webhook{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Webhook.changeset(%Webhook{}, @invalid_attrs)
    refute changeset.valid?
  end
end
