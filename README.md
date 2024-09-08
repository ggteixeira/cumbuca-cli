<!--toc:start-->

- [Template para Desafio CLI](#template-para-desafio-cli)
  - [Pré-requisitos](#pré-requisitos)
- [CLI](#cli)
<!--toc:end-->

# Template para Desafio CLI

Este template tem o objetivo de servir como
ponto de partida para a implementação de desafios
de contratação da Cumbuca que envolvam implementar
uma interface de linha de comando em Elixir.

## Pré-requisitos

Primeiro, será necessário [instalar o Elixir](https://elixir-lang.org/install.html)
em versão igual ou superior a 1.16.
Com o Elixir instalado, você terá a ferramenta de build `mix`.

Para buildar o projeto, use o comando `mix escript.build` nesta pasta.
Isso irá gerar um binário com o mesmo nome do projeto na pasta.
Executando o binário, sua CLI será executada.

# CLI

- Primeiro eu entendi como trabalhar com o CLI do main() e depois entendi que devo implementar meu próprio CLI
- Para isso, utilizei um `IO.gets()` recursivo para captar comandos até que o usuário chame `CTRL+C` para destruir o programa e o loop.
- Em seguida, criei um alias chamado `cumbuca`, no meu shell, para facilitar o build e execução do CLI no terminal: `alias cumbuca='mix escript.build && ./desafio_cli'`
- Depois de um tempo quebrando a cabeça, consegui fazer com pattern matching uma função que aceita os três parâmetros da transação sem precisar replicar o modelo mental dos switches e if/elses.
- I have lost some time trying to understand why `String.split()` wasn't working, until I found out that you should use `IO.inspect()` to print anything but strings. The `IO.puts()` is only for strings. E eu não sei por que estou escrevendo em inglês. Enfim.
- Consegui criar uma função de `set()` (equivalente ao `SET` do desafio) que adiciona maps a uma lista/array simples
