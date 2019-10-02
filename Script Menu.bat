@echo off
cls
rem Criando Pagina Principal 
:menu
cls
color b


rem Acessando Dados do Computador
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
echo * 5. Abrir Calculadora             *
echo * 6. Abrir Painel de Controle      *
echo * 7. Abrir Ger. Tarefas            *
echo * 8. Reiniciar o Computador        *
echo * 9. Sair                          *
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
if %opcao% GEQ 10 goto opcao10



:opcao1
cls
rem Copia Arquivos da Pasta 'Dcoumentos' Para o Desktop; Insira Seu Endereço de Escolha
xcopy /T /C C:\Users\Miranda\Documents\*.* C:\Users\Miranda\Desktop
echo ==================================
echo *      Backup concluido           *
echo ==================================
pause
goto menu

:opcao2
cls
rem Move Todos os Arquivos do Desktop Para Uma Pasta de Backup
C:
cd\
md Backup
cd\Users\Miranda\Desktop\
move * C:\Backup
echo ==================================
echo *      Limpeza concluida          *
echo ==================================
pause
goto menu

:opcao3
cls
rem Apaga Todos os Arquivos da Lixeira
rd /S /Q c:\$Recycle.bin
echo ==================================
echo *      Lixeira Esvaziada          *
echo ==================================
pause
goto menu

:opcao4
cls
echo ==================================
echo *     Escaneamento de disco       *
echo ==================================
chkdsk c:
pause
goto menu

:opcao5
cls
start calc.exe
pause
goto menu

:opcao6
cls
start control.exe
pause
goto menu

:opcao7
cls
start taskmgr.exe
pause
goto menu

:opcao8
cls
rem Estrutura de Afirmação para Checar a Escolha do Usuario
echo  ------------------------------
echo *  1. = Yes                    *
echo *  0. = No                     *
echo  ------------------------------
set /p rein= Tem Certeza ?:
if %rein% equ 1 goto op1
if %rein% equ 0 goto op2
	:op1
	shutdown -r -c "O Seu Computador Sera Reiniciado" -t "5"
	:op2
	pause
	goto menu

:opcao9
cls
exit

:opcao10
echo =======================================
echo * Opcao Invalida! Escolha outra opcao  *
echo =======================================
pause
goto menu