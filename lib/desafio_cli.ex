defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  def get_input do
    # IO.gets("> ") |> manage_commands()
    IO.gets("> ") |> manage_commands()

    get_input()
  end

  def set(data, key, value) do
    new_data = Map.put(data, key, value)
    IO.puts("\nI'm data function")
    IO.inspect(new_data)
    new_data
  end

  def manage_commands(command) do
    [_cmd, key, value] = String.split(command, " ", parts: 3, trim: true)

    data = %{}

    set(data, key, value)

    # new_data = Map.put(data, :coisa, "coisada")
    # IO.inspect(new_data)
    #
    # newer_data = Map.put(new_data, :outra_coisa, "outra coisa coisilson")
    #
    # IO.inspect(newer_data)
  end

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """

  def main(_args) do
    get_input()
  end
end
