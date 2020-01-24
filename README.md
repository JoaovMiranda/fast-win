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
* Entra na estrutura de escolha, isto é, selecionar entre as opções:
1. Teste de TCP  
 ```
 PING www.google.com -n 10
 PING www.youtube.com -n 10
 ```
> Serão enviados 10 pacotes de 32 bytes

2. Melhorar a Internet  
	  


#### 6) Abrir Executaveis
* Entra na estrutura de escolha, isto é, selecionar entre as opções:
1.  Abrir Calculadora:
```
START calc.exe
```
> Inicia o executável da Calculadora nativo;

2.  Abrir Painel de Controle:
```
START control.exe
```
> Inicia a ferramenta de sistema Painel de controle;

3.  Abrir Ger. Tarefas:
```
START taskmgr.exe
```
> Inicia o executavel Gerenciador de tarefas nativo;

4.  Desinstalar Programas:
```
START appwiz.cpl
```
> Inicia o executável da janela para adicionar ou remover programas;


#### 7) Reiniciar o Computador
* Entra na estrutura de validação, isto é, se a opção for 'SIM':

```
SHUTDOWN -r -c "O Seu Computador Sera Reiniciado" -t "5"
```

> Inicia o comando 'SHUTDOWN -r -c " " -t';  
Onde o parâmetro 'r' vem de **R**eboot;  
O parâmetro 'c' vem de **C**omment;  
O parâmetro 't' vem de **T**ime;


#### 8) Desligar o Computador 
* Entra na estrutura de validação, isto é, se a opção for 'SIM':

```
SHUTDOWN -s -c "O Seu Computador Sera Desligado" -f
```

> Inicia o comando 'SHUTDOWN -s -c " " -f';  
Onde o parâmetro 's' vem de **S**hutdown;  
O parâmetro 'c' vem de **C**omment;  
O parâmetro 'f' vem de **F**orce;

#### 10) GitHub
* Inicia o comando:
```
START https://github.com/joaovMiranda/Menu_Agil
```
> Abre o [repositório do Menu Agil](https://github.com/joaovMiranda/Menu_Agil)


