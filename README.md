Projeto criado utilizando Flutter `3.7.7` e o Dart `2.19.4`.
## Informações
Esse projeto usa uma arquitetura própria que foi construída ao longo da minha carreira com base no aprendizado que colhi em cada projeto que trabalhei. Ela foi baseada na Clean Arch e segue os conceitos do SOLID, KISS e Clean Code. Além disso, utilizo alguns padrões de projeto para melhorar o fluxo de dados. Alguns dos packages utilizados foram:
* Getx para o gerenciamento de estado
* Modular para a injeção de dependência e navegação (Navigator 2.0)
* JsonSerializable e BuildRunner para automação da criação dos mappers
* Mocktail para os mocks de tests
* SkeletonText para facilitar a criação das animações de loading
* Equatable para comparações entre classes
* Dio para adapter HTTP
* CachedNetWorkImage para melhor carregamento e cacheamento das imagens

## Configurando o projeto
Para rodar o projeto, primeiramente inicie o servidor (`backend`) e defina o IP e a porta do mesmo na linha 16 do arquivo:
```
lib/commons/data/infra/dio_datasource.dart
```
Adicionei alguns comentários no código sobre alguns pontos que achei importante informar:
* O valor do `discount` do endpoint de `promotions`estaav vindo invertido (a % do valor final em relação ao valor anterior) e fiz um ajuste na entidade `promotion_entity`
* Algumas informações presentes nas telas não eram fornecidas pelo endpoint `promotions`:
    * A quantidade de parcelas e o valor de cada parcela no card da home (preferi deixar sem essa informação)
    * Informação de vendido por e entregue por na tela do carrinho (deixei hard coded com a informação do figma)
    * Informação do prazo de entrega na tela do carrinho. Eu sei q esse seria complicado de fornecer. (deixei hard coded com a informação do figma)
    * Informação do valor da entrega caso o produto n seja frete grátis na tela do carrinho. Eu sei q esse seria complicado de fornecer. (deixei hard coded com o valor de R$ 19,90 caso o produto não seja frete grátis)
    * Informação do estoque do produto na tela do carrinho. (deixei hard coded com a informação do figma)

Disclaimer:
Eu atuei cerca de 12 horas nesse projeto. Deveria ter entrege ele duas semanas antes mas meu filho teve um problema de saúde (pneumonia) e passei muito tempo levando ele em consultas e o tempo q teria livre pra finalizar esse teste acabei empregando no trabalho para compensar essas horas.

Para futuros contato:
linkedin: https://www.linkedin.com/in/victor-costa-1718ab185/
github: https://github.com/victorths