defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
       ?A ->1
       ?C -> 2
       ?G -> 4
       ?T -> 8
       32 -> 0
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      1 ->?A
      2 -> ?C
      4 -> ?G
      8-> ?T
      0 -> 32
    end
  end

  def encode(dna), do: do_encode(dna, <<>>)
  defp do_encode([],dna), do: dna
  defp do_encode([head | tail], dna), do: do_encode(tail, <<dna ::bitstring, encode_nucleotide(head) :: size(4)>>)

  def decode(dna), do: do_decode(dna, [])
  defp do_decode(<<>>, dna), do: dna
  defp do_decode(<<head::size(4), rest::bitstring>>, decoded_dna), do: do_decode(rest, decoded_dna ++ [decode_nucleotide(head)])

end
