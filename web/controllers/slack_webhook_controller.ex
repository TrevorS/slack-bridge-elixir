alias SlackBridge.Webhook
alias SlackBridge.Integrations.GroupMe

defmodule SlackBridge.SlackWebhookController do
  use SlackBridge.Web, :controller


  def create(conn, %{"text" => text} = params) do
    changeset = Webhook.changeset(%Webhook{}, %{content: params, type: "slack"})

    case Repo.insert(changeset) do
      {:ok, _} ->
        GroupMe.send(text)
        conn |> put_status(:created) |> json("")
      {:error, _} ->
        conn |> put_status(:unprocessable_entity) |> json("")
    end
  end
end
