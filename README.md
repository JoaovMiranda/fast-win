# Menu Agil
## Criado a partir do estudo de programação em lotes.

 * Menu em BatchFile para computadores lentos e de baixa qualidade, auxilia na inicialização de comandos primarios;

 O menu se divide em uma estrutura de arvore, isto é: 
    Menu de tarefas se divide em outros submenus onde cada um dels oferece opções a serem seguidas.

#### 1) Informacoes da Maquina     

#### 2) Opcoes de Limpeza   

#### 3) Opcoes de DISCO  

#### 4) Opcoes de Backup  

#### 5) Opcoes de Rede 

#### 6) Abrir Executaveis


#### 7) Reiniciar o Computador
* Entra na estrutura de validação, isto é, se a opção for 'SIM'

```
SHUTDOWN -r -c "O Seu Computador Sera Reiniciado" -t "5"
```

> Inicia o comando 'SHUTDOWN -r -c " " -t',  
onde o parâmetro 'r' vem de **R**eboot,  
o parâmetro 'c' vem de **C**omment  
e o parâmetro 't' vem de **T**ime.


#### 8) Desligar o Computador 
* Entra na estrutura de validação, isto é, se a opção for 'SIM'

```
SHUTDOWN -s -c "O Seu Computador Sera Desligado" -p
```

> Inicia o comando 'SHUTDOWN -s -c " " ',  
onde o parâmetro 's' vem de **S**hutdown,  
e o parâmetro 'c' vem de **C**omment


