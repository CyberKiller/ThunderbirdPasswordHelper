#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.14.5
	Author:         CyberKiller
	Version: 0.0.2

	Script Function:
	Assists with those pesky Thunderbird multiple Master Password prompts.

	How it works:
	The script prompts for the master password, launches Thunderbird then types the password into each password prompt for you.

	Disclaimer:
	I (the author) ACCEPT NO RESPONSIBILITY FOR ANYTHING BAD THAT ARISES FROM USE OF THIS SCRIPT. USE WITH CAUTION!
	I quickly wrote this script due to the usual workaround addons not being compatible with Thunderbird 60 (Quantum).
	Bugs and security problems may be present.
	There is also a slight chance the script could type the password into the wrong window.

#ce ----------------------------------------------------------------------------

;----SCRIPT CONFIG----
;Edit these if needed

;Path to thunderbird.exe
;Change this if thunderbird is installed somewhere else
Global Const $sTHUNDERBIRD_PATH = "C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe"

;The number of password dialogs the script will try to fill in before aborting
;Change this if you need it to do more
Global Const $iPW_DLG_LIMIT = 10

;----END OF SCRIPT CONFIG----
;----DO NOT EDIT BELOW THIS LINE----

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#pragma compile(inputboxres, true)

#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

Global Const $sSCRIPT_TITLE = "Thunderbird Password Helper"
Global Const $sWIN_DESC_MAIN = "[REGEXPTITLE:(?m)Mozilla Thunderbird$; CLASS:MozillaWindowClass]"
Global Const $sWIN_DESC_PW_DLG = "[TITLE:Password Required; CLASS:MozillaDialogClass]"

Main()


Func Main()
	Local $sPassword = PasswordPrompt()
	If StringLen($sPassword) = 0 Then Exit
	If Not Run($sTHUNDERBIRD_PATH) Then ErrorTrapAbort("Could not launch Thunderbird." & @CRLF & 'If Thunderbird is installed in a different location to: "' _
			 & @CRLF & $sTHUNDERBIRD_PATH & '",' & @CRLF & "then edit $sTHUNDERBIRD_PATH in the script config.")
	If Not _WinWaitActivate($sWIN_DESC_MAIN, "", 40) Then ErrorTrapAbort("Timeout waiting for thunderbird to start.")
	$i = 0
	While True
		If Not _WinWaitActivate($sWIN_DESC_PW_DLG, "", 5) Then ExitLoop ;stop when there are no more password dialogs
		If $i = $iPW_DLG_LIMIT Then ;Prompt if the limit is reached
			Switch MsgBox(BitOR($MB_ICONQUESTION, $MB_CANCELTRYCONTINUE), $sSCRIPT_TITLE, "Password dialog limit reached. Was the password entered incorrectly? " _
					 & "Change $iPW_DLG_LIMIT in the script config to change the limit." & @CRLF & "Abort script, Retype password or Continue?")
				Case $IDCANCEL
					Exit
				Case $IDTRYAGAIN
					$sPassword = PasswordPrompt()
					$i = 0
				Case $IDCONTINUE
					$i = 0
			EndSwitch
		EndIf
		SendKeepActive($sWIN_DESC_PW_DLG)
		Send($sPassword, $SEND_RAW)
		Send("{ENTER}")
		$i += 1
	WEnd
EndFunc   ;==>Main


Func PasswordPrompt()
	Return InputBox($sSCRIPT_TITLE, "Please input the Thunderbird master password.", "", "*M", 364, 158)
EndFunc   ;==>PasswordPrompt


Func _WinWaitActivate(Const $sTITLE, Const $sTEXT = "", Const $iTIMEOUT = 0)
	WinWait($sTITLE, $sTEXT, $iTIMEOUT)
	Local Const $hTIMER = TimerInit(), $iTIMEOUT_MS = $iTIMEOUT * 1000
	While Not WinActive($sTITLE, $sTEXT)
		WinActivate($sTITLE, $sTEXT)
		If $iTIMEOUT And TimerDiff($hTIMER) > $iTIMEOUT_MS Then
			Return False
		EndIf
	WEnd
	Return True
EndFunc   ;==>_WinWaitActivate


Func ErrorTrapAbort(Const $sERROR)
	BlockInput(False)
	MsgBox($MB_ICONERROR, $sSCRIPT_TITLE & "- Error", $sERROR & @CRLF & "Script will now be aborted!")
	Exit
EndFunc   ;==>ErrorTrapAbort
