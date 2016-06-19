defmodule SlackBridge.Router do
  use SlackBridge.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SlackBridge do
    pipe_through :api
  end
end
