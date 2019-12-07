@ECHO off
CLS
TITLE BEM VINDO
COLOR b


REM VERSÃO 1.4.0

ECHO  				 ==================================
ECHO 				*            BEM VINDO             *
ECHO 				*                                  * 
ECHO 				* Guia:                            *
ECHO 				* - Para total funcionalidade eh   *
ECHO 				*   necessario que o programa seja * 
ECHO 				*   executado como administrador.  *
ECHO 				* - Digite um numero natural(N*)   * 
ECHO 				*   para selecionar uma das opcoes.* 
ECHO 				* - Aperte as teclas Ctrl + C para * 
ECHO 				*   para abortar uma operacao.     *
ECHO  				+ ================================ + 
ECHO 				*                                  * 
ECHO 				*       MADE BY: Joao Miranda      * 
ECHO 				*      github.com/joaovMiranda     * 
ECHO 				*                                  * 
ECHO  				 ==================================


PAUSE
CLS
REM Criando Pagina Principal 
:menu
CLS
COLOR b


REM Acessando Dados do Computador
TITLE FACILITADOR DE COMANDOS
ECHO COMPUTADOR: %computername% 
ECHO USUARIO: %username% 
ECHO DATA: %date%
ECHO .                                                                   
ECHO .                                                                   
ECHO .                                                                   
ECHO .                                                                   

ECHO      ----- MENU TAREFAS -----
ECHO  ==================================
ECHO * 1. Fazer Backup dos Documentos   * 
ECHO * 2. Limpar Area de Trabalho       *
ECHO * 3. Escanear Disco Local          *
ECHO * 4. Informacoes da Maquina        *
ECHO * 5. Abrir Calculadora             *
ECHO * 6. Abrir Painel de Controle      *
ECHO * 7. Abrir Ger. Tarefas            *
ECHO * 8. Teste de TCP                  *
ECHO * 9. ???????????????????           *
ECHO * 10. Esvaziar a Lixeira           *
ECHO * 11. Desfragmentar o Disco        *
ECHO * 12. Limpar Fila de Impressao     *
ECHO * 13. Limpar Arquivos Temporarios  *
ECHO * 14. Limpeza Interna              *
ECHO * 15. Reiniciar o Computador       *
ECHO * 16. Desligar o Computador        *
ECHO * 50. Sair                         *
ECHO  ==================================

REM Estrutura de Afirmações Para Menu
SET /p opcao= Escolha uma opcao: 
ECHO ------------------------------
IF %opcao% EQU 1 GOTO opcao1
IF %opcao% EQU 2 GOTO opcao2
IF %opcao% EQU 3 GOTO opcao3
IF %opcao% EQU 4 GOTO opcao4
IF %opcao% EQU 5 GOTO opcao5
IF %opcao% EQU 6 GOTO opcao6
IF %opcao% EQU 7 GOTO opcao7
IF %opcao% EQU 8 GOTO opcao8
IF %opcao% EQU 9 GOTO opcao9
IF %opcao% EQU 10 GOTO opcao10
IF %opcao% EQU 11 GOTO opcao11
IF %opcao% EQU 12 GOTO opcao12
IF %opcao% EQU 13 GOTO opcao13
IF %opcao% EQU 14 GOTO opcao14
IF %opcao% EQU 15 GOTO opcao15
IF %opcao% EQU 16 GOTO opcao16

REM SAIR
IF %opcao% EQU 50 GOTO opcao50
REM Se menor que 1 ou igual maior que X : Opção inválida
IF %opcao% LSS 1 GOTO opcao100
IF %opcao% GEQ 17 GOTO opcao100


REM Copia Arquivos da Pasta 'Documentos' Para Uma Pasta de Backup; Insira Seu Endereço de Escolha
:opcao1
CLS
TITLE BACK UP - Documents
ECHO  				 ==================================
ECHO  				*      Operacao em Andamento      *
ECHO  				 ==================================
XCOPY /T /E /-Y /C  %userprofile%\Documents\*.*  C:\BackupDocuments
ECHO  				 ==================================
ECHO  				*      Backup Concluido           *
ECHO  				 ==================================
PAUSE
GOTO menu


