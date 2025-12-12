@echo off
REM LanguageTool Startup Script para sa Java 21
REM Gumawa ni: GitHub Copilot
REM Petsa: Disyembre 6, 2025

echo ==================================================
echo   LanguageTool - Grammar ^& Style Checker
echo   Java 21 LTS Version
echo ==================================================
echo.

REM Set Java 21 Home
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.9.10-hotspot"
set "PATH=%JAVA_HOME%\bin;%PATH%"

REM Check Java version
echo Sinusukat ang Java version...
java -version
echo.

REM Check kung naka-build na
set "STANDALONE_DIR=languagetool-standalone\target\LanguageTool-6.8-SNAPSHOT"
set "JAR_FILE=%STANDALONE_DIR%\LanguageTool.jar"

if not exist "%JAR_FILE%" (
    echo Hindi pa naka-build ang LanguageTool. Sisimulan ang build process...
    echo Ito ay tatagal ng 5-10 minuto. Mangyaring maghintay...
    echo.
    
    REM Build the project
    call mvn package -DskipTests
    
    if errorlevel 1 (
        echo.
        echo ERROR: Nabigo ang build process!
        echo Subukan muli o tignan ang error messages sa itaas.
        pause
        exit /b 1
    )
    
    echo.
    echo Build SUCCESS! Sisimulan na ang LanguageTool...
    echo.
)

REM Run LanguageTool GUI
if exist "%JAR_FILE%" (
    echo Inilulunsad ang LanguageTool GUI...
    echo.
    echo Mga Available na Feature:
    echo   - Grammar at spelling checker para sa 30+ languages
    echo   - Style suggestions
    echo   - Real-time checking
    echo.
    echo Para isara: I-close lang ang GUI window
    echo.
    
    cd "%STANDALONE_DIR%"
    java -jar LanguageTool.jar
) else (
    echo.
    echo ERROR: Hindi mahanap ang LanguageTool.jar
    echo Location: %JAR_FILE%
    echo.
    echo Mangyaring i-build muna:
    echo   mvn clean package -DskipTests
    pause
    exit /b 1
)
