Write-Host "Starting Cloudflare Tunnel for Maybe Finance..."
.\cloudflared.exe tunnel run --config .\tunnel-config.yml
