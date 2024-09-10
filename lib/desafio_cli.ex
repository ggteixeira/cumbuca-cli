defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  def get_input(data) do
    # TODO: Adicionar o lambda no lugar do ">" : λ
    commands = IO.gets("> ") |> String.upcase() |> String.trim()

    get_input(manage_commands(commands, data))
  end

  def set(commands, data) do
    [_cmd, key, value] = String.split(commands, " ", parts: 3, trim: true)

    IO.inspect([%{key => value} | data])
    [%{key => value} | data]
  end

  def get(commands, data) do
    [_cmd | key] = String.split(commands, " ", parts: 2, trim: true)

    filtered_list =
      Enum.filter(data, fn item -> Map.get(item, to_string(key)) end)

    [extracted_map] = filtered_list

    IO.inspect(Map.get(extracted_map, to_string(key)))
    Map.get(extracted_map, to_string(key))
  end

  def begin() do
    IO.puts("Rodou o begin()")
  end

  def rollback() do
    IO.puts([])
    []
  end

  def manage_commands(commands_array, data) do
    [cmd | _opts] = String.split(commands_array, " ", parts: 3, trim: true)

    case cmd do
      "SET" ->
        set(commands_array, data)

      "GET" ->
        get(commands_array, data)

      "BEGIN" ->
        IO.puts("Begin")

      "ROLLBACK" ->
        rollback()

      _ ->
        raise RuntimeError, "Command #{cmd} not available! Please, try again."
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
