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

  def manage_commands(command) do
    [cmd, key, value] = String.split(command, " ", parts: 3, trim: true)
  end
end
