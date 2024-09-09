defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  def get_input(current_list) do
    input = IO.gets("> ")

    # IO.inspect([manage_commands(input) | current_list])

    [cmd, key | value] = String.split(input, " ", parts: 3, trim: true)

    # IO.inspect([manage_commands(cmd, key, value) | current_list])

    IO.inspect(current_list)

    get_input([manage_commands(cmd, key, value) | current_list])
    get_input(manage_commands(cmd, key))
  end

  def set(key, value) do
    # IO.puts("O set() rodou!")
    data = %{}
    Map.put(data, key, value)
  end

  def begin(_key) do
    # Enum.find(data, fn map -> map[key] == key end)
    IO.puts("Rodou o begin!")

    # date = [%{"testa" => "1"}, %{"teste" => "2"}, %{"testi" => "3"}]
    # gotten = Enum.find(date, fn map -> map end)
    # IO.inspect(gotten)
  end

  def manage_commands(_cmd, _key) do
    IO.puts("Recebi dois parâmetros!")
  end

  def manage_commands(cmd, key, value) do
    # [cmd, key, value] = String.split(command, " ", parts: 3, trim: true)

    case cmd do
      "SET" ->
        set(key, value)

      "BEGIN" ->
        begin(key)

      _ ->
        raise RuntimeError, "Oh, no!"
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
