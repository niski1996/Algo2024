defmodule Exercise.Application do
  use Application

  alias Inspect.Algebra
  alias SecretHandshake
  alias Allergies

  def start(_type, _args) do
    IO.puts("Application started")

    tmpVal = Allergies.list(2)


    IO.puts("dupa")

    children = [
      # Define workers and child supervisors to be supervised
      # worker(Exercise.Worker, [arg1, arg2, arg3])
    ]

    opts = [strategy: :one_for_one, name: Exercise.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
