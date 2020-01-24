:: Nome   : Menu.bat
:: Motivo : Agilizar pequenas ações diárias.
:: Autor  : github.com/joaovMiranda
:: VERSÃO : 1.4.3
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
	ECHO    * 1.  Informacoes da Maquina       *
	ECHO    * 2.  Opcoes de Limpeza            * 
	ECHO    * 3.  Opcoes de DISCO              * 
	ECHO    * 4.  Opcoes de Backup             * 
	ECHO    * 5.  Opcoes de Rede               *
	ECHO    * 6.  Abrir Executaveis            *
	ECHO    * 7.  Reiniciar o Computador       *
	ECHO    * 8.  Desligar o Computador        *
	ECHO     ==================================
	ECHO    * 10. GitHub                       *
	ECHO    * 20. Voltar ao Guia               *
	ECHO    * 50. Sair                         *
	ECHO     ==================================


	REM Estrutura de Afirmações Para Menu
	SET /p opcao= Escolha uma opcao: 
	ECHO ------------------------------
	IF %opcao% EQU 1 GOTO INFO
	IF %opcao% EQU 2 GOTO LIMP
	IF %opcao% EQU 3 GOTO DISCO
	IF %opcao% EQU 4 GOTO BACKUP
	IF %opcao% EQU 5 GOTO REDE
	IF %opcao% EQU 6 GOTO EXE
	IF %opcao% EQU 7 GOTO REINICIAR
	IF %opcao% EQU 7 GOTO DESLIGAR
	IF %opcao% EQU 20 GOTO wellcome
	IF %opcao% EQU 10 GOTO github
	IF %opcao% EQU 50 GOTO EXIT

	REM Se menor que 1 ou igual maior que X : Opção inválida
	IF %opcao% LSS 1 GOTO ERROR


REM Informações sobre a máquina
:INFO
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

:LIMP
	CLS
	TITLE LIMPEZA
	ECHO        ---- MENU DE LIMPEZA ----
	ECHO     ===============================
	ECHO    * 1. Esvaziar a Lixeira         *
	ECHO    * 2. Limpeza Interna            *
	ECHO    * 3. Limpar Arquivos Temporarios*
	ECHO    * 4. Limpar Fila de Impressao   *
	ECHO    * 5. Voltar                     *
	ECHO     ===============================
	SET /p limp= Selecione :

	IF %limp% EQU 1 GOTO limp1
	IF %limp% EQU 2 GOTO limp2
	IF %limp% EQU 3 GOTO limp3
	IF %limp% EQU 4 GOTO limp4
	IF %limp% EQU 5 GOTO limp5

	IF %limp% GTR 5 GOTO limp6
	IF %limp% LSS 1 GOTO limp6

REM Apaga Todos os Arquivos da Lixeira
	:limp1
		CLS
		TITLE LIMPANDO ...
		RD /S /Q c:\$Recycle.bin
		ECHO  ==================================
		ECHO *        Lixeira Esvaziada         *
		ECHO  ==================================
		PAUSE
		GOTO menu

REM Apagando arquivos desnecessarios
	:limp2
		TITLE LIMPANDO ARQUIVOS ...
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
		ECHO  ==================================
		ECHO *        Limpeza Concluida         *
		ECHO  ==================================
		PAUSE
		GOTO menu

REM Limpar Arquivos Temporarios
	:limp3
		TITLE LIMPANDO ARQUIVOS TEMP...
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
		ECHO  ==================================
		ECHO *        Limpeza Concluida         *
		ECHO  ==================================
		PAUSE
		GOTO menu

REM Limpar fila de impressão 	
	:limp4
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

	:limp5
		CLS
		GOTO menu

	:limp6
		CLS
		ECHO 	=======================================
		ECHO  * Opcao Invalida! Escolha outra opcao.    *
		ECHO 	=======================================
		PAUSE
		GOTO LIMP

REM Opções de Disco
:DISCO
	CLS
	TITLE DISCO 
	
	ECHO         ---- MENU DE DISCO ----
	ECHO     ===============================
	ECHO    * 1. Desfragmentar disco (C:)   *
	ECHO    * 2. Verificar Integridade      *
	ECHO    * 3. Checar Saude do Disco      *
	ECHO    * 4. Voltar                     *
	ECHO     ===============================
	SET /p disc= Selecione :

	IF %disc% EQU 1 GOTO disc1
	IF %disc% EQU 2 GOTO disc2
	IF %disc% EQU 3 GOTO disc3
	IF %disc% EQU 4 GOTO disc4

	IF %disc% GTR 4 GOTO disc5
	IF %disc% LSS 1 GOTO disc5

