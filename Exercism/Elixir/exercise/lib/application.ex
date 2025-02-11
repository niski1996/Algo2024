defmodule Exercise.Application do
  use Application

  alias SecretHandshake

  def start(_type, _args) do
    IO.puts("Application started")

    tmpVal = SecretHandshake.commands(1)

    IO.puts("dupa")

    children = [
      # Define workers and child supervisors to be supervised
      # worker(Exercise.Worker, [arg1, arg2, arg3])
    ]

    opts = [strategy: :one_for_one, name: Exercise.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
