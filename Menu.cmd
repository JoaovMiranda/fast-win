:: Nome   : Menu.cmd
:: Motivo : Agilizar pequenas ações e funcionalidades.
:: Autor  : github.com/joaovMiranda
:: VERSÃO : 1.4.5


:: Desativando residuos ECHO
@ECHO off

:: Traduzindo para UTF-8
CHCP 65001 > nul

ECHO MSGBOX "PARA TOTAL FUNCIONALIDADE É ACONSELHADO EXECUTAR O ARQUIVO COMO ADMINISTRADOR",256,"MENU AGIL" >%temp%\mensagem1.vbs
START %temp%\mensagem1.vbs

:: Autenticação
CLS
TITLE CONTROLE DE ACESSO
COLOR b
:control
ECHO  ==========================================
ECHO *   INSIRA A SENHA PARA ATIVAR O PROGRAMA  *
ECHO  ------------------------------------------
ECHO *  - Para mais Informacões, acesse a       * 
ECHO *    documentação do repositorio GIT raíz  *
ECHO  ==========================================
SET /P "pass=>" Senha: 
IF NOT %pass%== admin GOTO fail

:wellcome
CLS
TITLE BEM VINDO
ECHO  				 ==================================
ECHO 				*            BEM VINDO             *
ECHO 				*                                  * 
ECHO 				* Guia:                            *
ECHO 				* - Para total funcionalidade é    *
ECHO 				*   necessario que o programa seja * 
ECHO 				*   executado como administrador.  *
ECHO 				* - Digite um numero natural(N*)   * 
ECHO 				*   para selecionar uma das opcoes.* 
ECHO 				* - Aperte as teclas Ctrl + C para * 
ECHO 				*   para abortar uma operacão.     *
ECHO 				* - Aperte a tecla Enter para      *
ECHO 				*   continuar as operações         *
ECHO  				+ ================================ + 
ECHO 				*                                  * 
ECHO 				*       MADE BY: Joao Miranda      * 
ECHO 				*      github.com/joaovMiranda     * 
ECHO 				*  Copyright (c) 2020 João Miranda * 
ECHO  				 ==================================
PAUSE > nul

:: Criando Pagina Principal 
:menu
	CLS
	TITLE FACILITADOR DE COMANDOS
	COLOR b
::	MODE 40,35
	ECHO    USUARIO: %username% 
	ECHO    COMPUTADOR: %computername% 
	ECHO    DATA: %date%   %time%
	ECHO:                                                                      
																
																																		
	ECHO          ----- MENU TAREFAS -----
	ECHO     ==================================
	ECHO    * 1.  Informacões da Maquina       *
	ECHO    * 2.  Opcões de Limpeza            * 
	ECHO    * 3.  Opcões de DISCO              * 
	ECHO    * 4.  Opcões de Backup             * 
	ECHO    * 5.  Opcões de Rede               *
	ECHO    * 6.  Abrir Executaveis            *
	ECHO    * 7.  Reiniciar o Computador       *
	ECHO    * 8.  Desligar o Computador        *
	ECHO     ==================================
	ECHO    * 9. GitHub                        *
	ECHO    * 10. Voltar ao Guia               *
	ECHO    * 11. Sair                         *
	ECHO     ==================================

:: Estrutura de Afirmações Para Menu
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
	IF %opcao% EQU 9 GOTO github
	IF %opcao% EQU 10 GOTO wellcome
	IF %opcao% EQU 11 GOTO EXIT

:: Se menor que 1 ou igual maior que X : Opção inválida
	IF %opcao% LSS 1 GOTO ERROR
	IF %opcao% GTR 11 GOTO ERROR


:: Informações sobre a máquina
:INFO
	CLS
	TITLE INFORMACOES
	COLOR c
	ECHO 				 ==================================
	ECHO 				*           SUA PLACA MAE          *
	ECHO 				 ==================================
	WMIC baseboard get product, manufacturer, version, serialnumber
	ECHO 				 ==================================
	ECHO 				*        ESQUEMAS DE ENERGIA       *
	ECHO 				 ==================================
	POWERCFG /L 
	ECHO   				 ==================================
	ECHO  				*      INFORMACOES DO SISTEMA      *
	ECHO  				 ==================================
	VOL
	SYSTEMINFO
	SYSTEMINFO > c:\INFO.txt
	ECHO   				 ==================================
	ECHO   				 Arquivo INFO.txt gerado no disco C:
	ECHO   				 ==================================
	PAUSE
	GOTO menu

::Serviçoes de limpeza
:LIMP
	CLS
	ECHO MSGBOX "POR SEGURANÇA É ACONSELHADO CRIAR UM BACK UP ANTES DE PROSSEGUIR",256,"MENU AGIL" >%temp%\mensagem2.vbs
	START %temp%\mensagem2.vbs
	TITLE LIMPEZA
	ECHO        ---- MENU DE LIMPEZA ----
	ECHO     ===============================
	ECHO    * 1. Esvaziar a Lixeira         *
	ECHO    * 2. Limpeza Interna            *
	ECHO    * 3. Limpar Arquivos Temporarios*
	ECHO    * 4. Limpar Fila de Impressao   *
	ECHO    * 5. Voltar                     *
	ECHO     ===============================
	SET /p limp= Selecione: 

	IF %limp% EQU 1 GOTO limp1
	IF %limp% EQU 2 GOTO limp2
	IF %limp% EQU 3 GOTO limp3
	IF %limp% EQU 4 GOTO limp4
	IF %limp% EQU 5 GOTO limp5

	IF %limp% GTR 5 GOTO limp6
	IF %limp% LSS 1 GOTO limp6

