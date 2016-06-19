alias SlackBridge.Integrations.Utilities

defmodule SlackBridge.Integrations.Slack do
  @slack_url Application.get_env(:slack_bridge, :slack_url)

  def send(message) do
    HTTPotion.post(@slack_url, [headers: Utilities.headers, body: body(message)])
  end

  defp body(message) do
    %{text: message} |> Poison.encode!
  end
end
