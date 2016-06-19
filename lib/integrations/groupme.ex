alias SlackBridge.Integrations.Utilities

defmodule SlackBridge.Integrations.GroupMe do
  @group_me_url Application.get_env(:slack_bridge, :group_me_url)
  @group_me_id  Application.get_env(:slack_bridge, :group_me_id)

  def send(message) do
    HTTPotion.post(@group_me_url, [headers: Utilities.headers, body: body(message)])
  end

  defp body(message) do
    %{bot_id: @group_me_id, text: message} |> Poison.encode!
  end
end
