ECHO OFF
ECHO 
:S
:IN

mode 34,18
@ECHO OFF
echo   ฬอออออออออออออออออออออออออออออ
echo.                                 
echo     SELECIONE O TIPO DE LIMPEZA 
echo.                  
echo.                
echo       ฬอออออออออออออออออออออออฬ
echo.
ECHO    1 -         RAPIDA
echo       ฬออออออออออออออออออออออออฬ
echo. 
ECHo    2 -          MEDIA       
echo       ฬอออออออออออออออออออออออฬ
echo.
ECHO    3 -         COMPLETA 
echo        อออออออออออออออออออออออ
echo.
set /p opcao=    Digite um Numero:        
if %opcao% equ 1 goto 1
if %opcao% equ 2 goto 2
if %opcao% equ 3 goto 3
GOTO IN
color 4a
:1
color 4a
cls

color 1a
echo msgbox "EVITE ABRIR QUALQUER PROGRAMA DURANTE A OPERACAO!",vbinformation,"INICIANDO" >%temp%\mensagem1.vbs
title ELIMINADOR DE SUJEIRA!
start %temp%\mensagem1.vbs
@ECHO OFF

ECHO 
mode 39,4


REM Apagando arquivos desnecessarios
 RunDll32.exe Inetcpl.cpl, ClearMyTracksByProcess 16



del C:\Windows\System32\CLINT.*.*  /q

del C:\Windows\System32\LOAD.*.*   /q

del C:\Windows\System32\GIF.*.* /q
del c:\windows\spool\printers   /q

TASKKILL /F /IM wscript.exe


DEL /s C:\windows\temp\*.* /q 
DEL /F /S /Q C:\WINDOWS\Temp\*.*

RunDll32.exe Inetcpl.cpl, ClearMyTracksByProcess 4351

DEL "%WINDIR%\Temp\*.*" /F /S /Q

RD /S /Q "%HOMEPATH%\Config~1\Temp"
MD "%HOMEPATH%\Config~1\Temp"
RD /S /Q C:\WINDOWS\Temp\
MD C:\WINDOWS\Temp
DEL /F /S /Q %HOMEPATH%\Config~1\Temp\*.*
del %temp% /q
RD /S /Q C:\RECYCLER\ 
DEL /s   C:\windows\system32\dllcache   /q
DEL /s   C:\MSOCache\*.*   /q

sc stop DiagTrack

sc stop dmwappushservice

sc delete DiagTrack
sc delete dmwappushservice
TASKKILL /F /IM wscript.exe

REM  Melhorando sua internet

%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks
TASKKILL /F /IM wscript.exe

netsh winsock reset
nbtstat -R



ECHO 

TASKKILL /F /IM wscript.exe
echo msgbox "RESPONDA A MENSAGEM COM 'S' OU 'N' ",vbinformation," FINALIZANDO" > %temp%\mensagem.vbs&start %temp%\mensagem.vbs
CHKDSK /f


ECHO 

cls

pause
shutdown  -r -c "REINICIANDO EM 3s" -t 4
echo off
mode 36,17
echo 000000000000000_00000000000000
echo 00000000000000___ 0000000000000
echo 0000000000000_____0000000000000
echo 0000000000000_______00000000000
echo 00000000000_________00000000000
echo ___________ ---------- ___________
echo          *Dr. Tutoris*
echo 000000 _____--------_____ 000000
echo 0000000_________________0000000
echo 000000_________0_________000000
echo 00000_______0000000_______00000
echo 0000_____0000000000000_____0000
echo 000___0000000000000000000___000
echo 00_0000000000000000000000000_00


GOTO S 
:2
color 4a
echo msgbox "EVITE ABRIR QUALQUER PROGRAMA DURANTE A OPERACAO!",vbinformation,"INICIANDO" >%temp%\mensagem1.vbs
title ELIMINADOR DE SUJEIRA!
start %temp%\mensagem1.vbs
@ECHO OFF

ECHO 
mode 39,4


REM Apagando arquivos desnecessarios
 RunDll32.exe Inetcpl.cpl, ClearMyTracksByProcess 16



del C:\Windows\System32\CLINT.*.*  /q

del C:\Windows\System32\LOAD.*.*   /q

del C:\Windows\System32\GIF.*.* /q
del c:\windows\spool\printers   /q


DEL /s C:\windows\temp\*.* /q 
DEL /F /S /Q C:\WINDOWS\Temp\*.*

RunDll32.exe Inetcpl.cpl, ClearMyTracksByProcess 4351

DEL "%WINDIR%\Temp\*.*" /F /S /Q

TASKKILL /F /IM wscript.exe
RD /S /Q "%HOMEPATH%\Config~1\Temp"
MD "%HOMEPATH%\Config~1\Temp"
RD /S /Q C:\WINDOWS\Temp\
MD C:\WINDOWS\Temp
DEL /F /S /Q %HOMEPATH%\Config~1\Temp\*.*
del %temp% /q
RD /S/ Q C:\RECYCLER\ 
DEL /s C:\windows\system32\dllcache /q
DEL /s C:\MSOCache\*.* /q

sc stop DiagTrack

