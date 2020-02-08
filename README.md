# Menu Agil  

FastWin é um *script* de atividades feito em comandos que serão executados sequencialmente pelo interpretador de comandos do Windows.  

## Sobre  
 * Auxilia pessoas leigas sobre funcionalidades e na inicialização de comandos primarios, bem como um material de estudos acerca dos comandos do MS-DOS, Windows ou OS/2.  
 * Útil para agilizar atividades e tarefas diárias simples como limpeza e Backup.  
 * O menu divide-se em uma estrutura de arvore, isto é, Menu de tarefas se divide em outros submenus onde cada um deles oferece opções a serem seguidas.  
 * A senha de acesso padrão é 'admin'. :key:  

## Guia :clipboard:  

#### 1) Informações da Máquina  

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

#### 2) Opções de Limpeza   
  
**2.1. Limpar a Lixeira**  

```bat
RD /S /Q c:\$Recycle.bin
```
 >  Inicia o comando **R**M**D**IR (Remove directory);  
Onde o parâmetro 'S' vem de **S**ubdirectories. Exclui uma árvore de diretórios e todos os seus subdiretórios, incluindo todos os arquivos;  
E o parâmetro 'Q' vem de **Q**uiet. Não solicita confirmação ao excluir uma árvore de diretórios.  

**2.2. Limpeza Interna**  
```bat
TASKKILL /F /IM wscript.exe
DEL C:\Windows\System32\CLINT.*.*  /q
DEL C:\Windows\System32\LOAD.*.*   /q
DEL C:\Windows\System32\GIF.*.* /q
DEL c:\windows\spool\printers   /q
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

**2.3. Limpar arquivos temporarios**
* Antes de inicar o processo é válidado para **se** existir os respectivos diretórios.  

```bat
IF EXIST c:\windows\temp\ ( 
	DEL /f /s /q c:\windows\temp\
	DEL /f /s /q %temp%\
	DEL /s C:\windows\temp\*.* /q 
	DEL /F /S /Q C:\WINDOWS\Temp\*.*
	DEL "%WINDIR%\Temp\*.*" /F /S /Q
	RD /S /Q "%HOMEPATH%\Config~1\Temp"
	MD "%HOMEPATH%\Config~1\Temp"
	RD /S /Q C:\WINDOWS\Temp\
	MD C:\WINDOWS\Temp
	DEL /F /S /Q %HOMEPATH%\Config~1\Temp\*.*
	DEL %temp% /q 
		)
 ```
 > O comando **DEL** deleta os arquivos;   
Onde o parâmetro 'S' vem de **S**ubDirectory. Instrui a incluir subpastas;  
O parâmetro 'Q' vem de **Q**uiet. Não solicita confirmação ao excluir;  
E o parâmetro 'F' vem de **F**orce. Força a exclusão de arquivos somente leitura.  
 
 **2.4. Limpar fila de impressão**  
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
 - Leva-se em consideração apenas a partição no disco (C:), porém pode ser editavel para qualquer partição.  
   
  **3.1. Desfragmentar disco**  
  	- Nesse caso, há duas opções de escolha, via exetutável nativo ou por via prompt:  
```bat
DEFRAG C: /U /V  
```
> O comando **DEFRAG** desfragmenta arquivos em volumes locais para melhorar o desempenho do sistema.  
Onde o parâmetro 'U' imprime o andamento da operação na tela;  
E o comando 'V' vem de **V**erbose. Imprime a saída detalhada que contém estatísticas de fragmentação de disco.  

 **3.2. Verificar Integridade**  
 
 ```bat
 SFC /scannow  
 ```
 > O comando **SFC** escaneia e verifica a integridade de todos os arquivos protegidos do sistema (SO).  
 Onde o parâmetro 'scannow' repara os arquivos com problemas quando possível.   
 
 **3.3 Checar saúde do Disco**  
 
  ```bat
 CHKDSK C: /F  
 ```
 > O comando '**CHKDSK** Verifica dados e defeitos físicos no HD e exibe um relatório de status.  
 Onde o parâmetro 'F'vem de **F**ixes. Corrige os erros do disco.  
 Se o CHKDSK não for concluído corretamente no modo de segurança, faça o backup dos dados importantes antes de continuar. Deixar de fazer isso poderá resultar na perda de dados.  
 
#### 4) Opcoes de Backup  

 **4.1. Backup dos Documents**
 
 ```bat
IF EXIST C:\BackupDocuments (
		XCOPY /E /-Y /C  %userprofile%\Documents\*.*  C:\BackupDocuments
		) ELSE (
			MD   C:\BackupDocuments & CLS & GOTO bac1
		)
```
> Estrutura de validação para a criação da pasta 'BackupDocuments' no respectivo diretório.  
**Se** existir a pasta inicia o comando **XCOPY**;  
Onde o parâmetro 'E' vem de **E**mpty. Copia diretórios e subdiretórios, inclusive os vazios;  
O parâmetro 'C' vem de **C**ontinue. Continua copiando, mesmo que ocorram erros;  
E o parâmetro '-Y' vem de **Y**es (No caso o '-' anula o sim). Para você confirmar se deseja substituir um arquivo de destino existente. 

 **4.2 Backup do Desktop**
 
```bat
 IF EXIST C:\BackupDesktop (
			CD %userprofile%\Desktop
			MOVE /-Y * C:\BackupDesktop
		) ELSE (
			MD BackupDesktop
			CD %userprofile%\Desktop
			MOVE /-Y * C:\BackupDesktop
		)
```
> Estrutura de validação para a criação da pasta 'BackupDocuments' no respectivo diretório.  
**Se** existir a pasta inicia o comando **MOVE**. Move os arquivos.

#### 5) Opcoes de Rede  

* Entra na estrutura de escolha, isto é, selecionar entre as opções:  

**5.1. Teste de TCP**  

 ```bat
 PING www.google.com -n 10
 PING www.youtube.com -n 10
 ```
> O comando **PING** verifica a conectividade no nível de IP para outro computador TCP/IP enviando mensagens de solicitação de eco ICMP. O recebimento de mensagens de resposta de eco correspondentes é exibido, juntamente com tempos de ida e volta;  
São passados como parâmetros o site da Google e do Youtube;  
Onde o parâmetro 'n' vem de **N**umber of requests. Quantidade de requisições (10).  

**5.2. Melhorar a Internet**  

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

**6.1. Abrir Calculadora:**  
```bat
START calc.exe
```
> Inicia o executável da Calculadora nativo;  

**6.2. Abrir Painel de Controle:**  
```bat
START control.exe
```
> Inicia a ferramenta de sistema Painel de controle.  

**6.3. Abrir Ger. Tarefas:**  
```bat
START taskmgr.exe
```
> Inicia o executavel Gerenciador de tarefas nativo.  

**6.4. Desinstalar Programas:**  
```bat
START appwiz.cpl
```
> Inicia o executável da janela para adicionar ou remover programas.  

**6.4. Direct X:**  
```bat
START dxdiag
```
> Inicia o executável da janela para relatório do Direct X.  

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
- [ ] 3) EM TESTE [undefined];  
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
	
### Documentação  
- [Documentação oficial da Microsoft](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands) :link:  
	-  [Em português](https://docs.microsoft.com/pt-br/windows-server/administration/windows-commands/windows-commands) :link:  



