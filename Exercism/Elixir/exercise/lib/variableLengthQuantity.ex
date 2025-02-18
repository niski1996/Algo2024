defmodule VariableLengthQuantity do
  import Bitwise

  @doc """
  Encode integers into a bitstring of VLQ encoded bytes
  """
  @spec encode([integer]) :: binary
  def encode(integers) do
    integers
    |> Enum.map(&encode_single/1)
    |> Enum.map(&Enum.reverse/1)
    |> List.flatten()
    |> to_bitwise()
  end

  @spec to_bitwise([integer]) :: binary
  defp to_bitwise([]), do: <<>>
  defp to_bitwise([head | tail]) do
    <<head::8, to_bitwise(tail)::bitstring>>
  end

  @spec encode_single(integer) :: [integer]
  defp encode_single(0), do: [0b00000000]
  defp encode_single(number) do
    chunks = split_into_chunks(number)

    [first | rest] = chunks
    [first &&& 0b01111111 | Enum.map(rest, &(&1 ||| 0b10000000))]
  end

  defp split_into_chunks(0), do: []
  defp split_into_chunks(number) do
    tmp_bin = number &&& 0b01111111
    rest = number >>> 7
    [tmp_bin | split_into_chunks(rest)]
  end

  @doc """
  Decode a bitstring of VLQ encoded bytes into a series of integers
  """
@spec decode(binary) :: {:ok, [integer]} | {:error, String.t()}
def decode(bytes) when is_binary(bytes) do


  if byte_size(bytes) > 0 and (binary_part(bytes, byte_size(bytes) - 1, 1) |> :binary.decode_unsigned() &&& 0b10000000) != 0 do
    {:error, "incomplete sequence"}
  else
    decode_bytes(bytes, 0, [])
  end
end

defp decode_bytes(<<>>, _current, acc), do: {:ok, acc}  # Usunięto Enum.reverse(acc)

defp decode_bytes(<<byte::8, rest::bitstring>>, current, acc) do
  value = (current <<< 7) ||| (byte &&& 0b01111111)

  if (byte &&& 0b10000000) == 0 do
    decode_bytes(rest, 0, acc ++ [value])  # Konieczne było użycie acc ++ [value] zamiast [value | acc]
  else
    decode_bytes(rest, value, acc)
  end
end


  defp decode_bytes(<<>>, _current, acc), do: {:ok, Enum.reverse(acc)}

  defp decode_bytes(<<byte::8, rest::bitstring>>, current, acc) do
    value = (current <<< 7) ||| (byte &&& 0b01111111)

    if (byte &&& 0b10000000) == 0 do
      decode_bytes(rest, 0, [value | acc])
    else
      decode_bytes(rest, value, acc)
    end
  end
end
