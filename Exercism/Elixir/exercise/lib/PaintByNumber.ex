defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    pseudo_log(0, color_count)
  end

  @spec pseudo_log(Integer, Integer) :: Integer
  defp pseudo_log(exponent, target) do
    if Integer.pow(2,exponent)>=target do
      exponent
    else
      pseudo_log(exponent+1,target)
    end

  end


  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do

  palette_size = palette_bit_size(color_count)
    <<pixel_color_index :: size(palette_size), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil
  def get_first_pixel(picture, color_count) do
    csize = palette_bit_size(color_count)
    <<number :: size(csize), _rest::bitstring>> = picture
    number
  end


  def drop_first_pixel(<<>>, _), do: <<>>
  def drop_first_pixel(picture, color_count) do
        csize = palette_bit_size(color_count)
    <<_ :: size(csize), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
