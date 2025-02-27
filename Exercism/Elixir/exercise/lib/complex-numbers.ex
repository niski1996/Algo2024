defmodule ComplexNumbers do
  @typedoc """
  In this module, complex numbers are represented as a tuple-pair containing the real and
  imaginary parts.
  For example, the real number `1` is `{1, 0}`, the imaginary number `i` is `{0, 1}` and
  the complex number `4+3i` is `{4, 3}'.
  """
  @type complex :: {number, number}

  @doc """
  Return the real part of a complex number
  """
  @spec real(a :: complex) :: number
  def real({real, imag}) do
    real
  end

  @doc """
  Return the imaginary part of a complex number
  """
  @spec imaginary(a :: complex) :: number
  def imaginary({real, imag}) do
    imag
  end

  @doc """
  Multiply two complex numbers, or a real and a complex number
  """
  @spec mul(a :: complex | number, b :: complex | number) :: complex
  def mul({realA, imagA}, {realB, imagB}) do
    {realA*realB-imagA*imagB, imagA*realB+realA*imagB}
  end
  def mul(a,{b,c}), do: mul({a,0}, {b,c})
  def mul({a,b},c), do: mul({a,b}, {c,0})
  def mul(a,b), do: mul({a,0}, {b,0})

  @doc """
  Add two complex numbers, or a real and a complex number
  """
  @spec add(a :: complex | number, b :: complex | number) :: complex
  def add({realA, imagA}, {realB, imagB}) do
    {realA+realB, imagA+imagB}
  end
  def add(a,{b,c}), do: add({a,0}, {b,c})
  def add({a,b},c), do: add({a,b}, {c,0})
  def add(a,b), do: add({a,0}, {b,0})

  @doc """
  Subtract two complex numbers, or a real and a complex number
  """
  @spec sub(a :: complex | number, b :: complex | number) :: complex
  def sub({realA, imagA}, {realB, imagB}) do
    {realA-realB, imagA-imagB}
  end
  def sub(a,{b,c}), do: sub({a,0}, {b,c})
  def sub({a,b},c), do: sub({a,b}, {c,0})
  def sub(a,b), do: sub({a,0}, {b,0})
  @doc """
  Divide two complex numbers, or a real and a complex number
  """
  @spec div(a :: complex | number, b :: complex | number) :: complex
  def div({a, b}, {c, d}) do

    {(a * c + b * d) / (:math.pow(c,2) + :math.pow(d,2) ),(b * c - a * d) / (:math.pow(c,2) + :math.pow(d,2) )}
  end
  def div(a,{b,c}), do: __MODULE__.div({a,0}, {b,c})
  def div({a,b},c), do: __MODULE__.div({a,b}, {c,0})

  @doc """
  Absolute value of a complex number
  """
  @spec abs(a :: complex) :: number
  def abs({real, imag}) do
    :math.sqrt(real*real+imag*imag)
  end

  @doc """
  Conjugate of a complex number
  """
  @spec conjugate(a :: complex) :: complex
  def conjugate({real, imag}) do
    {real, -imag}
  end

  @doc """
  Exponential of a complex number
  """
  @spec exp(a :: complex) :: complex
  def exp({real, imag}) do
    {:math.exp(real)*:math.cos(imag),:math.exp(real)*:math.sin(imag)}
  end
end
