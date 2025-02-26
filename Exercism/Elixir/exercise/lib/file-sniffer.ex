defmodule FileSniffer do
  def type_from_extension(extension) do
    case extension do
      "exe" -> "application/octet-stream"
      "bmp" -> "image/bmp"
      "png" -> "image/png"
      "jpg" -> "image/jpg"
      "gif" -> "image/gif"
      _ -> nil
    end
  end

  def type_from_binary(<<head::binary-size(2), tail::binary>>) when head == <<0x42, 0x4D>>, do: type_from_extension("bmp")
  def type_from_binary(<<head::binary-size(4), tail::binary>>) when head == <<0x7F, 0x45, 0x4C, 0x46>>, do: type_from_extension("exe")
  def type_from_binary(<<head::binary-size(8), tail::binary>>) when head == <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>>, do: type_from_extension("png")
  def type_from_binary(<<head::binary-size(3), tail::binary>>) do
    case head do
       <<0xFF, 0xD8, 0xFF>> -> type_from_extension("jpg")
       <<0x47, 0x49, 0x46>> -> type_from_extension("gif")
       true -> nil
    end
  end
  def type_from_binary(binary), do: nil


  def verify(file_binary, extension) do
    # Please implement the verify/2 function
  end
end
