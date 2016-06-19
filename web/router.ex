defmodule SlackBridge.Router do
  use SlackBridge.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug SlackBridge.Plugs.FilterBots
  end

  scope "/webhooks", SlackBridge do
    pipe_through :api
    resources "groupme", GroupMeWebhookController, only: [:create]
    resources "slack", SlackWebhookController, only: [:create]
  end
end
