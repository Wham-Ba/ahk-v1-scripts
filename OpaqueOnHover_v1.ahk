;; Requires AHK v1.
; This script changes the active window to be 'always on-top', and transparent unless hovered over with the mouse.
; Primary use-case is studying foreign language VNs while occasionally doing dictionary look-ups.
; This is an adaption of a AHKv2 script by オヤビーン/beangate; found on the GameSentenceMiner Discord.
; Default hotkeys are (Ctrl + Alt + 1) to enable, and (Ctrl + Alt + 2) to disable.
; Holding the Right Alt key while hovering over the on-top window will hide it until the key is released.

; Config
exception_exe = ppInk.exe

; Variables
global targetWin := ""
BreakLoop = 0

; Turn ON with Ctrl + Alt + 1
^!1::
    global targetWin
    WinGet, currentWin, ProcessName, A
	if currentwin = Explorer.EXE
	{
		MsgBox This script cannot be used to target Windows Explorer.
		return
	}

    WinGet, currentWin, ID, A
    if currentWin = ""
	{
        MsgBox No window is currently active!
        return
    }

    ; Enable functionality for the current window
	targetWin = %currentWin%
	WinSet, Transparent, 1, ahk_id %targetWin%
	WinSet, AlwaysOnTop, On, ahk_id %targetWin%
	SoundBeep, 220
	BreakLoop = 0

; Monitor mouse hover
Loop {
    global isToggled, targetWin
	if BreakLoop = 1
	{
		WinSet, Transparent, 255, ahk_id %targetWin%
		WinSet, AlwaysOnTop, Off, ahk_id %targetWin%
		SoundBeep, 440
		BreakLoop = 0
		return
	}

	IfWinNotExist, ahk_id %targetWin%
	{
		;MsgBox Process no longer exists.
		return
	}

    if (targetWin != "")
	{
        ; Get mouse position
        MouseGetPos, mouseX, mouseY, mouseWin
        ; Check if the mouse is over the target window
		if (mouseWin = targetWin)
		{
			WinSet, Transparent, 255, ahk_id %targetWin%
			; Check for Right Alt key and hide window if held
			if GetKeyState("RAlt", P)
			{
				WinHide, ahk_id %targetWin%
				Loop
				{
					Sleep, 100
					if !GetKeyState("RAlt", P)
					{
						WinShow, ahk_id %targetWin%
						Break
					}
				}
			}
        }
		else
		{
			; Hide the window unless it's a Firefox popup (ex. Yomitan) or an excluded executable
			WinGetClass, ClassName, ahk_id %mouseWin%
			WinGet, currentWinLoop, ProcessName, A
			if ClassName = MozillaDropShadowWindowClass
			{
			}
			else if currentWinLoop = %exception_exe%
			{
			}
			else
			{
				WinSet, Transparent, 1, ahk_id %targetWin%
			}
        }
    }
    ; Add a small delay to reduce CPU usage
    Sleep, 100
}

; Turn OFF with Ctrl + Alt + 2
^!2::
if BreakLoop != 1
	{
		BreakLoop = 1
		return
	}
return
