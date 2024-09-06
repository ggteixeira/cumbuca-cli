defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """
  def main() do
    get_input()
    IO.puts(get_input())
  end

  def get_input do
    input = IO.gets("> ")
    IO.puts(input)
    get_input()
  end
end
