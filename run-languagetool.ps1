# LanguageTool Run Script with Java 21
# This script builds and runs LanguageTool

$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.9.10-hotspot"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  LanguageTool with Java 21 LTS" -ForegroundColor Cyan  
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Check Java version
Write-Host "Checking Java version..." -ForegroundColor Yellow
java -version
Write-Host ""

# Check if already built
$jarPath = "languagetool-standalone\target\LanguageTool-6.8-SNAPSHOT\LanguageTool.jar"
if (Test-Path $jarPath) {
    Write-Host "LanguageTool is already built!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Starting LanguageTool GUI..." -ForegroundColor Yellow
    Write-Host ""
    Set-Location "languagetool-standalone\target\LanguageTool-6.8-SNAPSHOT"
    java -jar LanguageTool.jar
} else {
    Write-Host "Building LanguageTool (this will take 10-15 minutes)..." -ForegroundColor Yellow
    Write-Host ""
    
    mvn clean package -DskipTests
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "==========================================" -ForegroundColor Green
        Write-Host "  BUILD SUCCESS!" -ForegroundColor Green
        Write-Host "==========================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Starting LanguageTool GUI..." -ForegroundColor Yellow
        Write-Host ""
        Set-Location "languagetool-standalone\target\LanguageTool-6.8-SNAPSHOT"
        java -jar LanguageTool.jar
    } else {
        Write-Host ""
        Write-Host "==========================================" -ForegroundColor Red
        Write-Host "  BUILD FAILED!" -ForegroundColor Red
        Write-Host "==========================================" -ForegroundColor Red
        Write-Host ""
        Write-Host "Please check the errors above." -ForegroundColor Red
    }
}
