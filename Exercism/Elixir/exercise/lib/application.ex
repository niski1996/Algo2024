defmodule Exercise.Application do
  use Application

  alias AllYourBase

  def start(_type, _args) do
    IO.puts("Application started")

    # tmpVal = Allergies.list(2)
    tmp = AllYourBase.convert([1,1,1,1],6,2)

    # IO.puts(tmp)


    IO.puts("dupa")

    children = [
      # Define workers and child supervisors to be supervised
      # worker(Exercise.Worker, [arg1, arg2, arg3])
    ]

    opts = [strategy: :one_for_one, name: Exercise.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
