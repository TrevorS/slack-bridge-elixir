defmodule SlackBridge.SlackWebhookController do
  use SlackBridge.Web, :controller

  alias SlackBridge.Webhook

  def create(conn, params) do
    changeset = Webhook.changeset(%Webhook{}, %{content: params, type: "slack"})

    case Repo.insert(changeset) do
      {:ok, _} ->
        conn |> put_status(:created) |> json("")
      {:error, _} ->
        conn |> put_status(:unprocessable_entity) |> json("")
    end
  end
end
