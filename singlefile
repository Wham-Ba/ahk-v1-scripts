#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

IniRead, DestinationFolder, %A_ScriptDir%\singlefile.ini, Section1, DestinationFolder1, %A_Space%
IniRead, vSourceFolder, %A_ScriptDir%\singlefile.ini, Section1, SourceFolder, %A_Space%
IniRead, vSourceFile1, %A_ScriptDir%\singlefile.ini, Section1, FilePreset1, %A_Space%
IniRead, DestinationFolder2, %A_ScriptDir%\singlefile.ini, Section1, DestinationFolder2, %A_Space%

IniRead, vSourceFile2, %A_ScriptDir%\singlefile.ini, Section1, FilePreset2, %A_Space%
IniRead, vSourceFile3, %A_ScriptDir%\singlefile.ini, Section1, FilePreset3, %A_Space%
IniRead, vSourceFile4, %A_ScriptDir%\singlefile.ini, Section1, FilePreset4, %A_Space%

RoboFirstClick = 0

Gui, Add, GroupBox, w240 h48 Section, Source

;Source File Select
Gui, Add, Edit, x51 yp+16 w160 h20 vSourceFile1, %vSourceFile1%
Gui, Add, Button, x+5 w30 h20 vSource gSelectFile, ...

Gui, Add, Edit, x51 y22 w160 h20 vSourceFile2, %vSourceFile2%
Gui, Add, Button, x+5 w30 h20 vSourceFileButton2 gSourceFileButton2, ...

Gui, Add, Edit, x51 y22 w160 h20 vSourceFile3, %vSourceFile3%
Gui, Add, Button, x+5 w30 h20 vSourceFileButton3 gSourceFileButton3, ...

Gui, Add, Edit, x51 y22 w160 h20 vSourceFile4, %vSourceFile4%
Gui, Add, Button, x+5 w30 h20 vSourceFileButton4 gSourceFileButton4, ...

;Source Folder Select
Gui, Add, Edit, x15 yp+0 w196 h20 vSourceFolder, %vSourceFolder%
Gui, Add, Button, x+5 w30 h20 vFolderSource gFolderSource, ...

Gui, Add, GroupBox, x10 yp+24 w240 h70 Section, Destination
Gui, Add, Edit, xp+4 yp+16 w196 h20 vDestinationFolder, %DestinationFolder%
Gui, Add, Button, x+5 w30 h20 vSource2 gSelectFolder, ...

Gui, Add, Edit, x38 yp+26 w172 h20 vDestinationFolder2, %DestinationFolder2%
Gui, Add, Button, x+5 w30 h20 vSource22 gSelectFolder2, ...

Gui, Add, GroupBox, x10 yp+29 w160 h62 Section, Folder Naming
Gui, Add, Radio, gRadioTimestamp vRadioTimestamp Checked x16 yp+18, Timestamp
Gui, Add, Radio, gRadioCustom vRadioCustom xp+74, Custom
Gui, Add, Edit, x16 yp+18 w147 h20 vCustomName

Gui, Add, Button, gOk x174 y122 w76 h57 Default, OK

Gui, Add, Button, x13 y87 vRobocopy gRobocopy w23, ↪
;Gui, Add, CheckBox, x117 y46 vChk2ndFolder gChk2ndFolder, Allow Secondary Backup
;GuiControl, Disable, FileNaming

Gui, Add, Radio, gRadioFile vRadioFile Checked x58 y6, File
Gui, Add, Radio, gRadioFolder vRadioFolder xp+38 yp+0, Folder

Gui, Add, CheckBox, x147 y6 Checked vIncSubdir, Subfolders
Gui, Add, DDL, vFilePreset gFilePreset y21 x15 w30, 1||2|3|4

Gui, Add, GroupBox, x10 y180 w95 h42 Section, Quick Revert
Gui, Add, Button, x16 y195 vQuickBackup gQuickBackup w23, SAVE
Gui, Add, Button, x58 y195 vQuickRestore gQuickRestore w23, LOAD
Gui, Add, Text, x108 y188 cBlue, Alt + b for a standard backup
Gui, Add, Text, x108 y204 cBlue, Alt+o Q.Save |  Alt+p Q.Load

goSub InitialGUI
return

