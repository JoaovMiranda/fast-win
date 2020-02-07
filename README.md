# Menu Agil  
## Criado a partir do estudo de programação em lotes.  



 * Menu em BatchFile   para computadores lentos e de baixa qualidade, auxilia pessoas leigas sobre funcionalidades e na inicialização de comandos primarios;  

 * O menu divide-se em uma estrutura de arvore, isto é, Menu de tarefas se divide em outros submenus onde cada um deles oferece opções a serem seguidas;  

 * A senha de acesso padrão é 'admin'. :key:  

## Guia :clipboard:  
#### 1) Informacoes da Maquina  

 * Inicia os comandos:  
 
```bat
WMIC baseboard get product, manufacturer, version, serialnumber
```
> Mostra informações sobre a placa mãe.  

```bat
POWERCFG /L
```
> Lista todos os esquemas de energia;  
Onde o parâmetro 'l' vem de **L**ist.  

```bat
VOL
```
> Exibe o nome e o número de série do disco.  

```bat
SYSTEMINFO > c:\INFO.txt
```
> Esta ferramenta exibe informações de configuração de sistema para um computador, inclusive níveis de service pack;  
É criado um arquivo .txt no disco C: contendo todas essas informações.  

#### 2) Opcoes de Limpeza   

**1. Limpar a Lixeira**  

```bat
RD /S /Q c:\$Recycle.bin
```
 >  Inicia o comando **R**M**D**IR (Remove directory);  
Onde o parâmetro 'S' vem de **S**ubdirectories. Exclui uma árvore de diretórios e todos os seus subdiretórios, incluindo todos os arquivos;  
E o parâmetro 'Q' vem de **Q**uiet. Não solicita confirmação ao excluir uma árvore de diretórios.  

**2. Limpeza Interna**  
```bat
DEL C:\Windows\System32\CLINT.*.*  /q
DEL C:\Windows\System32\LOAD.*.*   /q
DEL C:\Windows\System32\GIF.*.* /q
DEL c:\windows\spool\printers   /q
DEL /s C:\windows\temp\*.* /q 
DEL /F /S /Q C:\WINDOWS\Temp\*.*
DEL "%WINDIR%\Temp\*.*" /F /S /Q
RD /S /Q "%HOMEPATH%\Config~1\Temp"
MD "%HOMEPATH%\Config~1\Temp"
RD /S /Q C:\WINDOWS\Temp\
MD C:\WINDOWS\Temp
DEL /F /S /Q %HOMEPATH%\Config~1\Temp\*.*
DEL %temp% /q
RD /S /Q C:\RECYCLER\ 
DEL /s   C:\windows\system32\dllcache   /q
DEL /s   C:\MSOCache\*.*   /q
SC stop DiagTrack
SC stop dmwappushservice
SC Delete DiagTrack
SC Delete dmwappushservice
```
> O comando **DEL** deleta os arquivos;  
Onde o parâmetro 'S' vem de **S**ubDirectory. Instrui a incluir subpastas;  
O parâmetro 'Q' vem de **Q**uiet. Não solicita confirmação ao excluir;  
E o parâmetro 'F' vem de **F**orce. Força a exclusão de arquivos somente leitura.  
O **SC** é uma linha de comando usado para a comunicação com o Gerenciador de Controle de Serviço e os serviços.  
Deleta o 'DiagTrack'. O processo de rastreamento de diagnóstico do Microsoft Windows;  
Deleta o 'dmwappushservice'. Um keylogger que coleta informações sobre a utilização do computador e, em seguida, as envia para os servidores da Microsoft.  

**3. Limpar arquivos temporarios**
* Antes de inicar o processo é válidado para **se** existir os respectivos diretórios.  

```bat
IF EXIST c:\windows\temp\ (
			FORFILES /P C:\Windows\Temp /S /M *.* /D -7 /C “cmd /C DEL /Q @path”
		)
		IF EXIST C:\Users\ (
			FOR /D %%x in (“C:\Users\*”) do (
				FORFILES /P %%x\AppData\Local\Temp /S /M *.* /D -7 /C “cmd /C DEL /Q @path”
				FORFILES /P %%x\AppData\Local\Microsoft\Windows\Temporary Internet Files /S /M *.* /D -7 /C “cmd /C DEL /Q @path”
				FORFILES /P %%x\AppData\Local\Microsoft\Windows\WER\ReportQueue /S /M *.* /C “cmd /C DEL /Q @path”
			)
		)
 ```
 > Inicia o comando ForFiles que seleciona e executa um comando em um conjunto de arquivos;  
 Onde o parâmetro 'P' vem de **P**athName. Indica o caminho para se iniciar a pesquisa;  
 O parâmetro 'S' vem de **S**ubDirectory. Instrui a incluir subpastas;  
 O parâmetro 'M' vem de Search**M**ask. Pesquisa arquivos de acordo com uma máscara de pesquisa;  
 O parâmetro 'C' vem de **C**ommand. Indica o comando a ser executado para cada arquivo;  
 O parâmetro 'D' vem de **D**ata. Seleciona os arquivos com uma data da última modificação;  
 E o parâmetro 'Q' vem de **Q**uiet. Não solicita confirmação ao excluir.  
 
 **4. Limpar fila de impressão**  
 ```bat
NET STOP spooler
C:
CD %systemroot%\system32\spool\printers
DEL /F /S *.shd
DEL /F /S *.spl
NET START spooler
```
> Pausa o serviço de impressão e deleta os arquivos da fila.  

#### 3) Opcoes de DISCO  

#### 4) Opcoes de Backup  

#### 5) Opcoes de Rede  
* Entra na estrutura de escolha, isto é, selecionar entre as opções:  

**1. Teste de TCP**  
 ```bat
 PING www.google.com -n 10
 PING www.youtube.com -n 10
 ```
