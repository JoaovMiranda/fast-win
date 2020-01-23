# Menu Agil
## Criado a partir do estudo de programação em lotes.

 * Menu em BatchFile para computadores lentos e de baixa qualidade, auxilia na inicialização de comandos primarios;

 O menu se divide em uma estrutura de arvore, isto é: 
    Menu de tarefas se divide em outros submenus onde cada um dels oferece opções a serem seguidas.

#### Informacoes da Maquina     

#### Opcoes de Limpeza   

#### Opcoes de DISCO  

#### Opcoes de Backup  

#### Opcoes de Rede 

#### Abrir Executaveis


#### Reiniciar o Computador
* Entra na estrutura de validação, isto é, se a opção for 'SIM'

```
SHUTDOWN -r -c "O Seu Computador Sera Reiniciado" -t "5"
```

> Inicia o comando shutdown -r -c " " -t,
> onde o parâmetro 'r' vem de **R**eboot,
> o parâmetro 'c' vem de **C**omment,
> e o parâmetro 't' vem de **T**ime.


#### Desligar o Computador 
    * Inicia o comando shutdown -s -c, onde o parâmetro “s” vem de __S__hutdown;

