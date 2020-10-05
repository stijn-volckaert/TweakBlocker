class TBLog extends StatLogFile;

var string LogPrefix;
var string LogPath;

function StartLog()
{
    local string FileName;
    local string str, str2;
    local int i;

	str = Level.Game.GameReplicationInfo.ServerName;
	str2 = "";
	for (i = 0; i<Len(Str); i++)
		if (InStr("\\/*?:<>\"|", Mid(str, i, 1)) != -1)
			str2 = str2 $ "_";
		else
			str2 = str2 $ Mid(str, i, 1);

	FileName = LogPath$LogPrefix$" - "$str2$"."$GetShortAbsoluteTime();
	StatLogFile = FileName$".tmp";
	StatLogFinal = FileName$".log";
	OpenLog();
}

function Timer() {}

defaultproperties
{
	StatLogFile="./TweakBlocker.log"
}
