# Cloudflare Tunnel Setup Instructions

## Getting Your Tunnel Token

1. Go to [https://one.dash.cloudflare.com/](https://one.dash.cloudflare.com/)
2. Login with your account (m.naim@robopro.team)
3. Navigate to "Access" → "Tunnels" in the left sidebar
4. Click "Create a tunnel"
5. Name your tunnel "maybe-finance"
6. Copy the installation command with your unique token
7. Run the command in PowerShell with Administrator privileges

## Installing as a Service

After copying the tunnel token command from Cloudflare dashboard, run:

```powershell
# Run PowerShell as Administrator
cd d:\MaybeFinance
.\cloudflared.exe service install YOUR_TOKEN_HERE
```

## Configure Tunnel Routing

After installing:
1. Back in the Cloudflare dashboard, continue to the next step
2. For "Public Hostname":
   - Select a domain you own in Cloudflare (or add one)
   - Set up a subdomain (e.g., maybe.yourdomain.com)
3. For "Service":
   - Select "HTTP"
   - Enter "localhost:3000" as the URL
4. Click Save

## Managing the Service

Start the service:
```powershell
.\cloudflared.exe service start
```

Stop the service:
```powershell
.\cloudflared.exe service stop
```

Check service status:
```powershell
.\cloudflared.exe service status
```

## Making Changes

If you need to modify your tunnel configuration later:
1. Update settings in the Cloudflare dashboard
2. Restart the service to apply changes
