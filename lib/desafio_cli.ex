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
    IO.gets("> ") |> manage_commands()

    get_input()
  end

  def set(key, value, data) do
    Map.put(data, key, value)
  end

  def manage_commands(command) do
    [_cmd, key, value] = String.split(command, " ", parts: 3, trim: true)

    data = Map.new()
    # data = %{"one" => :one, "two" => :two}
    new_data = set(key, value, data)
    IO.inspect(new_data)
  end
end
