defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  def get_input(lista) do
    input = IO.gets("> ")
    listb = [manage_commands(input) | lista]
    IO.inspect(listb)
    get_input(listb)
  end

  def set(data, key, value) do
    Map.put(data, key, value)
  end

  def manage_commands(command) do
    [cmd, key, value] = String.split(command, " ", parts: 3, trim: true)

    data = %{}

    case cmd do
      "SET" -> IO.puts("CAFE")
      _ -> IO.puts("Unknown command: #{cmd}")
    end

    set(data, key, value)
  end

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """

  def main(_args) do
    lista = []
    get_input(lista)
  end
end
