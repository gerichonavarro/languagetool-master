@echo off
REM LanguageTool Run Script with Java 21
REM This script builds and runs LanguageTool

set JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.9.10-hotspot
set MAVEN_HOME=C:\Users\admin\maven\apache-maven-3.9.9
set PATH=%JAVA_HOME%\bin;%MAVEN_HOME%\bin;%PATH%

echo.
echo ==========================================
echo   LanguageTool with Java 21 LTS
echo ==========================================
echo.

echo Checking Java version...
java -version
echo.

REM Check if already built
if exist "languagetool-standalone\target\LanguageTool-6.8-SNAPSHOT\LanguageTool.jar" (
    echo LanguageTool is already built!
    echo.
    echo Starting LanguageTool GUI...
    echo.
    cd languagetool-standalone\target\LanguageTool-6.8-SNAPSHOT
    java -jar LanguageTool.jar
) else (
    echo Building LanguageTool - this will take 10-15 minutes...
    echo.
    
    call mvn clean package -DskipTests
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo ==========================================
        echo   BUILD SUCCESS!
        echo ==========================================
        echo.
        echo Starting LanguageTool GUI...
        echo.
        cd languagetool-standalone\target\LanguageTool-6.8-SNAPSHOT
        java -jar LanguageTool.jar
    ) else (
        echo.
        echo ==========================================
        echo   BUILD FAILED!
        echo ==========================================
        echo.
        echo Please check the errors above.
        pause
    )
)
