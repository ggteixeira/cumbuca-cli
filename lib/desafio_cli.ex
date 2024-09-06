defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """
  def main(_args) do
    get_input()
  end

  def get_input do
    input = IO.gets("> ")
    manage_commands(input)

    get_input()
  end

  def manage_commands(command) do
    command_array = String.split(command)

    [first, second, third] = command_array

    IO.puts("first: #{first}")
    IO.puts("second: #{second}")
    IO.puts("third: #{third}")
  end
end