REM MOVE Todos os Arquivos do Desktop Para Uma Pasta de Backup
:opcao2
CLS
TITLE BACK UP - Desktop
ECHO 				 ==================================
ECHO  				*      Operacao em Andamento       *
ECHO  				 ==================================
CD C:\
IF EXIST C:\BackupDesktop (
	CD %userprofile%\Desktop
	MOVE /-Y * C:\BackupDesktop
) ELSE (
	MD BackupDesktop
	CD %userprofile%\Desktop
	MOVE /-Y * C:\BackupDesktop
ECHO   				 ==================================
ECHO  				*       Limpeza Concluida          *
ECHO   				 ==================================
PAUSE
GOTO menu


REM CHECKDISK 
:opcao3
CLS
TITLE ESCANEANDO ...
ECHO  				 ==================================
ECHO  				*     Escaneamento de Disco        *
ECHO   				 ==================================
chkdsk c:
PAUSE
GOTO menu


REM Informações sobre a máquina
:opcao4
CLS
TITLE INFORMACOES
COLOR c
ECHO 				 ==================================
ECHO 				*        SUA PLACA MAE             *
ECHO 				 ==================================
wmic baseboard get product, manufacturer, version, serialnumber
ECHO   				 ==================================
ECHO  				*    INFORMACOES DO SISTEMA        *
ECHO  				 ==================================
systeminfo
systeminfo > c:\INFO.txt
ECHO   				 ==================================
ECHO   				 Arquivo INFO.txt gerado no disco C:
ECHO   				 ==================================

PAUSE
GOTO menu


REM Iniciar executáveis 
:opcao5
CLS
START calc.exe
GOTO menu

:opcao6
CLS
START control.exe
GOTO menu

:opcao7
CLS
START taskmgr.exe
GOTO menu


REM Teste de instabilidade 
:opcao8
CLS
TITLE TESTANDO ...
ECHO  =======================================
ECHO + SERAO ENVIADOS 10 PACOTES DE 32 BYTES  +
ECHO + EM 2 ENDERECOS AVULSOS (GOOGLE/YOUTUBE)+
ECHO  =======================================
PING www.google.com -n 10
PAUSE
PING www.youtube.com -n 10
PAUSE
ECHO  =======================================
ECHO + VERIFIQUE TAXA DE ENVIADOS ~ RECEBIDOS +
ECHO + SE VARIAR POUCO: CONEXAO ESTAVEL       +
ECHO + SE VARIAR MUITO: ALGO ERRADO           +
ECHO  =======================================
PAUSE
GOTO menu


:opcao9
CLS
PAUSE
GOTO menu


REM Apaga Todos os Arquivos da Lixeira
:opcao10
CLS
TITLE LIMPANDO ...
RD /S /Q c:\$Recycle.bin
ECHO  ==================================
ECHO *      Lixeira Esvaziada           *
ECHO  ==================================
PAUSE
GOTO menu


REM Desfragmantar o disco 
:opcao11
CLS
TITLE OTIMIZANDO ...
ECHO  ==================================
ECHO *     Desfragmentar Disco via:     *
ECHO *                                  *
ECHO *       1. Prompt                  *
ECHO *       0. Exec. nativo            *
ECHO  ==================================
SET /p dfrag= Digite :
IF %dfrag% EQU 1 GOTO oppp1
IF %dfrag% GTR 1 GOTO oppp3
IF %dfrag% EQU 0 GOTO oppp2
IF %dfrag% LSS 0 GOTO oppp3
	:oppp1
	DEFRAG C: /U /V
	:oppp2
	START dfrgui.exe
	GOTO menu
	:oppp3
	ECHO  ============================================
	ECHO * Opcao Invalida! Escolha outra opcao. (1/0) *
	ECHO  ============================================
	PAUSE
 
PAUSE
GOTO menu 

:opcao12
CLS
NET STOP spooler
c:
CD %systemroot%\system32\spool\printers
DEL /f/s *.shd
DEL /f/s *.spl
NET START spooler
ECHO  =======================================
ECHO +          Processo Finalizado          +
ECHO  =======================================
PAUSE
GOTO menu


:opcao13
IF EXIST c:\windows\temp\ (
forfiles /p C:\Windows\Temp /s /m *.* /D -7 /C “cmd /c del /Q @path”
)
IF EXIST C:\Users\ (
for /D %%x in (“C:\Users\*”) do (
forfiles /p %%x\AppData\Local\Temp /s /m *.* /D -7 /C “cmd /c del /Q @path”
forfiles /p %%x\AppData\Local\Microsoft\Windows\Temporary Internet Files /s /m *.* /D -7 /C “cmd /c del /Q @path”
forfiles /p %%x\AppData\Local\Microsoft\Windows\WER\ReportQueue /s /m *.* /C “cmd /c del /Q @path”
)
)
PAUSE
GOTO menu


:opcao14
CLS
PAUSE
GOTO menu

:opcao15
CLS
COLOR 2
REM Estrutura de Afirmação para Checar a Escolha do Usuario
ECHO  ------------------------------
ECHO *  1. = Yes                    *
ECHO *  0. = No                     *
ECHO  ------------------------------
SET /p rein= Tem Certeza ?:
IF %rein% EQU 1 GOTO op1
IF %rein% GTR 1 GOTO op3
IF %rein% EQU 0 GOTO op2
IF %rein% LSS 0 GOTO op3
	:op1
	shutdown -r -c "O Seu Computador Sera Reiniciado" -t "5"
	:op2
	GOTO menu
	:op3
	ECHO 	=======================================
	ECHO * Opcao Invalida! Escolha outra opcao. (1/0) *
	ECHO 	=======================================
	PAUSE
	GOTO opcao15

:opcao16
CLS
COLOR 2
ECHO  ------------------------------
ECHO *  1. = Yes                    *
ECHO *  0. = No                     *
ECHO  ------------------------------
SET /p shut= Tem Certeza ?:
IF %shut% EQU 1 GOTO opp1
IF %shut% GTR 1 GOTO opp3
IF %shut% EQU 0 GOTO opp2
IF %shut% LSS 0 GOTO opp3
	:opp1
	shutdown -r -c "O Seu Computador Sera Desligado" -p
	:opp2
	GOTO menu
	:opp3
	ECHO 	=======================================
	ECHO * Opcao Invalida! Escolha outra opcao. (1/0) *
	ECHO 	=======================================
	PAUSE
	GOTO opcao16

:opcao50
CLS
exit

:opcao100
ECHO  ======================================
ECHO * Opcao Invalida! Escolha outra opcao. *
ECHO  ======================================
PAUSE
GOTO menu








(A SER ADCIONADOS)
:opcao30
CLS 
NET USE z:servidor\compartilhamento
z:
dir
PAUSE
GOTO menu


TREE /?
DIR /?
NETSTAT /?