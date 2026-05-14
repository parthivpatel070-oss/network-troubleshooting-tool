Write-Host "=== Network Troubleshooting Tool ===" -ForegroundColor Cyan

# 1. Check internet connection
Write-Host "`nChecking internet connection..."
$ping = Test-Connection google.com -Count 2 -Quiet

if ($ping) {
    Write-Host "Internet: Connected" -ForegroundColor Green
} else {
    Write-Host "Internet: Not Working" -ForegroundColor Red
}

# 2. Show IP configuration
Write-Host "`nIP Configuration:"
ipconfig

# 3. DNS test
Write-Host "`nDNS Test (google.com)..."
try {
    Resolve-DnsName google.com -ErrorAction Stop
    Write-Host "DNS: Working" -ForegroundColor Green
} catch {
    Write-Host "DNS: Failed" -ForegroundColor Red
}

# 4. Basic ping test
Write-Host "`nPinging Google..."
Test-Connection google.com -Count 4

Write-Host "`nNetwork check complete." -ForegroundColor Green