InitialGUI:
	GuiControl, Disable, CustomName
	GuiControl, Hide, SourceFolder
	GuiControl, Hide, FolderSource
	GuiControl, Disable, IncSubdir
	GuiControl, Disable, DestinationFolder2
	GuiControl, Disable, Source22
	
	GuiControl, Hide, SourceFile2
	GuiControl, Hide, SourceFile3
	GuiControl, Hide, SourceFile4
	
	GuiControl, Hide, SourceFileButton2
	GuiControl, Hide, SourceFileButton3
	GuiControl, Hide, SourceFileButton4
	
	GuiControl, Focus, OK
	Gui, Show
return

GuiContextMenu:
Gui, Submit, NoHide
{
    If ( A_GuiControl == "Source" )
    {
		SplitPath, SourceFile1, OutFileName, OutDir, , OutNameNoExt
		if( InStr( FileExist(OutDir), "D") )
		{
			Run, %OutDir%
		}
		return
    }
	  If ( A_GuiControl == "SourceFileButton2" )
    {
		SplitPath, SourceFile2, OutFileName, OutDir, , OutNameNoExt
		if( InStr( FileExist(OutDir), "D") )
		{
			Run, %OutDir%
		}
		return
    }
	  If ( A_GuiControl == "SourceFileButton3" )
    {
		SplitPath, SourceFile3, OutFileName, OutDir, , OutNameNoExt
		if( InStr( FileExist(OutDir), "D") )
		{
			Run, %OutDir%
		}
		return
    }
	  If ( A_GuiControl == "SourceFileButton4" )
    {
		SplitPath, SourceFile4, OutFileName, OutDir, , OutNameNoExt
		if( InStr( FileExist(OutDir), "D") )
		{
			Run, %OutDir%
		}
		return
    }

    If ( A_GuiControl == "Source2" )
    {
        if( InStr( FileExist(DestinationFolder), "D") )
		{
			Run, %DestinationFolder%
		}
    }
	If ( A_GuiControl == "FolderSource" )
    {
        if( InStr( FileExist(SourceFolder), "D") )
		{
			Run, %SourceFolder%
		}
    }
	If ( A_GuiControl == "Source22" )
    {
        if( InStr( FileExist(DestinationFolder2), "D") )
		{
			Run, %DestinationFolder2%
		}
    }
}
return

FilePreset:
	Gui, Submit, NoHide
	if (FilePreset = 1)
	{
		GuiControl, Hide, SourceFile2
		GuiControl, Hide, SourceFile3
		GuiControl, Hide, SourceFile4
		GuiControl, Hide, SourceFileButton2
		GuiControl, Hide, SourceFileButton3
		GuiControl, Hide, SourceFileButton4
		GuiControl, Show, SourceFile1
		GuiControl, Show, Source
		return
	}
	if (FilePreset = 2)
	{
		GuiControl, Show, SourceFile2
		GuiControl, Hide, SourceFile3
		GuiControl, Hide, SourceFile4
		GuiControl, Show, SourceFileButton2
		GuiControl, Hide, SourceFileButton3
		GuiControl, Hide, SourceFileButton4
		GuiControl, Hide, SourceFile1
		GuiControl, Hide, Source
		return
	}
	if (FilePreset = 3)
	{
		GuiControl, Hide, SourceFile2
		GuiControl, Show, SourceFile3
		GuiControl, Hide, SourceFile4
		GuiControl, Hide, SourceFileButton2
		GuiControl, Show, SourceFileButton3
		GuiControl, Hide, SourceFileButton4
		GuiControl, Hide, SourceFile1
		GuiControl, Hide, Source
		return
	}
	if (FilePreset = 4)
	{
		GuiControl, Hide, SourceFile2
		GuiControl, Hide, SourceFile3
		GuiControl, Show, SourceFile4
		GuiControl, Hide, SourceFileButton2
		GuiControl, Hide, SourceFileButton3
		GuiControl, Show, SourceFileButton4
		GuiControl, Hide, SourceFile1
		GuiControl, Hide, Source
		return
	}
return

