@ECHO off
CLS
TITLE BEM VINDO
COLOR b


REM VERSÃO 1.2.0


ECHO  				 ==================================
ECHO 				*          BEM VINDO               * 
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
ECHO * 1. Fazer Backup                  * 
ECHO * 2. Limpar Area de Trabalho       *
ECHO * 3. Esvaziar a Lixeira            *
ECHO * 4. Desfragmentar o Disco         *
ECHO * 5. Escanear Disco Local          *
ECHO * 6. Informacoes da Maquina        *
ECHO * 7. Abrir Calculadora             *
ECHO * 8. Abrir Painel de Controle      *
ECHO * 9. Abrir Ger. Tarefas            *
ECHO * 10. Reiniciar o Computador       *
ECHO * 11. Sair                         *
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
IF %opcao% EQU 20 GOTO opcao20
IF %opcao% EQU 30 GOTO opcao30



REM SAIR
IF %opcao% EQU 50 GOTO opcao50



REM Se menor que 1 ou igual maior que X : Opção inválida
IF %opcao% LSS 1 GOTO opcao100
REM IF %opcao% GEQ 12 GOTO opcao100



:opcao1
CLS
REM Copia Arquivos da Pasta 'Documentos' Para o Desktop; Insira Seu Endereço de Escolha
XCOPY /T /C  %userprofile%\Documents\*.*  %userprofile%\Desktop
ECHO ==================================
ECHO *      Backup Concluido           *
ECHO ==================================
PAUSE
GOTO menu

:opcao2
CLS
REM Move Todos os Arquivos do Desktop Para Uma Pasta de Backup
C:
CD \
MD Backup
CD %userprofile%\Desktop\teste
move * C:\Backup
ECHO  ==================================
ECHO *      Limpeza Concluida           *
ECHO  ==================================
PAUSE
GOTO menu

:opcao3
CLS
REM Apaga Todos os Arquivos da Lixeira
RD /S /Q c:\$Recycle.bin
ECHO  ==================================
ECHO *      Lixeira Esvaziada           *
ECHO  ==================================
PAUSE
GOTO menu

:opcao4
CLS
ECHO  ==================================
ECHO *     Escaneamento de Disco        *
ECHO  ==================================
c:\WINDOWS\system32\defrag C: /f /v > c:\defrag_C_log.txt
PAUSE
GOTO menu 


:opcao5
CLS
ECHO  ==================================
ECHO *     Escaneamento de Disco        *
ECHO  ==================================
chkdsk c:
PAUSE
GOTO menu

:opcao6
CLS
COLOR c
ECHO  ==================================
ECHO *        SUA PLACA MAE            	*
ECHO  ==================================
wmic baseboard get product, manufacturer, version, serialnumber
ECHO  ==================================
ECHO *    INFORMAÇOES DO SISTEMA        *
ECHO  ==================================
systeminfo
PAUSE
GOTO menu

:opcao7
CLS
START calc.exe
PAUSE
GOTO menu

:opcao8
CLS
START control.exe
PAUSE
GOTO menu

:opcao9
CLS
START taskmgr.exe
PAUSE
GOTO menu

:opcao10
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
	PAUSE
	GOTO menu
	:op3
	ECHO 	=======================================
	ECHO * Opcao Invalida! Escolha outra opcao. (1/0) *
	ECHO 	=======================================
	PAUSE
	GOTO opcao8



:opcao50
CLS
exit

:opcao100
ECHO  =======================================
ECHO * Opcao Invalida! Escolha outra opcao  *
ECHO  =======================================
PAUSE
GOTO menu

:opcao20
CLS
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