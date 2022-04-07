            #language: en

            Feature: Tela de login
            Como cliente da EBAC-SHOP
            Quero fazer o login (autenticação) na plataforma
            Para visualizar meus pedidos


            Background:
            Given que eu acesse a página de autenticação do EBAC-SHOP

            Scenario: Autenticação válida
            When eu digitar o usuário "joao@ebac.com"
            And a senha "123@abc"
            Then deve exibir uma mensagem de boas vindas "Olá, João"

            Scenario: Usuário inexistente
            When eu digitar o usuário "inexistente@ebac.com"
            And a senha "123@abc"
            Then deve exibir uma mensagem de erro "Usuário inexistente"

            Scenario: Usuário com senha inválida
            When eu digitar o usuário "joao@ebac.com"
            And a senha "inexistente@abc.com"
            Then deve exibir uma mensagem de erro "Usuário ou senha inválidos"

            Scenario Outline: Autenticar multiplos usuários
            When eu digitar o <usuario>
            And a <senha>
            Then deve exibir a <mensagem> de sucesso

            Exemples:
            | usuario             | senha     | mensagem                                               |
            | "joao@ebac.com.br"  | "abc@123" | "Aqui vem a mensagem de sucesso com o nome do usuário" |
            | "maria@ebac.com.br" | "abc@123" | "Aqui vem a mensagem de sucesso com o nome do usuário" |
            | "jose@ebac.com.br"  | "abc@123" | "Aqui vem a mensagem de sucesso com o nome do usuário" |