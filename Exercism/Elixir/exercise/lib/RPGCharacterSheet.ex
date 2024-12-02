defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name(), do: String.trim(IO.gets("What is your character's name?\n"))

  def ask_class(), do: String.trim(IO.gets("What is your character's class?\n"))

  def ask_level(),do: String.to_integer(String.trim(IO.gets("What is your character's level?\n")))

  def run() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
    name = ask_name()
    class = ask_class()
    lvl = ask_level()
    tmp = %{class: class, level: lvl, name: name}
    IO.write("Your character: ")
    IO.inspect(tmp)
    tmp
  end
end
