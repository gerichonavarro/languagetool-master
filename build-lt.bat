@echo off
set JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.9.10-hotspot
set MAVEN_HOME=C:\Users\admin\maven\apache-maven-3.9.9
set PATH=%JAVA_HOME%\bin;%MAVEN_HOME%\bin;%PATH%

echo.
echo ========================================
echo Building LanguageTool
echo This will take 10-15 minutes
echo ========================================
echo.

cd /d c:\xampp\htdocs\languagetool-master
call mvn install -DskipTests -Dmaven.gitcommitid.skip=true

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo BUILD SUCCESS!
    echo ========================================
    echo.
    echo To run LanguageTool GUI:
    echo cd languagetool-standalone\target\LanguageTool-6.8-SNAPSHOT
    echo java -jar LanguageTool.jar
    echo.
) else (
    echo.
    echo ========================================
    echo BUILD FAILED - Check errors above
    echo ========================================
    echo.
)

pause
