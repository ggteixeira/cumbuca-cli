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
