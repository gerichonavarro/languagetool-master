# LanguageTool HTTP Server Starter
# Para sa Web-based na gamit
# Java 21 LTS

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  LanguageTool HTTP Server" -ForegroundColor Cyan
Write-Host "  Grammar & Style Checker API" -ForegroundColor Cyan  
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

# Set Java 21
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.9.10-hotspot"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"

$port = 8081
Write-Host "Sisimulan ang LanguageTool HTTP Server sa port $port..." -ForegroundColor Yellow
Write-Host ""

# Build kung hindi pa naka-build
$serverJar = "languagetool-server\target\languagetool-server.jar"
if (!(Test-Path $serverJar)) {
    Write-Host "Nag-build muna ng server module..." -ForegroundColor Yellow
    mvn install -pl languagetool-server -am -DskipTests
}

Write-Host "Inilulunsad ang server..." -ForegroundColor Green
Write-Host ""
Write-Host "Kapag tumatakbo na ang server:" -ForegroundColor Cyan
Write-Host "  - Buksan sa browser: http://localhost:$port" -ForegroundColor White
Write-Host "  - API endpoint: http://localhost:$port/v2/check" -ForegroundColor White
Write-Host ""
Write-Host "Para itigil: Press Ctrl+C" -ForegroundColor Yellow
Write-Host ""

cd languagetool-server\target
java -cp languagetool-server.jar org.languagetool.server.HTTPServer --port $port --allow-origin "*"
