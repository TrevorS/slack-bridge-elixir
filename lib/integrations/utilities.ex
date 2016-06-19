defmodule SlackBridge.Integrations.Utilities do
  def headers do
    ["User-Agent": user_agent, "Content-Type": content_type]
  end

  defp user_agent do
     "SlackBridge #{app_version}"
   end

  defp content_type do
    "application/json"
  end

  defp app_version do
    :application.get_key(:slack_bridge, :vsn) |> elem(1) |> to_string
  end
end
