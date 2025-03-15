# Maybe Finance Cloudflare Tunnel Service Installer
# Run this script as Administrator after obtaining your tunnel token

param(
    [Parameter(Mandatory=$true)]
    [string]$TunnelToken
)

# Show current directory
Write-Host "Working directory: $(Get-Location)" -ForegroundColor Green

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "This script must be run as Administrator. Please restart as Administrator." -ForegroundColor Red
    exit 1
}

# Install the Cloudflare Tunnel service
Write-Host "Installing Cloudflare Tunnel service with your token..." -ForegroundColor Green
.\cloudflared.exe service install $TunnelToken

# Check if installation was successful
if ($LASTEXITCODE -eq 0) {
    Write-Host "Successfully installed Cloudflare Tunnel service!" -ForegroundColor Green
    Write-Host "Starting service..." -ForegroundColor Yellow
    .\cloudflared.exe service start
    
    # Check service status
    Write-Host "Service status:" -ForegroundColor Cyan
    .\cloudflared.exe service status
    
    Write-Host "`nSetup complete! Your Maybe Finance application should now be accessible through your configured domain." -ForegroundColor Green
    Write-Host "Remember to complete the tunnel configuration in the Cloudflare Zero Trust dashboard." -ForegroundColor Yellow
} else {
    Write-Host "Failed to install Cloudflare Tunnel service. Please check your token and try again." -ForegroundColor Red
}