> O comando **PING** verifica a conectividade no nível de IP para outro computador TCP/IP enviando mensagens de solicitação de eco ICMP. O recebimento de mensagens de resposta de eco correspondentes é exibido, juntamente com tempos de ida e volta;  
São passados como parâmetros o site da Google e do Youtube;  
Onde o parâmetro 'n' vem de **N**umber of requests. Quantidade de requisições (10).  

**2. Melhorar a Internet**  

```bat
IPCONFIG /flushdns
```
> Limpa o cache do DNS Resolver.  

```bat
netsh winsock reset
```
> Comando para redefinir o catálogo winsock de volta à configuração padrão ou ao estado limpo.  
```bat
NBTSTAT -R
```
> Limpa e recarrega a tabela de nomes de caches remotas;  
Onde o parâmetro 'r' vem de **R**echarge.  


#### 6) Abrir Executaveis  
* Entra na estrutura de escolha, isto é, selecionar entre as opções:  

**1.  Abrir Calculadora:**  
```bat
START calc.exe
```
> Inicia o executável da Calculadora nativo;  

**2.  Abrir Painel de Controle:**  
```bat
START control.exe
```
> Inicia a ferramenta de sistema Painel de controle.  

**3.  Abrir Ger. Tarefas:**  
```bat
START taskmgr.exe
```
> Inicia o executavel Gerenciador de tarefas nativo.  

**4.  Desinstalar Programas:**  
```bat
START appwiz.cpl
```
> Inicia o executável da janela para adicionar ou remover programas.  


#### 7) Reiniciar o Computador  
* Entra na estrutura de validação, isto é, se a opção for 'SIM':  

```bat
SHUTDOWN -r -c "O Seu Computador Sera Reiniciado" -t "5"
```

> Inicia o comando 'SHUTDOWN -r -c " " -t';  
Onde o parâmetro 'r' vem de **R**eboot;  
O parâmetro 'c' vem de **C**omment;  
O parâmetro 't' vem de **T**ime.  


#### 8) Desligar o Computador  
* Entra na estrutura de validação, isto é, se a opção for 'SIM':  

```bat
SHUTDOWN -s -c "O Seu Computador Sera Desligado" -f
```

> Inicia o comando 'SHUTDOWN -s -c " " -f';  
Onde o parâmetro 's' vem de **S**hutdown;  
O parâmetro 'c' vem de **C**omment;  
O parâmetro 'f' vem de **F**orce.  

#### 10) GitHub  
* Inicia o comando:  
```bat
START https://github.com/joaovMiranda/Menu_Agil
```
> Abre o [repositório do Menu Agil](https://github.com/joaovMiranda/Menu_Agil) :link:  

### Configurações

 * Clique com o botão direito do mouse no arquivo e selecione o 'editar':  
  
![Config](https://github.com/JoaovMiranda/Menu_Agil/blob/master/Imgs/Git-MenuAgil.png)  

  
 - Para alterar a senha de acesso basta modificar a palavra '**admin**' no trecho:  
 
 ```bat
 IF NOT %pass%== admin GOTO fail
 ```
 >  Configure para letras e/ou números; :closed_lock_with_key:  
 
 - Para remover a senha basta adcionar '::' no inicio dos comandos.  
 
 ```bat
:: :control
:: ECHO enter password to activate programme
:: SET/p "pass=>"
:: IF NOT %pass%== admin GOTO fail
 ```
 >  Senha removida. :unlock:  
 
 - Para remover o MsgBox inicial.
 
 ```bat
ECHO MSGBOX "PARA TOTAL FUNCIONALIDADE EH ACONSELHADO EXECUTAR O ARQUIVO COMO ADMINISTRADOR",256,"MENU AGIL" >%temp%\mensagem1.vbs
START %temp%\mensagem1.vbs
```
> Basta adcionar o '::' no inicio dos comandos. :mute:  

### Teste funcional
- [x] 1) TESTADO [Funcional];  
- [x] 2) TESTADO [Funcional];  
	- [x] 2.1) TESTADO [Funcional]; 
	- [x] 2.2) TESTADO [Funcional];  
	- [x] 2.3) TESTADO [Funcional];  
	- [x] 2.4) TESTADO [Funcional];  
- [x] 3) EM TESTE [undefined];  
- [x] 4) TESTADO [Funcional];  
	- [x] 4.2) TESTADO [Funcional];  
	- [x] 4.2) TESTADO [Funcional];  
- [x] 5) TESTADO [Funcional];  
	- [x] 5.1) TESTADO [Funcional];  
	- [x] 5.2) TESTADO [Funcional];  
	- [x] 5.3) TESTADO [Funcional];  
- [x] 6) TESTADO [Funcional];
	- [x] 6.1) TESTADO [Funcional];  
	- [x] 6.2) TESTADO [Funcional];  
	- [x] 6.3) TESTADO [Funcional];  
	- [x] 6.4) TESTADO [Funcional];  
	- [x] 6.5) TESTADO [Funcional];  
	- [x] 6.6) TESTADO [Funcional];  
- [x] 8) TESTADO [Funcional];  
- [x] 9) TESTADO [Funcional];  
 
### Compatibilidade :computer:  
  
- [x] Funcional em  Microsoft Windows 10 Home Single Language;  
  
### Créditos  
  
-  Feito por **João Miranda** :shipit:  
	-  [E-mail](joaovmirandas@gmail.com) :e-mail:  
	-  [WhatsApp](https://api.whatsapp.com/send?phone=5581997068692&text=) :telephone_receiver:  
-  Guiado pela [documentação oficial da Microsoft](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands) :link:  
	-  [Em português](https://docs.microsoft.com/pt-br/windows-server/administration/windows-commands/windows-commands) :link:  



