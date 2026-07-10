param(
  [string]$HostName = "207.148.101.128",
  [string]$User = "root",
  [string]$RemoteDir = "/opt/kiro/frontend",
  [string]$Branch = "main"
)

$ErrorActionPreference = "Stop"

Write-Host "Kiro frontend cloud sync" -ForegroundColor Cyan
Write-Host ("Remote: {0}@{1}:{2}" -f $User, $HostName, $RemoteDir)

ssh "$User@$HostName" "set -e; cd '$RemoteDir'; git fetch origin '$Branch'; git reset --hard 'origin/$Branch'; if command -v nginx >/dev/null 2>&1; then nginx -t && systemctl reload nginx; fi; echo synced: \$(git rev-parse --short HEAD)"
