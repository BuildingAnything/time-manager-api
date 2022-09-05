defmodule TaskManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TaskManager.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: TaskManager.PubSub}
      # Start a worker by calling: TaskManager.Worker.start_link(arg)
      # {TaskManager.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: TaskManager.Supervisor)
  end
end
