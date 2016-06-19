ExUnit.start

Mix.Task.run "ecto.create", ~w(-r SlackBridge.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r SlackBridge.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(SlackBridge.Repo)

