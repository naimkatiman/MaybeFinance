# Maybe Finance Cloudflare Tunnel Runner
# This script runs a persistent Cloudflare tunnel to your Maybe Finance application

Write-Host "Starting Cloudflare Tunnel for Maybe Finance..." -ForegroundColor Green
Write-Host "Press Ctrl+C to stop the tunnel when you're finished" -ForegroundColor Yellow

# Run the tunnel with a custom name to make it more recognizable
.\cloudflared.exe tunnel --url http://localhost:3000 --name maybe-finance-$env:USERNAME
