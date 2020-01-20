:: Nome   : Menu.bat
:: Motivo : Agilizar pequenas ações diárias.
:: Autor  : github.com/joaovMiranda
:: VERSÃO : 1.4.1


@ECHO off
CLS
TITLE CONTROLE DE ACESSO
COLOR b


rem :control
rem echo enter password to activate programme
rem set/p "pass=>"
rem if NOT %pass%== 123 goto fail

:wellcome
CLS
TITLE BEM VINDO
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

REM Criando Pagina Principal 
:menu
CLS
TITLE FACILITADOR DE COMANDOS
COLOR b
REM Acessando Dados do Computador

::MODE 40,35

ECHO    USUARIO: %username% 
ECHO    COMPUTADOR: %computername% 
ECHO    DATA: %date%   %time%

ECHO    (c) 2019 Microsoft Corporation. Todos os direitos reservados.                                                                   
                                                              
                                                                                                                                    
ECHO          ----- MENU TAREFAS -----
ECHO     ==================================
ECHO    * 3.  Escanear Disco Local         *
ECHO    * 4.  Informacoes da Maquina       *

ECHO    * .  BACKUP                        * 
ECHO    * .  EXECUTAVEIS                   *
ECHO    * .  REDE                          *
ECHO    * .  Reiniciar o Computador        *
ECHO    * .  Desligar o Computador         *

ECHO    * 10. Esvaziar a Lixeira           *
ECHO    * 11. Desfragmentar o Disco        *
ECHO    * 12. Limpar Fila de Impressao     *
ECHO    * 13. Limpar Arquivos Temporarios  *
ECHO    * 14. Limpeza Interna              *

ECHO     ==================================
ECHO    * 65. Voltar ao Guia               *
ECHO    * 50. Sair                         *
ECHO     ==================================



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

::IF %opcao% EQU 8 GOTO EXE
::IF %opcao% EQU 9 GOTO REDE


IF %opcao% EQU 10 GOTO opcao10
IF %opcao% EQU 11 GOTO opcao11
IF %opcao% EQU 12 GOTO opcao12
IF %opcao% EQU 13 GOTO opcao13
IF %opcao% EQU 14 GOTO opcao14
IF %opcao% EQU 15 GOTO opcao15
IF %opcao% EQU 16 GOTO opcao16

IF %opcao% EQU 65 GOTO wellcome
IF %opcao% EQU 75 GOTO github
IF %opcao% EQU 70 GOTO opcao70
IF %opcao% EQU 85 GOTO opcao85


REM Sair do programa
IF %opcao% EQU 50 GOTO opcao50

REM Se menor que 1 ou igual maior que X : Opção inválida
IF %opcao% LSS 1 GOTO opcao100
IF %opcao% GEQ 17 GOTO opcao100

ECHO copyright


REM Informações sobre a máquina
:opcao4
CLS
TITLE INFORMACOES
COLOR c
ECHO 				 ==================================
ECHO 				*           SUA PLACA MAE          *
ECHO 				 ==================================
wmic baseboard get product, manufacturer, version, serialnumber
ECHO   				 ==================================
ECHO  				*      INFORMACOES DO SISTEMA      *
ECHO  				 ==================================
systeminfo
systeminfo > c:\INFO.txt
ECHO   				 ==================================
ECHO   				 Arquivo INFO.txt gerado no disco C:
ECHO   				 ==================================
PAUSE
GOTO menu


:opcao50
	CLS
	exit

:opcao100
	ECHO  ======================================
	ECHO * Opcao Invalida! Escolha outra opcao. *
	ECHO  ======================================
	PAUSE
	GOTO menu

:fail
	ECHO Senha incorreta, tente novamente.
	PAUSE
	GOTO control


:github
	START https://github.com/joaovMiranda
	CLS
	GOTO menu


:LIMPEZA
	CLS
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
	REM Apagando arquivos desnecessarios
	:opcao14
	CLS
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
	PAUSE
	GOTO menu
	REM Limpar Arquivos Temporarios
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
	:opcao12
	REM Limpar fila de impressão 
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

:DISCO
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

	:opcao85
	CLS
	SFC /scannow
	PAUSE
	GOTO menu


	REM CHECKDISK 
	:opcao3
	CLS
	TITLE ESCANEANDO ...
	ECHO  				 ==================================
	ECHO  				*       Escaneamento de Disco       *
	ECHO   				 ==================================
	chkdsk c:
	PAUSE
	GOTO menu

::TUDO OK DAQUI PRA BAIXO

