#MaxHotkeysPerInterval 99999999
#include <VolumeLib>

Process Exist, spotify.exe
ProcessId := ErrorLevel
If (!ProcessId)
{
    MsgBox Spotify is not running!
    ExitApp
}

curVolume := GetAppVolume(ProcessId)

Volume_Mute::
	curVolume := GetAppVolume(ProcessId) == 0 ? curVolume : GetAppVolume(ProcessId)
	SetAppVolume(ProcessId, GetAppVolume(ProcessId) == 0 ? curVolume : 0)
	Return

Volume_Up::SetAppVolume(ProcessId, GetAppVolume(ProcessId) + 2)
Return

Volume_Down::SetAppVolume(ProcessId, GetAppVolume(ProcessId) - 2)
Return