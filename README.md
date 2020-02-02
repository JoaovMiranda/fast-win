# Menu Agil  
## Criado a partir do estudo de programação em lotes.  

 * Menu em BatchFile   para computadores lentos e de baixa qualidade, auxilia pessoas leigas sobre funcionalidades e na inicialização de comandos primarios;

* O menu se divide em uma estrutura de arvore, isto é, Menu de tarefas se divide em outros submenus onde cada um deles oferece opções a serem seguidas.

#### 1) Informacoes da Maquina  
 * Inicia os comandos:  
 
````
WMIC baseboard get product, manufacturer, version, serialnumber
````
> Mostra informações sobre a placa mãe.  

````
POWERCFG /L
````
> Lista todos os esquemas de energia;  
Onde o parâmetro 'l' vem de **L**ist.  

````
VOL
````
> Exibe o nome e o número de série do disco.  

````
SYSTEMINFO > c:\INFO.txt
````
> Esta ferramenta exibe informações de configuração de sistema para um computador, inclusive níveis de service pack;  
É criado um arquivo .txt no disco C: contendo todas essas informações.  

#### 2) Opcoes de Limpeza   

#### 3) Opcoes de DISCO  

#### 4) Opcoes de Backup  

#### 5) Opcoes de Rede  
* Entra na estrutura de escolha, isto é, selecionar entre as opções:  

**1. Teste de TCP**  
 ```
 PING www.google.com -n 10
 PING www.youtube.com -n 10
 ```
> O comando **PING** verifica a conectividade no nível de IP para outro computador TCP/IP enviando mensagens de solicitação de eco ICMP. O recebimento de mensagens de resposta de eco correspondentes é exibido, juntamente com tempos de ida e volta;  
São passados como parâmetros o Google e o Youtube;  
Onde o parâmetro 'n' vem de **N**umber of requests;  

**2. Melhorar a Internet**  

```
IPCONFIG /flushdns
```
> Limpa o cache do DNS Resolver.

```
netsh winsock reset
```
> Comando para redefinir o catálogo winsock de volta à configuração padrão ou ao estado limpo.  
```
NBTSTAT -R
```
> Limpa e recarrega a tabela de nomes de caches remotas;  
Onde o parâmetro 'r' vem de **R**echarge.  


#### 6) Abrir Executaveis  
* Entra na estrutura de escolha, isto é, selecionar entre as opções:   
**1.  Abrir Calculadora:**  
```
START calc.exe
```
> Inicia o executável da Calculadora nativo;

**2.  Abrir Painel de Controle:**
```
START control.exe
```
> Inicia a ferramenta de sistema Painel de controle.  

**3.  Abrir Ger. Tarefas:**  
```
START taskmgr.exe
```
> Inicia o executavel Gerenciador de tarefas nativo.  

**4.  Desinstalar Programas:**  
```
START appwiz.cpl
```
> Inicia o executável da janela para adicionar ou remover programas.  


#### 7) Reiniciar o Computador  
* Entra na estrutura de validação, isto é, se a opção for 'SIM':  

```
SHUTDOWN -r -c "O Seu Computador Sera Reiniciado" -t "5"
```

> Inicia o comando 'SHUTDOWN -r -c " " -t';  
Onde o parâmetro 'r' vem de **R**eboot;  
O parâmetro 'c' vem de **C**omment;  
O parâmetro 't' vem de **T**ime.


#### 8) Desligar o Computador  
* Entra na estrutura de validação, isto é, se a opção for 'SIM':  

```
SHUTDOWN -s -c "O Seu Computador Sera Desligado" -f
```

> Inicia o comando 'SHUTDOWN -s -c " " -f';  
Onde o parâmetro 's' vem de **S**hutdown;  
O parâmetro 'c' vem de **C**omment;  
O parâmetro 'f' vem de **F**orce.

#### 10) GitHub  
* Inicia o comando:  
```
START https://github.com/joaovMiranda/Menu_Agil
```
> Abre o repositório do [Menu Agil](https://github.com/joaovMiranda/Menu_Agil)  


