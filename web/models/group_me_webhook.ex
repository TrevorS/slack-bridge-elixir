defmodule SlackBridge.GroupMeWebhook do
  use SlackBridge.Web, :model

  schema "group_me_webhooks" do
    field :attachments, {:array, :string}
    field :avatar_url, :string
    field :message_created_at, Ecto.DateTime
    field :group_id, :string
    field :message_id, :string
    field :name, :string
    field :sender_id, :string
    field :sender_type, :string
    field :source_guid, :string
    field :system, :boolean, default: false
    field :text, :string
    field :user_id, :string

    timestamps
  end

  @required_fields ~w(attachments avatar_url message_created_at group_id message_id name sender_id sender_type source_guid system text user_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