REM Desfragmantar o disco
	:disc1
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
		IF %dfrag% EQU 0 GOTO oppp2

		IF %dfrag% GTR 1 GOTO oppp3
		IF %dfrag% LSS 0 GOTO oppp3

			:oppp1
				DEFRAG C: /U /V
				PAUSE
				GOTO menu
			:oppp2
				START dfrgui.exe
				GOTO menu
			:oppp3
				ECHO  ============================================
				ECHO * Opcao Invalida! Escolha outra opcao. (1/0) *
				ECHO  ============================================
				PAUSE
				GOTO disc1 

REM Escanear integridade do sistema
	:disc2
		CLS
		SFC /scannow
		PAUSE
		GOTO menu

REM CHECKDISK 
	:disc3
		CLS
		TITLE ESCANEANDO ...
		ECHO  				 ==================================
		ECHO  				*       Escaneamento de Disco       *
		ECHO   				 ==================================
		chkdsk c:
		PAUSE
		GOTO menu

	:disc4
		CLS
		GOTO menu

	:disc5
		CLS
		ECHO 	=======================================
		ECHO  * Opcao Invalida! Escolha outra opcao.    *
		ECHO 	=======================================
		PAUSE
		GOTO DISCO

REM Tipos de BackUP
:BACKUP
	CLS
	TITLE BACK-UP
	ECHO          ---- MENU DE BACKUP ----
	ECHO     ==================================
	ECHO    * 1.  Fazer Backup dos Documentos  * 
	ECHO    * 2.  Limpar Area de Trabalho      *
	ECHO    * 3.  Voltar                       *
	ECHO     ==================================
	SET /p bac= Selecione :

	IF %bac% EQU 1 GOTO bac1
	IF %bac% EQU 2 GOTO bac2
	IF %bac% EQU 3 GOTO bac3

	IF %bac% GTR 3 GOTO bac6
	IF %bac% LSS 1 GOTO bac6

REM Copia Arquivos da Pasta 'Documentos' Para Uma Pasta de Backup; Insira Seu Endereço de Escolha
	:bac1
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

REM MOVE Todos os Arquivos do Desktop Para Uma Pasta de Backup
	:bac2
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
		ECHO   * Opcao Invalida! Escolha outra opcao.    *
		ECHO 	=======================================
		PAUSE
		GOTO EXE

:EXE
REM Iniciar executáveis 
	CLS
	TITLE EXECUTAVEIS
	ECHO         ---- ABRIR EXECUTAVEIS ----
	ECHO      =================================
	ECHO    * 1.  Abrir Calculadora            *
	ECHO    * 2.  Abrir Painel de Controle     *
	ECHO    * 3.  Abrir Ger. Tarefas           *
	ECHO    * 4.  Desinstalar Programas        *
	ECHO    * 5.  Voltar                       *
	ECHO      =================================
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
		ECHO   * Opcao Invalida! Escolha outra opcao.   *
		ECHO 	=======================================
		PAUSE
		GOTO EXE

:REDE
	CLS
	TITLE REDE 
	ECHO     ---- OPCOES DE REDE ----
	ECHO  ==============================
	ECHO *   1. Teste de TCP            *
	ECHO *   2. Melhorar a Internet     *
	ECHO *   3. Voltar                  *
	ECHO  ==============================
	SET /p red= Selecione :
	IF %red% EQU 1 GOTO oppp1
	IF %red% EQU 2 GOTO oppp2
	IF %red% EQU 3 GOTO oppp3

	IF %red% GTR 3 GOTO oppp4
	IF %red% LSS 1 GOTO oppp4

REM Teste de instabilidade 
	:oppp1
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

REM  Melhorando sua internet
	:oppp2
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
		ECHO   * Opcao Invalida! Escolha outra opcao.  *
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
			shutdown -s -c "O Seu Computador Sera Desligado" -f
		:opp2
			GOTO menu
		:opp3
			ECHO 	=======================================
			ECHO * Opcao Invalida! Escolha outra opcao. (1/0) *
			ECHO 	=======================================
			PAUSE
			GOTO opcao16

:EXIT
	CLS
	exit

:ERROR
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
	START https://github.com/joaovMiranda/Menu_Agil
	CLS
	GOTO menu









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
