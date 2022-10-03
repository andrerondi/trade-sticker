*** Settings ***
Documentation    Login tests

Resource    ../resources/main.resource

Test Setup       Start Test
Test Teardown    Finish Test

*** Test Cases ***
Deve logar com sucesso
    Go To Login Page
    Submit Credentials    papito@gmail.com    vaibrasil
    User Logged In

Não deve logar com senha incorreta  
    Go To Login Page
    Submit Credentials         papito@gmail.com    abc123
    Toast Message Should Be    Credenciais inválidas, tente novamente!

Não deve logar com a senha não preenchida 
    Go To Login Page
    Submit Credentials Without Password         papito@gmail.com        
    Toast Message Should Be    Por favor, informe a sua senha secreta!

Não deve logar com o email não preenchido 
    Go To Login Page
    Submit Credentials Without Email         vaibrasil        
    Toast Message Should Be    Por favor, informe o seu email!

Não deve logar com o email e senha não preenchidos 
    Go To Login Page
    Submit Without Credentials                 
    Toast Message Should Be    Por favor, informe suas credenciais!
