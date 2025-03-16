# Setup script for running Maybe Finance locally without Docker
# Run this in PowerShell as Administrator

# Check if Chocolatey is installed
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Install Ruby
Write-Host "Installing Ruby..."
choco install ruby -y

# Install PostgreSQL
Write-Host "Installing PostgreSQL..."
choco install postgresql -y

# Install required gems
Write-Host "Installing required gems..."
gem install bundler
gem install rails

# Create local PostgreSQL database
Write-Host "Setting up PostgreSQL database..."
$env:Path = "$env:Path;C:\Program Files\PostgreSQL\latest\bin"
$username = $env:POSTGRES_USER -replace '"', ''
$database = $env:POSTGRES_DB -replace '"', ''

# Create user and database if they don't exist
psql -U postgres -c "CREATE USER $username WITH PASSWORD '$env:POSTGRES_PASSWORD';" -e
psql -U postgres -c "CREATE DATABASE $database WITH OWNER $username;" -e

Write-Host "Setup complete! You can now try running the application directly."