:: Apaga Todos os Arquivos da Lixeira
	:limp1
		CLS
		TITLE LIMPANDO ...
		RD /S /Q C:\$Recycle.bin
		ECHO  ==================================
		ECHO *        Lixeira Esvaziada         *
		ECHO  ==================================
		PAUSE>nul
		GOTO menu

:: Apagando arquivos desnecessarios
	:limp2
		TITLE LIMPANDO ARQUIVOS ...
		CLS
		TASKKILL /F /IM wscript.exe
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

:: Limpar Arquivos Temporarios
	:limp3
		TITLE LIMPANDO ARQUIVOS TEMP...
		CLS
		IF EXIST c:\windows\temp\ DEL /f /s /q c:\windows\temp\
		DEL /f /s /q %temp%\
		IF EXIST “C:\Documents and Settings\” (
			FOR /D %%x in (“C:\Documents and Settings\*”) do (
				RMDIR /s /q “%%x\Local Settings\Temporary Internet Files”
				mkdir “%%x\Local Settings\Temporary Internet Files”
			)
		)
		IF EXIST “C:\Documents and Settings\” (
			FOR /D %%x in (“C:\Documents and Settings\*”) do (
				RMDIR /s /q “%%x\Local Settings\Temp”
				MKDIR “%%x\Local Settings\Temp”
			)
		)
		PAUSE
		CLS
		:limp3Cont
			ECHO      ---- DESEJA AÇÃO PARA OUTROS USERS ? ----
			ECHO          ===============================
			ECHO         *           1. SIM              *
			ECHO         *           0. NÃO              *
			ECHO          ===============================
			SET /p Userop= Escolha uma opcao: 
			IF %Userop% EQU 0 GOTO :limpC
			IF %Userop% EQU 1 GOTO :limp3U
			IF %Userop% GTR 1 GOTO :limp3F
			IF %Userop% LSS 0 GOTO :limp3F
			:limp3U
				CLS
				IF EXIST “C:\Users\” (
					FOR /D %%x in (“C:\Users\*”) do (
						RMDIR /s /q “%%x\AppData\Local\Temp”
						MKDIR “%%x\AppData\Local\Temp”
					)
				)
				IF EXIST “C:\Users\” (
					FOR /D %%x in (“C:\Users\*”) do (
						RMDIR /s /q “%%x\AppData\Local\Microsoft\Windows\Temporary Internet Files”
						MKDIR “%%x\AppData\Local\Microsoft\Windows\Temporary Internet Files”
					)
				)
			PAUSE
			CLS	
		GOTO :limpC
		
		:limpC
		ECHO  ==================================
		ECHO *        Limpeza Concluida         *
		ECHO  ==================================
		PAUSE
		GOTO menu

		:limp3F
		ECHO  ==================================
		ECHO *        Opção Errada              *
		ECHO  ==================================
		PAUSE
		GOTO :limp3Cont

:: Limpar fila de impressão 	
	:limp4
		CLS
		NET STOP spooler
		C:
		CD %systemroot%\system32\spool\printers
		DEL /F /S *.shd
		DEL /F /S *.spl
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

:: Opções de Disco
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
	SET /p disc= Selecione:

	IF %disc% EQU 1 GOTO disc1
	IF %disc% EQU 2 GOTO disc2
	IF %disc% EQU 3 GOTO disc3
	IF %disc% EQU 4 GOTO disc4

	IF %disc% GTR 4 GOTO disc5
	IF %disc% LSS 1 GOTO disc5

:: Desfragmantar o disco
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

:: Escanear integridade do sistema
	:disc2
		CLS
		SFC /scannow
		PAUSE
		GOTO menu

:: CHECKDISK 
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

:: Tipos de BackUP
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

:: Copia Arquivos da Pasta 'Documentos' Para Uma Pasta de Backup; Insira Seu Endereço de Escolha
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

:: MOVE Todos os Arquivos do Desktop Para Uma Pasta de Backup
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
:: Iniciar executáveis 
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
	ECHO *   3. Informacoes da rede     *
	ECHO *   4. Voltar                  *
	ECHO  ==============================
	SET /p red= Selecione :
	IF %red% EQU 1 GOTO oppp1
	IF %red% EQU 2 GOTO oppp2
	IF %red% EQU 3 GOTO oppp3
	IF %red% EQU 4 GOTO oppp4


	IF %red% GTR 4 GOTO oppp5
	IF %red% LSS 1 GOTO oppp5

:: Teste de instabilidade 
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

::  Melhorando sua internet
	:oppp2
		CLS
		TITLE TRABALHANDO ...
		IPCONFIG /flushdns
		ECHO  =======================================
		netsh winsock reset
		ECHO  =======================================
		NBTSTAT -R
		ECHO  =======================================
		
		PAUSE
		GOTO menu

	:oppp3
		CLS
		TITLE INFORMACOES DA REDE
		ECHO                    ===================
		ECHO                   * Dados de conexao  * 
		ECHO                    ===================
		IPCONFIG  /ALL
		PAUSE
		GOTO menu

	:oppp4
		CLS
		GOTO menu

	:oppp5
		ECHO 	=======================================
		ECHO   * Opcao Invalida! Escolha outra opcao.  *
		ECHO 	=======================================
		PAUSE
		GOTO REDE

:REINICIAR
	CLS
	COLOR 2
	:: Estrutura de Afirmação para Checar a Escolha do Usuario
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



