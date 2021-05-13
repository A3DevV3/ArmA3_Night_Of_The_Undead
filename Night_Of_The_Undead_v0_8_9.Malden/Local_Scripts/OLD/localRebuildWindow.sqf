private ["_windowToRebuild"];
_windowToRebuild = _this select 3;
[[_windowToRebuild,clientOwner],"Server_Scripts\serverRebuildWindow.sqf"] remoteExec ["execVM",2];