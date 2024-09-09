defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  def get_input(current_list) do
    input = IO.gets("> ")

    # updated_list = [manage_commands(input) | current_list]
    # [manage_commands(input) | current_list]

    # IO.puts("append:")
    # IO.inspect(updated_list)

    IO.inspect([manage_commands(input) | current_list])

    get_input([manage_commands(input) | current_list])
    # get_input(updated_list)
  end

  def set(data, key, value) do
    Map.put(data, key, value)
  end

  def begin(_data, _key) do
    # Enum.find(data, fn map -> map[key] == key end)
    IO.puts("Rodou o begin!")

    # date = [%{"testa" => "1"}, %{"teste" => "2"}, %{"testi" => "3"}]
    # gotten = Enum.find(date, fn map -> map end)
    # IO.inspect(gotten)
  end

  def manage_commands(command) do
    [cmd, key, value] = String.split(command, " ", parts: 3, trim: true)

    data = %{}

    case cmd do
      "SET" -> set(data, key, value)
      "BEGIN" -> begin(data, key)
      _ -> IO.puts("Unknown command: #{cmd}")
    end
  end

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """
  def main(_args) do
    data_list = []
    get_input(data_list)
  end
end