Robocopy:
	if (RoboFirstClick = 0)
	{
		MsgBox, 36, %A_ScriptName%, Would you like to enable the secondary destination folder?`n`nIf enabled, clicking the ↪ button again will allow you to exactly mirror the contents of the above folder to the one underneath.`n`nNote 1: Files will be written to the top of the selected secondary folder, rather than being contained in any sort of subfolder.`n`nNote 2: This operation does not involve any of the Folder Naming options below.
		IfMsgBox Yes
		{
			RoboFirstClick = 1
			GuiControl, Enable, DestinationFolder2
			GuiControl, Enable, Source22
			return
		}
	}
	else if (RoboFirstClick = 1)
	{
	Gui, Submit, NoHide
	if (DestinationFolder = "")
	{
		MsgBox, 64, %A_ScriptName%, No primary destination folder selected.
		return
	}
	if( !InStr( FileExist(DestinationFolder), "D") )
	{
		MsgBox, 64, %A_ScriptName%, Primary destination folder does not exist.
		return
	}
	if (DestinationFolder2 = "")
	{
		MsgBox, 64, %A_ScriptName%, No secondary destination folder selected.
		return
	}
	if( !InStr( FileExist(DestinationFolder2), "D") )
	{
		MsgBox, 64, %A_ScriptName%, Secondary destination folder does not exist.
		return
	}
	MsgBox, 36, %A_ScriptName%, This operation will directly mirror the files and directory structure of the primary folder to the secondary folder.`n`nPrimary folder:`n"%DestinationFolder%"`n`nSecondary folder:`n"%DestinationFolder2%"`n`nNo files will be deleted, but identically named files will be overwritten.`n`nAre you sure you would like to proceed?
		IfMsgBox Yes
		{
		;MsgBox, 64, %A_ScriptName%, You've clicked this before.
		RunWait, robocopy "%DestinationFolder%" "%DestinationFolder2%" /s
		SoundBeep, 220
		return
		}
	}
return

Chk2ndFolder:
	Gui, Submit, NoHide
	if (Chk2ndFolder = 1)
	{
	GuiControl, Enable, DestinationFolder2
	GuiControl, Enable, Source22
	}
	else if (Chk2ndFolder = 0)
	{
	GuiControl, Disable, DestinationFolder2
	GuiControl, Disable, Source22
	}
return

RadioTimestamp:
	GuiControl, Disable, CustomName
	Gui, Show
return

RadioCustom:
	GuiControl, Enable, CustomName
return

RadioFile:
	GuiControl, Hide, SourceFolder
	GuiControl, Hide, FolderSource
	GuiControl, Disable, IncSubdir
	GuiControl, Show, FilePreset
	
	GuiControl, Enable, QuickBackup
	GuiControl, Enable, QuickRestore
	
	goSub FilePreset
	
return

RadioFolder:
	GuiControl, Show, SourceFolder
	GuiControl, Show, FolderSource
	GuiControl, Hide, SourceFile1
	GuiControl, Hide, Source
	GuiControl, Enable, IncSubdir
	GuiControl, Hide, FilePreset
	
	GuiControl, Hide, SourceFile2
	GuiControl, Hide, SourceFile3
	GuiControl, Hide, SourceFile4
	GuiControl, Hide, SourceFileButton2
	GuiControl, Hide, SourceFileButton3
	GuiControl, Hide, SourceFileButton4
	
	GuiControl, Disable, QuickBackup
	GuiControl, Disable, QuickRestore
return

Ok:
Gui, Submit, NoHide

