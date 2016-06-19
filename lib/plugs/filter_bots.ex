defmodule SlackBridge.Plugs.FilterBots do
  import Plug.Conn
  import Phoenix.Controller, only: [json: 2]

  def init(default), do: default

  def call(%Plug.Conn{params: %{"bot_id" => _, "bot_name" => _}} = conn, _) do
    conn |> put_status(:created) |> json("") |> halt
  end

  def call(%Plug.Conn{params: %{"sender_type" => "bot"}} = conn, _) do
    conn |> put_status(:created) |> json("") |> halt
  end

  def call(%Plug.Conn{} = conn, _) do
    conn
  end
end
