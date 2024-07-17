; ===== Execute applications ===== ;
#Enter::Run "powershell.exe"
#i::Run "msedge.exe"

; ===== Komorebi commands ===== ;
Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}
Komorebic("start")

; Scratchpad
#^s::Komorebic("minimize")

; Quit window
#q::Komorebic("close")

; Focus windows
#h::Komorebic("focus left")
#j::Komorebic("focus down")
#k::Komorebic("focus up")
#l::Komorebic("focus right")

; Move windows
#+h::Komorebic("move left")
#+j::Komorebic("move down")
#+k::Komorebic("move up")
#+l::Komorebic("move right")

; Stack windows
#Left::Komorebic("stack left")
#Down::Komorebic("stack down")
#Up::Komorebic("stack up")
#Right::Komorebic("stack right")
#;::Komorebic("unstack")
#+Tab::Komorebic("cycle-stack previous")
#Tab::Komorebic("cycle-stack next")

; Manipulate windows
#Space::Komorebic("toggle-float")
#f::Komorebic("toggle-monocle")

; Workspaces
#1::Komorebic("focus-workspace 0")
#2::Komorebic("focus-workspace 1")
#3::Komorebic("focus-workspace 2")
#4::Komorebic("focus-workspace 3")
#5::Komorebic("focus-workspace 4")
#6::Komorebic("focus-workspace 5")
#7::Komorebic("focus-workspace 6")
#8::Komorebic("focus-workspace 7")

; Move windows across workspaces
#+1::Komorebic("move-to-workspace 0")
#+2::Komorebic("move-to-workspace 1")
#+3::Komorebic("move-to-workspace 2")
#+4::Komorebic("move-to-workspace 3")
#+5::Komorebic("move-to-workspace 4")
#+6::Komorebic("move-to-workspace 5")
#+7::Komorebic("move-to-workspace 6")
#+8::Komorebic("move-to-workspace 7")
