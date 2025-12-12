# LanguageTool Startup Script para sa Java 21
# Gumawa ni: GitHub Copilot
# Petsa: Disyembre 6, 2025

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  LanguageTool - Grammar & Style Checker" -ForegroundColor Cyan
Write-Host "  Java 21 LTS Version" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

# Set Java 21 Home
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.9.10-hotspot"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"

# Check Java version
Write-Host "Sinusukat ang Java version..." -ForegroundColor Yellow
$javaVersion = java -version 2>&1 | Select-String "version"
Write-Host "  $javaVersion" -ForegroundColor Green
Write-Host ""

# Check kung naka-build na
$standaloneDir = "languagetool-standalone\target\LanguageTool-6.8-SNAPSHOT"
$jarFile = "$standaloneDir\LanguageTool.jar"

if (!(Test-Path $jarFile)) {
    Write-Host "Hindi pa naka-build ang LanguageTool. Sisimulan ang build process..." -ForegroundColor Yellow
    Write-Host "Ito ay tatagal ng 5-10 minuto. Mangyaring maghintay..." -ForegroundColor Yellow
    Write-Host ""
    
    # Build the project
    mvn package -DskipTests
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host ""
        Write-Host "ERROR: Nabigo ang build process!" -ForegroundColor Red
        Write-Host "Subukan muli o tignan ang error messages sa itaas." -ForegroundColor Red
        exit 1
    }
    
    Write-Host ""
    Write-Host "Build SUCCESS! Sisimulan na ang LanguageTool..." -ForegroundColor Green
    Write-Host ""
}

# Run LanguageTool GUI
if (Test-Path $jarFile) {
    Write-Host "Inilulunsad ang LanguageTool GUI..." -ForegroundColor Green
    Write-Host ""
    Write-Host "Mga Available na Feature:" -ForegroundColor Cyan
    Write-Host "  - Grammar at spelling checker para sa 30+ languages" -ForegroundColor White
    Write-Host "  - Style suggestions" -ForegroundColor White
    Write-Host "  - Real-time checking" -ForegroundColor White
    Write-Host ""
    Write-Host "Para isara: I-close lang ang GUI window" -ForegroundColor Yellow
    Write-Host ""
    
    Set-Location $standaloneDir
    java -jar LanguageTool.jar
} else {
    Write-Host ""
    Write-Host "ERROR: Hindi mahanap ang LanguageTool.jar" -ForegroundColor Red
    Write-Host "Location: $jarFile" -ForegroundColor Red
    Write-Host ""
    Write-Host "Mangyaring i-build muna:" -ForegroundColor Yellow
    Write-Host "  mvn clean package -DskipTests" -ForegroundColor White
    exit 1
}
