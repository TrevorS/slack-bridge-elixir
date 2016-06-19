defmodule SlackBridge.Router do
  use SlackBridge.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/webhooks", SlackBridge do
    pipe_through :api
    resources "groupme", GroupMeWebhookController, only: [:create]
  end
end
