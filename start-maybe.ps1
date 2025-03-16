# Start Maybe Finance using Docker Compose
# This script simplifies running the application from your project folder

# Set working directory to script location
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $scriptPath

# Ensure environment variables are loaded
if (!(Test-Path .\.env)) {
    Write-Host "Error: .env file not found. Please create it first with required variables." -ForegroundColor Red
    Write-Host "Required variables: SECRET_KEY_BASE, POSTGRES_PASSWORD, and optionally POSTGRES_USER and POSTGRES_DB" -ForegroundColor Yellow
    exit 1
}

# Start the application
Write-Host "Starting Maybe Finance..." -ForegroundColor Green
docker compose -f compose.yml up -d

# Display status
Write-Host "`nContainer status:" -ForegroundColor Cyan
docker compose -f compose.yml ps

Write-Host "`nMaybe Finance is running!" -ForegroundColor Green
Write-Host "Access it at: http://localhost:3000" -ForegroundColor Green
Write-Host "`nTo stop the application, run: docker compose -f compose.yml down" -ForegroundColor Yellow
