; Remove Win + L keybind for locking the workstation
RegWrite 1, "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation"

; Remove all windows normal keys
RegWrite 1, "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoWinKeys"

; Lock screen
#+x:: {
  ; re-enable locking workstation, then lock it
  RegWrite 0, "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation"
  DllCall("LockWorkStation")
  Reload
}
