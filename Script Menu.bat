@echo off
cls
title BEM VINDO
color b
echo  				 ==================================
echo 				*          BEM VINDO               * 
echo  				 ==================================                
pause
cls
rem Criando Pagina Principal 
:menu
cls
color b


rem Acessando Dados do Computador
TITLE FACILITADOR DE COMANDOS
echo COMPUTADOR: %computername% 
echo USUARIO: %username% 
echo DATA: %date%
echo .                                                                   
echo .                                                                   
echo .                                                                   
echo .                                                                   

echo      ----- MENU TAREFAS -----
echo  ==================================
echo * 1. Fazer Backup                  * 
echo * 2. Limpar Area de Trabalho       *
echo * 3. Esvaziar a Lixeira            *
echo * 4. Escanear Disco Local          *
echo * 5. Informacoes da Maquina        *
echo * 6. Abrir Calculadora             *
echo * 7. Abrir Painel de Controle      *
echo * 8. Abrir Ger. Tarefas            *
echo * 9. Reiniciar o Computador        *
echo * 10. Sair                         *
echo  ==================================

rem Estrutura de Afirmações Para Menu
set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% equ 7 goto opcao7
if %opcao% equ 8 goto opcao8
if %opcao% equ 9 goto opcao9
if %opcao% equ 10 goto opcao10
if %opcao% LSS 1 goto opcao100
if %opcao% GEQ 11 goto opcao100



:opcao1
cls
rem Copia Arquivos da Pasta 'Documentos' Para o Desktop; Insira Seu Endereço de Escolha
xcopy /T /C  %userprofile%\Documents\*.*  %userprofile%\Desktop
echo ==================================
echo *      Backup Concluido           *
echo ==================================
pause
goto menu

:opcao2
cls
rem Move Todos os Arquivos do Desktop Para Uma Pasta de Backup
C:
cd \
md Backup
cd %userprofile%\Desktop\teste
move * C:\Backup
echo  ==================================
echo *      Limpeza Concluida           *
echo  ==================================
pause
goto menu

:opcao3
cls
rem Apaga Todos os Arquivos da Lixeira
rd /S /Q c:\$Recycle.bin
echo  ==================================
echo *      Lixeira Esvaziada           *
echo  ==================================
pause
goto menu

:opcao4
cls
echo  ==================================
echo *     Escaneamento de Disco        *
echo  ==================================
chkdsk c:
pause
goto menu

:opcao5
cls
color c
echo  ==================================
echo *        SUA PLACA MAE            	*
echo  ==================================
wmic baseboard get product, manufacturer, version, serialnumber
echo  ==================================
echo *    INFORMAÇOES DO SISTEMA        *
echo  ==================================
systeminfo
pause
goto menu

:opcao6
cls
start calc.exe
pause
goto menu

:opcao7
cls
start control.exe
pause
goto menu

:opcao8
cls
start taskmgr.exe
pause
goto menu

:opcao9
cls
color 2
rem Estrutura de Afirmação para Checar a Escolha do Usuario
echo  ------------------------------
echo *  1. = Yes                    *
echo *  0. = No                     *
echo  ------------------------------
set /p rein= Tem Certeza ?:
if %rein% equ 1 goto op1
if %rein% GTR 1 goto op3
if %rein% equ 0 goto op2
if %rein% LSS 0 goto op3
	:op1
	shutdown -r -c "O Seu Computador Sera Reiniciado" -t "5"
	:op2
	pause
	goto menu
	:op3
	echo 	=======================================
	echo * Opcao Invalida! Escolha outra opcao. (1/0) *
	echo 	=======================================
	pause
	goto opcao8

:opcao10
cls
exit


:opcao100
echo  =======================================
echo * Opcao Invalida! Escolha outra opcao  *
echo  =======================================
pause
goto menu



TREE