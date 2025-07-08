; ===== Execute applications ===== ;
#Enter::Run "pwsh.exe -WorkingDirectory ~"
#i::Run "msedge.exe"
#s::Run "Spotify.exe"

#Numpad0::Run "ms-teams.exe"

; Do not launch menu with lwin key
~LWin::vk07

; Turn on glazewm
#>^g::Run "glazewm.exe start"
