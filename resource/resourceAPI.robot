*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem

*** Variable ***
${URL_API}    http://18.230.42.118:5100/api

# --------------------- VARIAVEIS API ----------- #

${JSON_PATH}      json/

# &{VENDEDOR}       login=Mm  nome=Maisa Malta  cpf=15975365478  telefone=32165498645  email=conrado+00046@b2ml.com.br  metaMensal=5  localidade=${LOCALIDADE}  status=1  id=5


*** Keywords ***
# ---------------------- SETUP | TEARDOWN ---------------------- #

Connect to API
    Create Session    Adquirencia_API    ${URL_API} 


# ------------- VERIFICAR O ACCESS TOKEN - Caso 01 ---------------- #

Listar access token
    ${HEADERS}                     Create Dictionary                Content-Type=application/json
    ${BODY}                        Create Dictionary                Email=luiz.guilherme@b2ml.com.br    Senha=123456
    ${REQUEST}                     Post Request                     Adquirencia_API    Usuario/Login    data=${BODY_TOKEN}    headers=${HEADERS_TOKEN}
    Set Test Variable              ${REQUEST}  
    
Conferir a access token
    # [Arguments]                    ${ACCESS_TOKEN}  
    # Dictionary Should Contain Item                 ${POST_TOKEN.text}               ${ACCESS_TOKEN}

# ------------------ Status Code | Reason ----------------------- #

Conferir status code
    [Arguments]                   ${STATUS_CODE}
    Should Be Equal As Strings    ${REQUEST.status_code}    ${STATUS_CODE}

Conferir reason
    [Arguments]                   ${REASON_MESSAGE}    
    Should Be Equal As Strings    ${REQUEST.reason}         ${REASON_MESSAGE}

# ------------------ Exibir Dados ---------------------------------- #

Exibir dados
    Log                           ${REQUEST.text}

# --------------- LISTAR VENDEDORES - Caso 02 ------------------ #

Listar todos os vendedores
    ${REQUEST}                    Get Request                Adquirencia_API          Vendedor
    Set Test Variable             ${REQUEST}

# --------------- LISTAR VENDEDOR - Caso 03 ------------------ #

Listar um vendedor "${ID_VENDEDOR}"
    ${REQUEST}                    Get Request                 Adquirencia_API         Vendedor/${ID_VENDEDOR}
    Set Test Variable             ${REQUEST}

    # ${LOGIN_NAME}                 Get Substring                       ${GET_VENDEDOR.text}    0

# Conferir os dados do vendedor
#     Dictionary Should Contain Item
#     Should Not Be Empty

# ------------- CADASTRAR NOVO VENDEDOR - Caso 04 -------------------- #

Cadastrar um novo vendedor
    ${HEADERS}                    Create Dictionary                 Content-Type=application/json; charset=utf-8    AccessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Ikx1aXogUm9vdCIsInJvbGUiOiJSb290IEFjY2VzcyIsIm5iZiI6MTU5MzMwODAyMCwiZXhwIjoxNTk1OTAwMDIwLCJpYXQiOjE1OTMzMDgwMjB9.so9NyoilMrVs1cFcshrQY1A5327JrKCXMgEU-Azl9rg
    ${BODY}                       Get Binary File                   ${JSON_PATH}new_vendor.json                 
    ${REQUEST}                    Post Request                      Adquirencia_API    Vendedor    headers=${HEADERS}    data=${BODY}
    Set Test Variable             ${REQUEST}

# ----------------------- DESATIVAR VENDEDOR - Caso 05 ------------------- #

Desativar vendedor id: "${ID_VENDEDOR}"
    ${HEADERS}                    Create Dictionary                 Content-Type=application/json; charset-utf-8    AccessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Ikx1aXogUm9vdCIsInJvbGUiOiJSb290IEFjY2VzcyIsIm5iZiI6MTU5MzMwODAyMCwiZXhwIjoxNTk1OTAwMDIwLCJpYXQiOjE1OTMzMDgwMjB9.so9NyoilMrVs1cFcshrQY1A5327JrKCXMgEU-Azl9rg
    ${BODY}                       Get Binary File                   ${JSON_PATH}deactive_vendor.json
    ${REQUEST}                    Post Request                      Adquirencia_API    Vendedor/Desativar    headers=${HEADERS}    data=${BODY}
    Set Test Variable             ${REQUEST}

# ----------------------- LISTAR EC PF - Caso 06 ---------------------------- #

Listar um EC id: "${ID_EC}"
    ${REQUEST}                    Get Request                      Adquirencia_API    Estabelecimentopf/${ID_EC}
    Set Test Variable             ${REQUEST}   


# ------------- CADASTRAR NOVO EC PF - Caso 07 ---------------- #

Cadastrar um novo EC PF
    ${HEADERS}                    Create Dictionary                  Content-Type=application/json; charset=utf-8  AccessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Ikx1aXogUm9vdCIsInJvbGUiOiJSb290IEFjY2VzcyIsIm5iZiI6MTU5MzMwODAyMCwiZXhwIjoxNTk1OTAwMDIwLCJpYXQiOjE1OTMzMDgwMjB9.so9NyoilMrVs1cFcshrQY1A5327JrKCXMgEU-Azl9rg
    ${BODY}                       Get Binary File                    ${JSON_PATH}new_ecpf.json  
    ${REQUEST}                    Post Request                       Adquirencia_API    Estabelecimentopf    headers=${HEADERS}    data=${BODY}
    Set Test Variable             ${REQUEST}

# ----------------------- LISTAR EC PJ - Caso 08 ---------------------------- #

Listar um EC id: "${ID_EC}"
    ${REQUEST}                    Get Request                      Adquirencia_API    Estabelecimentopj/${ID_EC}
    Set Test Variable             ${REQUEST}   

# ------------- CADASTRAR NOVO EC PJ - Caso 09 ---------------- #

Cadastrar um novo EC PJ
    ${HEADERS}                    Create Dictionary                  Content-Type=application/json; charset=utf-8  AccessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Ikx1aXogUm9vdCIsInJvbGUiOiJSb290IEFjY2VzcyIsIm5iZiI6MTU5MzMwODAyMCwiZXhwIjoxNTk1OTAwMDIwLCJpYXQiOjE1OTMzMDgwMjB9.so9NyoilMrVs1cFcshrQY1A5327JrKCXMgEU-Azl9rg
    ${BODY}                       Get Binary File                    ${JSON_PATH}new_ecpj.json  
    ${REQUEST}                    Post Request                       Adquirencia_API    Estabelecimentopj    headers=${HEADERS}    data=${BODY}
    Set Test Variable             ${REQUEST}


