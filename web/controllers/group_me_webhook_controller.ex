defmodule SlackBridge.GroupMeWebhookController do
  use SlackBridge.Web, :controller

  alias SlackBridge.GroupMeWebhook

  plug :scrub_params, "group_me_webhook" when action in [:create]

  def create(conn, %{"group_me_webhook" => group_me_webhook_params}) do
    changeset = GroupMeWebhook.changeset(%GroupMeWebhook{}, group_me_webhook_params)

    case Repo.insert(changeset) do
      {:ok, group_me_webhook} ->
        conn |> put_status(:created) |> json("")
      {:error, changeset} ->
        conn |> put_status(:unprocessable_entity) |> json("")
    end
  end
end
