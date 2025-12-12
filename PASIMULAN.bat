@echo off
REM =====================================================
REM   LANGUAGETOOL - Gabay sa Paggamit
REM   Java 21 LTS Edition
REM =====================================================

echo.
echo ==================================================
echo   LanguageTool - Grammar at Style Checker
echo   Java 21 LTS
echo ==================================================
echo.
echo Mga Opsyon:
echo.
echo   [1] GUI Mode - Graphical User Interface
echo   [2] Server Mode - HTTP API Server (Port 8081)
echo   [3] Build lang muna (kung hindi pa naka-build)
echo   [4] Exit
echo.

set /p choice="Piliin (1-4): "

if "%choice%"=="1" goto GUI
if "%choice%"=="2" goto SERVER
if "%choice%"=="3" goto BUILD
if "%choice%"=="4" goto END

echo.
echo Hindi valid ang choice. Subukan muli.
pause
goto:eof

:GUI
echo.
echo Sisimulan ang LanguageTool GUI...
echo.
call start-languagetool.bat
goto END

:SERVER
echo.
echo Sisimulan ang LanguageTool HTTP Server...
echo.
powershell -ExecutionPolicy Bypass -File start-server.ps1
goto END

:BUILD
echo.
echo Nag-bu-build ng LanguageTool...
echo Ito ay tatagal ng 5-10 minuto...
echo.
cd "%~dp0"
mvn install -pl languagetool-standalone -am -DskipTests
echo.
echo Build tapos na!
pause
goto END

:END
echo.
echo Salamat sa paggamit ng LanguageTool!
