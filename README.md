<!--toc:start-->

- [Instruções](#instruções)
- [CLI](#cli)
  - [Pequeno diário de bordo](#pequeno-diário-de-bordo)
  - [SET](#set)
  - [GET](#get)
  - [BEGIN](#begin)
  - [ROLLBACK](#rollback)
  - [COMMIT](#commit)
  - [OUTRAS COISAS](#outras-coisas)
    - [Testes](#testes)
    - [Ausência de bugs](#ausência-de-bugs)
    - [Legibilidade e Formatação](#legibilidade-e-formatação)
    - [Clareza](#clareza)
    - [Desacoplamento](#desacoplamento)
    - [Pontos adicionais](#pontos-adicionais)
  - [Bibliografia](#bibliografia)
  <!--toc:end-->

## Instruções

Primeiro, será necessário [instalar o Elixir](https://elixir-lang.org/install.html)
em versão igual ou superior a 1.16.
Com o Elixir instalado, você terá a ferramenta de build `mix`.

Para buildar o projeto, use o comando `mix escript.build` nesta pasta.
Isso irá gerar um binário com o mesmo nome do projeto na pasta.
Executando o binário, sua CLI será executada.

# CLI

![](https://github.com/ggteixeira/cumbuca-cli/blob/main/media/cli.gif)

## Pequeno diário de bordo

- A primeira coisa que fiz foi entender como trabalhar com o CLI do main() do template, e depois entendi que devo implementar meu próprio CLI
- Para isso, utilizei um `IO.gets()` recursivo para captar comandos até que o usuário chame `CTRL+C` no terminal para destruir o programa e também o loop.
- Em seguida, criei um alias chamado `cumbuca`, no meu shell, para facilitar o build e execução do CLI no terminal: `alias cumbuca='mix escript.build && ./desafio_cli'`
- Depois de um tempo quebrando a cabeça, consegui fazer com _pattern matching_ uma função que aceita os três parâmetros da transação sem precisar replicar o modelo mental dos switches e if/elses.
- Dediquei algum tempo tentando entender por que um `String.split()` não estava funcionando, até descobrir que devemos usar `IO.inspect()` para qualquer valor que não seja string/binário.
- Consegui criar uma função de `set()` que adiciona maps a uma list/array simples
- Fiz a função que gerencia os comandos entender — usando o conceito de _arity_ — quando recebe dois comandos ("BEGIN teste", por exemplo) e três comandos ("SET teste 1", por exemplo)
- Passei boa parte do tempo tentando garantir que a base do fluxo de informações fosse escalável, para que na parte final do teste eu conseguisse ir adicionando as features necessárias para cada comando possível. Se fui feliz nessa estratégia, imagino que um MVP com a maioria das features vai ficar pronto.
- Depois de gastar bastante tempo entendendo por que um `Enum.filter()` estava funcionando no `iex`, mas não no módulo, implementei de outra forma, aí funcionou.
- Não vai dar tempo de continuar implementando a tentativa de escalar este CLI para abrigar todas as features, então vou tentar explicar como eu faria em cada comando.

## SET

- O `SET` está adicionando em uma list Maps com chaves e valores, representando as transações. Ele também checa se o valor já existe. Falta fazer a checagem por chave para de fato sobrescrever.

## GET

- O `GET` está recuperando o valor a partir de uma chave existente na list, porém ele ainda quebra se a list não possuir transações.

## BEGIN

- Imagino que eu faria a implementação por níveis do `BEGIN` uma lista de Maps de listas de Maps. Algo assim:

```elixir
data = [
  %{
    0 => [
      %{"TESTA" => 1},
      %{"TESTE" => 2},
      %{"TESTI" => 3}
    ],
    1 => [
      %{"Morgoth" => 9000},
      %{"Galadriel" => 8000},
      %{"Fëanor" => 7000}
    ]
  }
]
```

em que cada um desses dois Maps do exemplo possam ser acessados, não por iteração, mas sim por um `Map.get()` mesmo, por chave.

Para, a cada vez que chamarmos o `BEGIN` ele acessar um nível abaixo, podemos tornar a função recursiva, passando a chave de nível para o próprio `begin()` e incrementando esse valor internamente à função, tendo como parada o `length` do Map de níveis.

## ROLLBACK

- Comecei a implementar a parte simples do `ROLLBACK`, que é retornar uma list vazia, aproveitando o poder da imutabilidade do Elixir.
- Assim como o `BEGIN`, esse comando seria capaz de transitar entre níveis, só que decrementando, também usando recursão. Nesse caso a recursão também é feliz, pois não há efeitos colaterais em devolver `[]` sempre que chamado. É uma suposição minha; precisaria ver como a função se comporta ao receber list e nível como argumentos.

---

As transações recursivas — salvo se cometi algum erro muito crasso de saída — foram implementadas na função recursiva `get_input()`. Ela permite que apliquemos comando após comando, preservando a estrutura fundamental de list (`[]`), definida no `main()`.

---

## COMMIT

O `COMMIT` eu admito que não surgiu uma ideia clara de como aplicar as transações um nível acima. Adoraria tentar entender como vocês implementariam essa funcão.

---

## OUTRAS COISAS

### Testes

Infelizmente, não pude escrever os tests necessários.

### Ausência de bugs

Os _corner cases_ dos comandos ficariam para um momento posterior da implementação e requeririam um tempo que decidi dedicar às funcionalidades mais básicas que consegui fazer.

### Legibilidade e Formatação

O Neovim possui um LSP do Elixir, então a formatação foi tranquila.

### Clareza

- Optei por manter o código inteiro em um só Módulo, facilitando a legibilidade de quem vai avaliar, mesmo em detrimento de uma maior sofisticação na estrutura de pastas
- Espero ter deixado o código legível, ainda que um tanto repetitivo. Não deixa de ser uma escolha semântica abandonar o DRY. Foi uma questão de tempo também.

### Desacoplamento

- A maior tentativa foi de tornar o código o mais independente possível — ou pelo menos setar as bases para que isso vá acontecendo conforme novas features vão sendo adicionadas.

### Pontos adicionais

- Não deu tempo de sequer tentar, mas eu tentaria usar o próprio Elixir standard para inserir, editar e buscar informações em um arquivo.

## Bibliografia

- [Elixir Official Standard Library Documentation/Hexdocs](https://elixir-lang.org/docs.html)
- [Elixir School](https://elixirschool.com/en)
- [Elixir Forum](https://elixirforum.com/)
- [Joy of Elixir](https://joyofelixir.com/toc.html)
