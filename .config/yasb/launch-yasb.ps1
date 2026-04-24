# Launch YASB with the correct config based on monitor count
# Similar to launch-waybar.sh from Arch dotfiles

# Kill existing YASB instances
Get-Process -Name "yasb" -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Sleep -Milliseconds 500

# Detect number of monitors
Add-Type -AssemblyName System.Windows.Forms
$monitorCount = [System.Windows.Forms.Screen]::AllScreens.Count

$configDir = "$env:USERPROFILE\.config\yasb"

if ($monitorCount -ge 2) {
    Copy-Item "$configDir\two-monitor-config.yaml" "$configDir\config.yaml" -Force
} else {
    Copy-Item "$configDir\one-monitor-config.yaml" "$configDir\config.yaml" -Force
}

# Start YASB
Start-Process "yasb.exe"
