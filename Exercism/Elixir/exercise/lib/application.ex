defmodule Exercise.Application do
  use Application

  alias TopSecret

  def start(_type, _args) do
    IO.puts("Application started")

    # Example usage of TopSecret.to_ast/1
    string = "def fit(a, b, c), do: :scale"
    ast = TopSecret.to_ast(string)
    IO.inspect(ast, label: "AST")

    # Example usage of Macro.expand/2
    expanded_ast = Macro.expand(ast, __ENV__)
    IO.inspect(expanded_ast, label: "Expanded AST")

    IO.puts("dupa")

    children = [
      # Define workers and child supervisors to be supervised
      # worker(Exercise.Worker, [arg1, arg2, arg3])
    ]

    opts = [strategy: :one_for_one, name: Exercise.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
