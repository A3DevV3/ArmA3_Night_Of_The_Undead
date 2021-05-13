        if ((GAMESETTINGS getVariable "ZombieDifficulty") == 0)
        then
        {
            uiNamespace getVariable "Overlay" displayCtrl 23 ctrlSetText "Zombie difficulty: Easy";
            uiNamespace getVariable "Overlay" displayCtrl 23 ctrlSetTextColor [0,0.8,0,1];
        }
        else
        {
            if ((GAMESETTINGS getVariable "ZombieDifficulty") == 1)
            then
            {
                uiNamespace getVariable "Overlay" displayCtrl 23 ctrlSetText "Zombie difficulty: Normal";
                uiNamespace getVariable "Overlay" displayCtrl 23 ctrlSetTextColor [1,1,1,1];
            }
            else
            {
                uiNamespace getVariable "Overlay" displayCtrl 23 ctrlSetText "Zombie difficulty: Hard";
                uiNamespace getVariable "Overlay" displayCtrl 23 ctrlSetTextColor [0.9,0,0,1];
            };
        };
        
        
        if ((GAMESETTINGS getVariable "PointsPerKill") == 25)
        then
        {
            uiNamespace getVariable "Overlay" displayCtrl 24 ctrlSetText "Points Per Kill: 25";
            uiNamespace getVariable "Overlay" displayCtrl 24 ctrlSetTextColor [0.9,0,0,1];
        }
        else
        {
            if ((GAMESETTINGS getVariable "PointsPerKill") == 50)
            then
            {
                uiNamespace getVariable "Overlay" displayCtrl 24 ctrlSetText "Points Per Kill: 50";
                uiNamespace getVariable "Overlay" displayCtrl 24 ctrlSetTextColor [1,1,1,1];
            }
            else
            {
                uiNamespace getVariable "Overlay" displayCtrl 24 ctrlSetText "Points Per Kill: 100";
                uiNamespace getVariable "Overlay" displayCtrl 24 ctrlSetTextColor [0,0.8,0,1];
            };
        };
        
        if (GAMESETTINGS getVariable "MachineGunsEnabled")
        then
        {
            uiNamespace getVariable "Overlay" displayCtrl 25 ctrlSetText "Machine Guns Enabled";
            uiNamespace getVariable "Overlay" displayCtrl 25 ctrlSetTextColor [1,1,1,1];
        }
        else
        {
            uiNamespace getVariable "Overlay" displayCtrl 25 ctrlSetText "Machine Guns Disabled";
            uiNamespace getVariable "Overlay" displayCtrl 25 ctrlSetTextColor [0.9,0,0,1];
        };
        
        if (GAMESETTINGS getVariable "SpecialWeaponsEnabled")
        then
        {
            uiNamespace getVariable "Overlay" displayCtrl 26 ctrlSetText "Special Weapons Enabled";
            uiNamespace getVariable "Overlay" displayCtrl 26 ctrlSetTextColor [1,1,1,1];
        }
        else
        {
            uiNamespace getVariable "Overlay" displayCtrl 26 ctrlSetText "Special Weapons Disabled";
            uiNamespace getVariable "Overlay" displayCtrl 26 ctrlSetTextColor [0.9,0,0,1];
        };