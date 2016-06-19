defmodule SlackBridge.Repo.Migrations.CreateGroupMeWebhook do
  use Ecto.Migration

  def change do
    create table(:group_me_webhooks) do
      add :attachments, {:array, :string}
      add :avatar_url, :string
      add :message_created_at, :datetime
      add :group_id, :string
      add :message_id, :string
      add :name, :string
      add :sender_id, :string
      add :sender_type, :string
      add :source_guid, :string
      add :system, :boolean, default: false
      add :text, :string
      add :user_id, :string

      timestamps
    end

  end
end
