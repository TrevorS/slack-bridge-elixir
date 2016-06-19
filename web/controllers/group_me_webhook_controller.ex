alias SlackBridge.Webhook
alias SlackBridge.Integrations.Slack

defmodule SlackBridge.GroupMeWebhookController do
  use SlackBridge.Web, :controller

  def create(conn, %{"text" => text} = params) do
    changeset = Webhook.changeset(%Webhook{}, %{content: params, type: "groupme"})

    case Repo.insert(changeset) do
      {:ok, _} ->
        Slack.send(text)
        conn |> put_status(:created) |> json("")
      {:error, _} ->
        conn |> put_status(:unprocessable_entity) |> json("")
    end
  end
end
