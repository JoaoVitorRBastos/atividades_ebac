#language: en

Feature: Tela de cadastro - Checkout
    Como cliente da EBAC-SHOP
    Quero fazer concluir meu cadastro
    Para finalizar minha compra


    Background: Cliente Cadastrado
        Given que sou um cliente cadastrado na EBAC-SHOP

    Scenario: Checkout com sucesso
        When desejo realizar o checkout do produto
        And adicionar os detalhes do faturamento "João", "Bastos", "Brasil", "Rua do Teste", "Salvador", "41000000", "71999999999", "tester@gmail.com"
        Then ao clicar em finalizar compra, a compra deve ser realizada com sucesso e uma mensagem de sucesso deve ser apresentada "Aqui vem a mensagem de sucesso de compra"

    Scenario Outline: Campos obrigatórios
        When desejo realizar o checkout do produto
        And adicionar os detalhes do faturamento <nome>, <sobrenome>, <pais>, <endereco>, <cidade>, <cep>, <telefone>, <email>
        Then ao clicar em finalizar compra, deve ser apresentada uma <mensagem> de erro informando em qual campo o erro se encontra

        Examples:
            | nome   | sobrenome | pais     | endereco       | cidade     | cep        | telefone      | email              | mensagem                                                                 |
            |        | "Bastos"  | "Brasil" | "Rua do Teste" | "Salvador" | "41000000" | "71999999999" | "tester@gmail.com" | "Aqui vem a mensagem de erro solicitando campo nome"                     |
            | "João" |           | "Brasil" | "Rua do Teste" | "Salvador" | "41000000" | "71999999999" | "tester@gmail.com" | "Aqui vem a mensagem de erro solicitando campo sobrenome"                |
            | "João" | "Bastos"  |          | "Rua do Teste" | "Salvador" | "41000000" | "71999999999" | "tester@gmail.com" | "Aqui vem a mensagem de erro solicitando campo país"                     |
            | "João" | "Bastos"  | "Brasil" |                | "Salvador" | "41000000" | "71999999999" | "tester@gmail.com" | "Aqui vem a mensagem de erro solicitando campo endereço"                 |
            | "João" | "Bastos"  | "Brasil" | "Rua do Teste" |            | "41000000" | "71999999999" | "tester@gmail.com" | "Aqui vem a mensagem de erro solicitando campo cidade"                   |
            | "João" | "Bastos"  | "Brasil" | "Rua do Teste" | "Salvador" |            | "71999999999" | "tester@gmail.com" | "Aqui vem a mensagem de erro solicitando campo cep"                      |
            | "João" | "Bastos"  | "Brasil" | "Rua do Teste" | "Salvador" | "41000000" |               | "tester@gmail.com" | "Aqui vem a mensagem de erro solicitando campo telefone"                 |
            | "João" | "Bastos"  | "Brasil" | "Rua do Teste" | "Salvador" | "41000000" | "71999999999" |                    | "Aqui vem a mensagem de erro solicitando campo email"                    |
            | "João" | "Bastos"  | "Brasil" | "Rua do Teste" | "Salvador" | "41000000" | "71999999999" | "tester!abc.com"   | "Aqui vem a mensagem de erro informando que o email inserido é inválido" |

