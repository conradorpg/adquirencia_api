*** Settings ***
Documentation   http://18.230.42.118:5100/subadquirencia/cadastro/swagger/index.html#/
Resource        ../resource/resourceAPI.robot
Suite Setup     Connect to API


*** Test Cases ***
Listar os headers da API (POST)
    [Tags]    caso01
    Listar acess token
    # Conferir a access token        token

Listar todos os vendedores (GET)
    [Tags]    caso02
    Listar todos os vendedores
    Conferir status code    200
    Conferir reason         OK
    Exibir dados
    # Conferir os dados dos vendedores

Listar vendedor (GET)
    [Tags]    caso03
    Listar um vendedor "30050"
    Conferir status code    200
    Conferir reason         OK
    Exibir dados
    # Conferir os dados do vendedor

Cadastrar novo vendedor (POST)    
    [Tags]    caso04
    Criar em um novo vendedor
    Conferir status code    201
    Conferir reason         Created
    Exibir dados
    # Conferir os dados do vendedor

Desativar vendedor (POST)
    [Tags]    caso05
    Desativar vendedor id: "30051"
    Conferir status code    200
    Conferir reason         OK
    Exibir dados
    

Listar EC PF (GET)
    [Tags]    caso06
    Listar um EC id: "20072"
    Conferir status code    200
    Conferir reason         OK
    Exibir dados

Cadastrar EC PF (POST)
    [Tags]    caso07
    Cadastrar um novo EC PF
    Conferir status code    201
    Conferir reason         Created
    Exibir dados

Listar EC PJ (GET)
    [Tags]    caso08
    Listar um EC id: "8"
    Conferir status code    200
    Conferir reason         OK
    Exibir dados

Cadastrar EC PJ (POST)
    [Tags]    caso09
    Cadastrar um novo EC PJ
    Conferir status code    201
    Conferir reason         Created
    Exibir dados