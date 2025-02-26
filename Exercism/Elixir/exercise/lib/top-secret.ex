defmodule TopSecret do
  def to_ast(string) do
    case Code.string_to_quoted(string) do
      {:ok, ast} -> ast
      {:error, reason} -> {:error, reason}
    end
  end

  def decode_secret_message_part({op, _, [{name, _, args} | _]} = ast, acc) when op in [:def, :defp] do
    function_name =
      case args do
        nil -> Atom.to_string(name)
        _ -> "#{Atom.to_string(name)}#{length(args)}"
      end

    {ast, [function_name | acc]}
  end

  def decode_secret_message_part(ast, acc), do: {ast, acc}

  def decode_secret_message(string) do
    # Please implement the decode_secret_message/1 function
  end
end
