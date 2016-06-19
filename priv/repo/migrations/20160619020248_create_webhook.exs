defmodule SlackBridge.Repo.Migrations.CreateWebhook do
  use Ecto.Migration

  def change do
    create table(:webhooks) do
      add :type, :string
      add :content, :map
      timestamps
    end
  end
end