sc stop dmwappushservice

sc delete DiagTrack
sc delete dmwappushservice
TASKKILL /F /IM wscript.exe
echo msgbox "PARTE 1 COMPLETA",vbinformation,"20 PORCENTO" >%temp%\mensagem2.vbs

start %temp%\mensagem2.vbs

REM 2 Desfragmentando o Sistema




CHKDSK 


REM  Melhorando sua internet
ipconfig /flushdns
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks
netsh winsock reset
nbtstat -R

TASKKILL /F /IM wscript.exe
echo msgbox "PARTE 2 COMPLETA",vbinformation,"90 PORCENTO" >%temp%\mensagem3.vbs

start %temp%\mensagem3.vbs


ECHO 

SFC/SCANNOW
TASKKILL /F /IM wscript.exe
echo msgbox "RESPONDA A MENSAGEM COM 'S' OU 'N' ",vbinformation," FINALIZANDO" > %temp%\mensagem.vbs&start %temp%\mensagem.vbs
CHKDSK /f


ECHO 

cls
pause
shutdown  -r -c "REINICIANDO EM 3s" -t 4
echo off
mode 36,17
echo 000000000000000_00000000000000
echo 00000000000000___ 0000000000000
echo 0000000000000_____0000000000000
echo 0000000000000_______00000000000
echo 00000000000_________00000000000
echo ___________ ---------- ___________
echo          *Dr. Tutoris*
echo 000000 _____--------_____ 000000
echo 0000000_________________0000000
echo 000000_________0_________000000
echo 00000_______0000000_______00000
echo 0000_____0000000000000_____0000
echo 000___0000000000000000000___000
echo 00_0000000000000000000000000_00



:3
color 4a
echo msgbox "EVITE ABRIR QUALQUER PROGRAMA DURANTE A OPERACAO!",vbinformation,"INICIANDO" >%temp%\mensagem1.vbs
title ELIMINADOR DE SUJEIRA!
start %temp%\mensagem1.vbs
@ECHO OFF

ECHO 
mode 39,4


REM Apagando arquivos desnecessarios
 RunDll32.exe Inetcpl.cpl, ClearMyTracksByProcess 16



del C:\Windows\System32\CLINT.*.*  /q

del C:\Windows\System32\LOAD.*.*   /q

del C:\Windows\System32\GIF.*.* /q
del c:\windows\spool\printers   /q

TASKKILL /F /IM wscript.exe


DEL /s C:\windows\temp\*.* /q 
DEL /F /S /Q C:\WINDOWS\Temp\*.*

RunDll32.exe Inetcpl.cpl, ClearMyTracksByProcess 4351

DEL "%WINDIR%\Temp\*.*" /F /S /Q

RD /S /Q "%HOMEPATH%\Config~1\Temp"
MD "%HOMEPATH%\Config~1\Temp"
RD /S /Q C:\WINDOWS\Temp\
MD C:\WINDOWS\Temp
DEL /F /S /Q %HOMEPATH%\Config~1\Temp\*.*
del %temp% /q
RD /S /Q C:\RECYCLER\ 
DEL /s   C:\windows\system32\dllcache   /q
DEL /s   C:\MSOCache\*.*   /q

sc stop DiagTrack

sc stop dmwappushservice

sc delete DiagTrack
sc delete dmwappushservice
TASKKILL /F /IM wscript.exe
echo msgbox "PARTE 1 COMPLETA",vbinformation,"20 PORCENTO" >%temp%\mensagem2.vbs

start %temp%\mensagem2.vbs

REM 2 Desfragmentando o Sistema

Defrag C:
TASKKILL /F /IM wscript.exe
echo msgbox "PARTE 2 COMPLETA",vbinformation,"60 PORCENTO" >%temp%\mensagem3.vbs

start %temp%\mensagem3.vbs



CHKDSK 


REM  Melhorando sua internet
ipconfig /flushdns
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks
netsh winsock reset
nbtstat -R

TASKKILL /F /IM wscript.exe
echo msgbox "PARTE 3 COMPLETA",vbinformation,"90 PORCENTO" >%temp%\mensagem4.vbs

start %temp%\mensagem4.vbs


ECHO 

6
SFC/SCANNOW
TASKKILL /F /IM wscript.exe
echo msgbox "RESPONDA A MENSAGEM COM 'S' OU 'N' ",vbinformation," FINALIZANDO" > %temp%\mensagem.vbs&start %temp%\mensagem.vbs
CHKDSK /f

ECHO 

cls
pause
shutdown  -r -c "REINICIANDO EM 3s" -t 4
echo off
mode 36,17
echo 000000000000000_00000000000000
echo 00000000000000___ 0000000000000
echo 0000000000000_____0000000000000
echo 0000000000000_______00000000000
echo 00000000000_________00000000000
echo ___________ ---------- ___________
echo          *Dr. Tutoris*
echo 000000 _____--------_____ 000000
echo 0000000_________________0000000
echo 000000_________0_________000000
echo 00000_______0000000_______00000
echo 0000_____0000000000000_____0000
echo 000___0000000000000000000___000
echo 00_0000000000000000000000000_00
pause