:BACKUP
	CLS
	REM Tipos de BackUP
	TITLE BACK UP
	ECHO  ------------------------------
	ECHO    * 1.  Fazer Backup dos Documentos  * 
	ECHO    * 2.  Limpar Area de Trabalho      *
	ECHO    * 3.  Voltar                       *
	ECHO  ------------------------------
	SET /p bac= Selecione :

	IF %bac% EQU 1 GOTO bac1
	IF %bac% EQU 2 GOTO bac2
	IF %bac% EQU 3 GOTO bac3

	IF %bac% GTR 5 GOTO bac6
	IF %bac% LSS 1 GOTO bac6

	:bac1
		REM Copia Arquivos da Pasta 'Documentos' Para Uma Pasta de Backup; Insira Seu Endereço de Escolha
		CLS
		TITLE BACK UP - Documents
		ECHO  				 ==================================
		ECHO  				*      Operacao em Andamento      *
		ECHO  				 ==================================
		XCOPY /T /E /-Y /C  %userprofile%\Documents\*.*  C:\BackupDocuments
		ECHO  				 ==================================
		ECHO  				*         Backup Concluido         *
		ECHO  				 ==================================
		PAUSE
		GOTO menu
	
	:bac2
		REM MOVE Todos os Arquivos do Desktop Para Uma Pasta de Backup
		CLS
		TITLE BACK UP - Desktop
		ECHO 				 ==================================
		ECHO  				*       Operacao em Andamento      *
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
		ECHO  				*         Limpeza Concluida        *
		ECHO   				 ==================================
		PAUSE
		GOTO menu

	:bac3
		CLS
		GOTO menu

	:bac6
		ECHO 	=======================================
		ECHO * Opcao Invalida! Escolha outra opcao.    *
		ECHO 	=======================================
		PAUSE
		GOTO EXE


:EXE
	CLS
	REM Iniciar executáveis 
	TITLE EXECUTAVEIS
	ECHO  ------------------------------
	ECHO    * 1.  Abrir Calculadora            *
	ECHO    * 2.  Abrir Painel de Controle     *
	ECHO    * 3.  Abrir Ger. Tarefas           *
	ECHO    * 4.  Desinstalar Programas        *
	ECHO    * 5.  Voltar                       *
	ECHO  ------------------------------
	SET /p exec= Selecione :

	IF %exec% EQU 1 GOTO exec1
	IF %exec% EQU 2 GOTO exec2
	IF %exec% EQU 3 GOTO exec3
	IF %exec% EQU 4 GOTO exec4
	IF %exec% EQU 5 GOTO exec5

	IF %exec% GTR 5 GOTO exec6
	IF %exec% LSS 1 GOTO exec6

	:exec1
		CLS
		START calc.exe
		GOTO EXE

	:exec2
		CLS
		START control.exe
		GOTO EXE

	:exec3
		CLS
		START taskmgr.exe
		GOTO EXE

	:exec4
		CLS
		START appwiz.cpl
		GOTO EXE

	:exec5
		CLS
		GOTO menu

	:exec6
		ECHO 	=======================================
		ECHO * Opcao Invalida! Escolha outra opcao.    *
		ECHO 	=======================================
		PAUSE
		GOTO EXE


:REDE
	CLS
	TITLE REDE 
	ECHO  ------------------------------
	ECHO *   1. Teste de TCP            *
	ECHO *   2. Melhorar a Internet     *
	ECHO *   3. Voltar                  *
	ECHO  ------------------------------
	SET /p red= Selecione :

	IF %red% EQU 1 GOTO oppp1
	IF %red% EQU 2 GOTO oppp2
	IF %red% EQU 3 GOTO oppp3

	IF %red% GTR 3 GOTO oppp4
	IF %red% LSS 1 GOTO oppp4

	:oppp1
		REM Teste de instabilidade 
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
	:oppp2
		REM  Melhorando sua internet
		CLS
		TITLE TRABALHANDO ...
		ipconfig /flushdns
		ECHO  =======================================
		netsh winsock reset
		ECHO  =======================================
		nbtstat -R
		ECHO  =======================================
		PAUSE
		GOTO menu
	:oppp3
		CLS
		GOTO menu
	:oppp4
		ECHO 	=======================================
		ECHO * Opcao Invalida! Escolha outra opcao.    *
		ECHO 	=======================================
		PAUSE
		GOTO REDE

:REINICIAR
	CLS
	COLOR 2
	REM Estrutura de Afirmação para Checar a Escolha do Usuario
	TITLE REINICIAR
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

:DESLIGAR
	CLS
	COLOR 2
	TITLE DESLIGAR
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



::(A SER ADCIONADOS)
:::opcao30
::CLS 
::NET USE z:servidor\compartilhamento
::z:
::dir
::P::AUSE
::GOTO menu
::TASKKILL /F /IM wscript.exe

::echo msgbox "EVITE ABRIR QUALQUER PROGRAMA DURANTE A OPERACAO!",vbinformation,"INICIANDO" >%temp%\mensagem1.vbs
::start %temp%\mensagem1.vbs

 ::RunDll32.exe Inetcpl.cpl, ClearMyTracksByProcess 16

::TREE /?
::D::IR /?
::NETSTAT /?