params ["_timeRemaining"];

if (_timeRemaining > 120)
then
{
	uiNamespace getVariable "Overlay" displayCtrl 28 ctrlSetTextColor [1, 1, 1, 1];
	uiNamespace getVariable "Overlay" displayCtrl 28 ctrlSetText "Game will start when at least 50% of players are ready...";
	uiNamespace getVariable "Overlay" displayCtrl 28 ctrlShow true;
	uiNamespace getVariable "Overlay" displayCtrl 31 ctrlSetTextColor [1, 1, 1, 1];
	uiNamespace getVariable "Overlay" displayCtrl 31 ctrlSetText (format ["If the game is not started in the next %1 seconds, the mission will restart...",(600 -_timeRemaining)]);
	uiNamespace getVariable "Overlay" displayCtrl 31 ctrlShow true;
}
else
{
	uiNamespace getVariable "Overlay" displayCtrl 28 ctrlSetTextColor [1, 1, 1, 1];
	uiNamespace getVariable "Overlay" displayCtrl 28 ctrlSetText (format ["Intermission will end in %1 seconds...",(120 -_timeRemaining)]);
	uiNamespace getVariable "Overlay" displayCtrl 28 ctrlShow true;
	uiNamespace getVariable "Overlay" displayCtrl 31 ctrlShow false;
};