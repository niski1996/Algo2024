defmodule LogParser do
  def valid_line?(line) do
    String.match?(line, ~r/^(\[DEBUG\]|\[INFO\]|\[WARNING\]|\[ERROR\])/)
  end

  def split_line(line) do
    Regex.run(~r/(\[DEBUG\]|\[INFO\]|\[WARNING\]|\[ERROR\]).*?(?=(<[~\*=]*>|$))/, line)
  end

  def remove_artifacts(line) do
    Regex.scan(~r/(\[DEBUG\]|\[INFO\]|\[WARNING\]|\[ERROR\]).*?(?=(<[~*=-]*>|\z))/, line)
    |> Enum.map(&hd/1)
  end

  def tag_with_user_name(line) do
    # Please implement the tag_with_user_name/1 function
  end
end
