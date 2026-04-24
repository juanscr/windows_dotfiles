; ===== Execute applications ===== ;
#Enter::Run "pwsh.exe -WorkingDirectory ~"
#i::Run "msedge.exe"
#s::Run "Spotify.exe"

#Numpad0::Run "ms-teams.exe"

; Do not launch menu with lwin key
~LWin::vkE8

; Turn on glazewm + yasb
#>^g::{
  Run "glazewm.exe start"
  Run 'pwsh.exe -WindowStyle Hidden -File "' A_UserProfile '\.config\yasb\launch-yasb.ps1"'
}