if (RadioFile = 1)
{

	if (FilePreset = 1)
		SourceFile = %SourceFile1%
	if (FilePreset = 2)
		SourceFile = %SourceFile2%
	if (FilePreset = 3)
		SourceFile = %SourceFile3%		
	if (FilePreset = 4)
		SourceFile = %SourceFile4%

if (SourceFile = "")
{
	MsgBox, 64, %A_ScriptName%, No file selected.
	return
}
if (DestinationFolder = "")
{
	MsgBox, 64, %A_ScriptName%, No destination folder selected.
	return
}

if !FileExist(SourceFile)
{
	MsgBox, 64, %A_ScriptName%, Source file does not exist.
	return
}

FileGetTime, vSourceFileTime, %SourceFile%

SplitPath, SourceFile, OutFileName, OutDir, , OutNameNoExt

if (RadioTimestamp = 1)
{
	CheckForDuplicate = %DestinationFolder%\%OutNameNoExt%-%vSourceFileTime%\%OutFileName%
	if FileExist(CheckForDuplicate)
	{
		MsgBox, 64, %A_ScriptName%, This version of the file has already been backed up.`n%OutNameNoExt%-%vSourceFileTime%
		return
	}
	;MsgBox, 64, %A_ScriptName%, Timestamp is on.
	;MsgBox, 64, %A_ScriptName%, Folder: %OutDir% File:%OutFileName%
	;MsgBox, 64, %A_ScriptName%, Run, copy "%SourceFile%" "%DestinationFolder%\%OutNameNoExt%-%A_Now%\"
	RunWait, xcopy "%SourceFile%" "%DestinationFolder%\%OutNameNoExt%-%vSourceFileTime%\"
	SoundBeep, 220
}
else if (RadioCustom = 1)
{
	if (CustomName = "")
	{
		MsgBox, 64, %A_ScriptName%, No custom name has been entered.
		return
	}
	CheckForDuplicate = %DestinationFolder%\%OutNameNoExt%-%vSourceFileTime%\%OutFileName%
	if FileExist(CheckForDuplicate)
	{
		MsgBox, 36, %A_ScriptName%, An identical version of this file has already been backed up.`n%OutNameNoExt%-%vSourceFileTime%`n`nWould you like to rename this backup to your custom name?
		IfMsgBox Yes
		{
			;MsgBox, FileMoveDir, %DestinationFolder%\%OutNameNoExt%-%vSourceFileTime%, %DestinationFolder%\%OutNameNoExt%-%CustomName%, R
			DoubleCheckFolder = %DestinationFolder%\%OutNameNoExt%-%CustomName%
			if( InStr( FileExist(DoubleCheckFolder), "D") )
			{
			 MsgBox, 16, %A_ScriptName%, A folder with this name already exists.
			 return
			}
			FileMoveDir, %DestinationFolder%\%OutNameNoExt%-%vSourceFileTime%, %DestinationFolder%\%OutNameNoExt%-%CustomName%, R
			SoundBeep, 220
			return
		}
		else
		{
			return
		}
	}
	;MsgBox, 64, %A_ScriptName%, Custom Name is on.
	;MsgBox, 64, %A_ScriptName%, Run, copy "%SourceFile%" "%DestinationFolder%\%OutNameNoExt%-%CustomName%\"
	RunWait, xcopy "%SourceFile%" "%DestinationFolder%\%OutNameNoExt%-%CustomName%\"
	SoundBeep, 220
}
return
}

