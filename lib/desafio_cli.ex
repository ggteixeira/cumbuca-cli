defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  def get_input(data) do
    commands = IO.gets("λ ") |> String.upcase() |> String.trim()

    get_input(manage_commands(commands, data))
  end

  def set(commands, data) do
    [_cmd, key, value] = String.split(commands, " ", parts: 3, trim: true)

    duplicated_transaction_count =
      Enum.filter(data, fn map -> Map.get(map, key) end)
      |> length()

    is_already_added = if duplicated_transaction_count > 0, do: "TRUE", else: "FALSE"

    # NOTE: Uncomment the line below to display transactions statuses in real time
    # IO.inspect(Enum.uniq([%{key => value} | data]))

    IO.puts("#{is_already_added} #{value}")
    Enum.uniq([%{key => value} | data])
  end

  def get(commands, data) do
    [_cmd | key] = String.split(commands, " ", parts: 2, trim: true)

    filtered_list =
      Enum.filter(data, fn item -> Map.get(item, to_string(key)) end)

    [extracted_map] = filtered_list

    IO.puts(Map.get(extracted_map, to_string(key)))
    data
  end

  def begin() do
    IO.puts("Rodou o begin()")
  end

  def rollback() do
    IO.puts([])
    []
  end

  def commit() do
    IO.puts("Rodou o commit()")
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
    data = []
    get_input(data)
  end
end
