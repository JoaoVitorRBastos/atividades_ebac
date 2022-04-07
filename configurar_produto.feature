#language: en

Feature: Configurar produto
    Como cliente da EBAC-SHOP
    Quero configurar meu produto de acordo com meu tamanho, cor e quantidade
    Para depois inserir no carrinho

    Background: Cliente Cadastrado
        Given que sou um cliente cadastrado na EBAC-SHOP

    Scenario: Configuração válida
        When desejar configurar meu produto de acordo com meu tamanho "XS"
        And cor "Blue"
        And escolher a quantidade do produto "10"
        Then o produto deve ser adicionado no carrinho com a quantidade correta

    Scenario: Adicionar sem selecionar cor
        When adicionar um produto no carrinho
        And não selecionar a cor
        Then uma mensagem deve ser apresentada informando que o campo cor não foi informado "Aqui deve vir as respectivas mensagens para cada campo"

    Scenario: Adicionar sem selecionar tamanho
        When adicionar um produto no carrinho
        And não selecionar o tamanho
        Then uma mensagem deve ser apresentada informando que o campo tamanho não foi informado "Aqui deve vir as respectivas mensagens para cada campo"

    Scenario: Permitir no máximo 10 produtos por venda
        When adicionar a quantidade de produtos no carrinho "10"
        Then os produtos devem ser adicionados com sucesso no carrinho

    Scenario: Adicionar mais que 10 produtos no carrinho
        When adicionar a quantidade de produtos no carrinho "11"
        Then uma mensagem deve ser apresentada informando que o máximo de produtos permitidos é 10 "Aqui deve vir as respectivas mensagens para cada campo"

    Scenario: Ao clicar no botão “limpar” o carrinho deve voltar ao estado original
        When tiver produtos incluídos no carrinho
        And clicar no botão limpar
        Then o carrinho deve ser limpo, ficando assim sem nenhum item adicionado