if (RadioFolder = 1)
{
	if (SourceFolder = "")
	{
		MsgBox, 64, %A_ScriptName%, No source folder selected.
		return
	}
	if (DestinationFolder = "")
	{
		MsgBox, 64, %A_ScriptName%, No destination folder selected.
		return
	}
	if( !InStr( FileExist(SourceFolder), "D") )
	{
		MsgBox, 64, %A_ScriptName%, Source folder does not exist.
		return
	}
	if (IncSubDir = 1)
	{
		SubTag = /s
	}
	else
	{
		SubTag =
	}
	
	file := SourceFolder	; added an extra folder level 
	arr := StrSplit(file, "\")		; split the string named file at all occurrences of \ and create an array with it
	dirname := arr[(arr.MaxIndex()-0)]	; take the next-to-last element of the created array, last is the file name
	;msgbox % dirname		; just for demonstration

	if (RadioTimestamp = 1)
	{
		;MsgBox, 64, %A_ScriptName%, Timestamp is on.
		;MsgBox, 64, %A_ScriptName%, Folder: %OutDir% File:%OutFileName%
		;MsgBox, 64, %A_ScriptName%, Run, copy "%SourceFile%" "%DestinationFolder%\%OutNameNoExt%-%A_Now%\"
		RunWait, xcopy "%SourceFolder%" "%DestinationFolder%\%dirname%-%A_Now%\" %SubTag%
		;SoundPlay, *48
		;MsgBox, 64, %A_ScriptName%, xcopy "%SourceFolder%" "%DestinationFolder%\%dirname%-%A_Now%\" %SubTag%
		SoundBeep, 220
	}
	else if (RadioCustom = 1)
	{
		if (CustomName = "")
		{
			MsgBox, 64, %A_ScriptName%, No custom name has been entered.
			return
		}
		;MsgBox, 64, %A_ScriptName%, Custom Name is on.
		;MsgBox, 64, %A_ScriptName%, Run, copy "%SourceFile%" "%DestinationFolder%\%OutNameNoExt%-%CustomName%\"
		RunWait, xcopy "%SourceFolder%" "%DestinationFolder%\%dirname%-%CustomName%\" %SubTag%
		;SoundPlay, *48
		;MsgBox, 64, %A_ScriptName%, xcopy "%SourceFolder%" "%DestinationFolder%\%dirname%-%CustomName%\"
		SoundBeep, 220
	}
return
}
return

SelectFile:
FileSelectFile, OutputVar, , 1
if (OutputVar = "")
    return
else
	IniWrite, %OutputVar%, %A_ScriptDir%\singlefile.ini, Section1, FilePreset1
	GuiControl,, SourceFile1, %OutputVar%
    ;MsgBox, You selected folder "%OutputVar%".
return

SelectFolder:
FileSelectFolder, OutputVar, , 3
if (OutputVar = "")
    return
else
	IniWrite, %OutputVar%, %A_ScriptDir%\singlefile.ini, Section1, DestinationFolder1
	GuiControl,, DestinationFolder, %OutputVar%
    ;MsgBox, You selected folder "%OutputVar%".
return

SelectFolder2:
FileSelectFolder, OutputVar, , 3
if (OutputVar = "")
    return
else
	IniWrite, %OutputVar%, %A_ScriptDir%\singlefile.ini, Section1, DestinationFolder2
	GuiControl,, DestinationFolder2, %OutputVar%
return

FolderSource:
FileSelectFolder, OutputVar, , 3
if (OutputVar = "")
    return
else
	IniWrite, %OutputVar%, %A_ScriptDir%\singlefile.ini, Section1, SourceFolder
	GuiControl,, SourceFolder, %OutputVar%
    ;MsgBox, You selected folder "%OutputVar%".
return

SourceFileButton2:
FileSelectFile, OutputVar, , 1
if (OutputVar = "")
    return
else
	IniWrite, %OutputVar%, %A_ScriptDir%\singlefile.ini, Section1, FilePreset2
	GuiControl,, SourceFile2, %OutputVar%
    ;MsgBox, You selected folder "%OutputVar%".
return

SourceFileButton3:
FileSelectFile, OutputVar, , 1
if (OutputVar = "")
    return
else
	IniWrite, %OutputVar%, %A_ScriptDir%\singlefile.ini, Section1, FilePreset3
	GuiControl,, SourceFile3, %OutputVar%
    ;MsgBox, You selected folder "%OutputVar%".
return

SourceFileButton4:
FileSelectFile, OutputVar, , 1
if (OutputVar = "")
    return
else
	IniWrite, %OutputVar%, %A_ScriptDir%\singlefile.ini, Section1, FilePreset4
	GuiControl,, SourceFile4, %OutputVar%
    ;MsgBox, You selected folder "%OutputVar%".
return

QuickBackup:
Gui, Submit, NoHide
if (RadioFolder = 1)
{
	MsgBox, 64, %A_ScriptName%, Quick Revert cannot be used with a Folder selected as Source.
	return
}

if (RadioFile = 1)
{

	if (FilePreset = 1)
		SourceFile = %SourceFile1%
	if (FilePreset = 2)
		SourceFile = %SourceFile2%
	if (FilePreset = 3)
		SourceFile = %SourceFile3%		
	if (FilePreset = 4)
		SourceFile = %SourceFile4%

if (SourceFile = "")
{
	MsgBox, 64, %A_ScriptName%, No Source file selected.
	return
}

if !FileExist(SourceFile)
{
	MsgBox, 64, %A_ScriptName%, Source file does not exist.
	return
}

SplitPath, SourceFile, OutFileName, OutDir, , OutNameNoExt

QuickRevertCheckForDuplicate = %OutDir%\QuickRevert\%OutFileName%
;MsgBox, 36, %A_ScriptName%, %QuickRevertCheckForDuplicate%

FileGetTime, vSourceFileTime, %SourceFile%
FileGetTime, vQuickSaveFileTime, %QuickRevertCheckForDuplicate%

;MsgBox, 52, %A_ScriptName%, SourceFileTime: %vSourceFileTime%'n'nRevert Time: %vQuickSaveFileTime%
;return

if (vSourceFileTime = vQuickSaveFileTime)
	{
	MsgBox, 64, %A_ScriptName%, Your Quick Save for this file is already identical to the current version of the Source File.
	return
	}

	if FileExist(QuickRevertCheckForDuplicate)
	{
		MsgBox, 52, %A_ScriptName%, There is already a Quick Save available for this file.`n`nAre you sure you would like to overwrite it?
		IfMsgBox Yes
		{
			QuickRevertCheckForDuplicateTimestamp = %OutDir%\QuickRevert\%OutNameNoExt%-%vQuickSaveFileTime%\%OutFileName%
			;MsgBox, 36, %A_ScriptName%, %QuickRevertCheckForDuplicateTimestamp%
			;return
			if FileExist(QuickRevertCheckForDuplicateTimestamp)
			{
			}
			else
			{
			;MsgBox, 36, %A_ScriptName%, xcopy "%QuickRevertCheckForDuplicate%" "%OutDir%\QuickRevert\%OutNameNoExt%-%vQuickSaveFileTime%\"
			RunWait, xcopy "%QuickRevertCheckForDuplicate%" "%OutDir%\QuickRevert\%OutNameNoExt%-%vQuickSaveFileTime%\"
			FileRecycle, %QuickRevertCheckForDuplicate%
			}
		}
		else
		{
			return
		}
	}
	
RunWait, xcopy "%SourceFile%" "%OutDir%\QuickRevert\"
SoundBeep, 220
SoundBeep, 420
}
return

QuickRestore:

Gui, Submit, NoHide
if (RadioFolder = 1)
{
	MsgBox, 64, %A_ScriptName%, Quick Revert cannot be used with a Folder selected as Source.
	return
}

if (RadioFile = 1)
{

	if (FilePreset = 1)
		SourceFile = %SourceFile1%
	if (FilePreset = 2)
		SourceFile = %SourceFile2%
	if (FilePreset = 3)
		SourceFile = %SourceFile3%		
	if (FilePreset = 4)
		SourceFile = %SourceFile4%

if (SourceFile = "")
{
	MsgBox, 64, %A_ScriptName%, No Source file selected.
	return
}

if !FileExist(SourceFile)
{
	MsgBox, 64, %A_ScriptName%, Source file does not exist.
	return
}

FileGetTime, vSourceFileTime, %SourceFile%
SplitPath, SourceFile, OutFileName, OutDir, , OutNameNoExt

QuickRevertCheckForDuplicate = %OutDir%\QuickRevert\%OutFileName%
;MsgBox, 36, %A_ScriptName%, %QuickRevertCheckForDuplicate%

FileGetTime, vQuickSaveFileTime, %QuickRevertCheckForDuplicate%

if (vSourceFileTime = vQuickSaveFileTime)
	{
	MsgBox, 64, %A_ScriptName%, The selected Source File is already identical to the current Quick Save.
	return
	}

	if FileExist(QuickRevertCheckForDuplicate)
	{
		MsgBox, 52, %A_ScriptName%, This operation will overwrite the current Source File with your previously made Quick Save.`n`nAre you sure you would like to continue?
		IfMsgBox Yes
		{
			MakeSureSourceIsBackedUp = %OutDir%\QuickRevert\%OutNameNoExt%-%vSourceFileTime%\%OutFileName%
			;MsgBox, 64, %A_ScriptName%, %MakeSureSourceIsBackedUp%
			;return
			if FileExist(MakeSureSourceIsBackedUp)
			{
				FileRecycle, %SourceFile%
				RunWait, xcopy "%OutDir%\QuickRevert\%OutFileName%" "%OutDir%"
				;MsgBox, 64, %A_ScriptName%, xcopy "%OutDir%\QuickRevert\%OutFileName%" "%OutDir%"
			}
			else
			{
				;MsgBox, 64, %A_ScriptName%, xcopy "%SourceFile%" "%OutDir%\QuickRevert\%OutNameNoExt%-%vSourceFileTime%\"
				RunWait, xcopy "%SourceFile%" "%OutDir%\QuickRevert\%OutNameNoExt%-%vSourceFileTime%\"
				FileRecycle, %SourceFile%
				RunWait, xcopy "%OutDir%\QuickRevert\%OutFileName%" "%OutDir%"
			}
			SoundBeep, 420
			SoundBeep, 220
		}
		else
		{
			return
		}
	}
	else
	{
		MsgBox, 64, %A_ScriptName%, No Quick Save currently exists for this file.
	}

}
return

!b::
Gosub, OK
return

!o::
Gosub, QuickBackup
return

!p::
Gosub, QuickRestore
return

GuiClose:
	ExitApp
return
