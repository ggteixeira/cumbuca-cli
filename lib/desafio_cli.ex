defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """
  def main(args) do
    IO.puts(phrase(args))
  end

  def phrase(args) do
    [key, value] = args
    IO.puts("Chave: #{key}")
    IO.puts("Valor: #{value}")
  end
end
