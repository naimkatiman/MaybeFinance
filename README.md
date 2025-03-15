# MaybeFinance CloudFlare Tunnel Setup

This repository contains scripts and configuration files for setting up and running CloudFlare tunnels to expose local services securely.

## Files Included

- **run-tunnel.ps1**: Main script for running a CloudFlare tunnel manually
- **start-tunnel.ps1**: Simple script to start a tunnel
- **install-tunnel-service.ps1**: Script to install CloudFlare tunnel as a Windows service
- **tunnel-config.yml**: Configuration for the tunnel
- **compose.yml**: Docker Compose configuration for related services
- **.env**: Environment variables (not included in repo - contains secrets)
- **wrangler.toml**: Cloudflare Workers configuration

## Getting Started

1. Install CloudFlare by running the MSI installer (not included in repo)
2. Create a `.env` file with your configuration based on the template
3. Run `.\install-tunnel-service.ps1` to set up the tunnel as a Windows service
4. Or use `.\run-tunnel.ps1` to run the tunnel manually

## Prerequisites

- Windows operating system
- PowerShell
- CloudFlare account

## Additional Information

See `cloudflare-setup.md` for detailed setup instructions.
