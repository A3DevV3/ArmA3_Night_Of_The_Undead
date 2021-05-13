class GUI3000 {
   idd = 3000;
   name = "GUI3000";
   movingenable = false;
   enablesimulation = true;
   class controlsBackground
   {
   };
   class controls
   {
       class RscButton0 : RscButton
       {
			text = "Vote to kick";
           x = 0.8 * safezoneW + safezoneX;
           y = 0.31 * safezoneH + safezoneY;
           w = 0.09 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 1;
           action = "[1] execVM 'Local_Scripts\localVoteKick.sqf'";
       };
       class RscButton1 : RscButton
       {
			text = "Vote to kick";
           x = 0.8 * safezoneW + safezoneX;
           y = 0.36 * safezoneH + safezoneY;
           w = 0.09 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 2;
           action = "[2] execVM 'Local_Scripts\localVoteKick.sqf'";
       };
       class RscButton2 : RscButton
       {
			text = "Vote to kick";
           x = 0.8 * safezoneW + safezoneX;
           y = 0.41 * safezoneH + safezoneY;
           w = 0.09 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 3;
           action = "[3] execVM 'Local_Scripts\localVoteKick.sqf'";
       };
       class RscButton3 : RscButton
       {
			text = "Vote to kick";
           x = 0.8 * safezoneW + safezoneX;
           y = 0.46 * safezoneH + safezoneY;
           w = 0.09 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 4;
           action = "[4] execVM 'Local_Scripts\localVoteKick.sqf'";
       };
       class RscButton4 : RscButton
       {
			text = "Vote to kick";
           x = 0.8 * safezoneW + safezoneX;
           y = 0.51 * safezoneH + safezoneY;
           w = 0.09 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 5;
           action = "[5] execVM 'Local_Scripts\localVoteKick.sqf'";
       };
       class RscButton5 : RscButton
       {
			text = "Vote to kick";
           x = 0.8 * safezoneW + safezoneX;
           y = 0.56 * safezoneH + safezoneY;
           w = 0.09 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 6;
           action = "[6] execVM 'Local_Scripts\localVoteKick.sqf'";
       };
       class RscButton6 : RscButton
       {
			text = "Vote to kick";
           x = 0.8 * safezoneW + safezoneX;
           y = 0.61 * safezoneH + safezoneY;
           w = 0.09 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 7;
           action = "[7] execVM 'Local_Scripts\localVoteKick.sqf'";
       };
       class RscButton7 : RscButton
       {
			text = "Vote to kick";
           x = 0.8 * safezoneW + safezoneX;
           y = 0.66 * safezoneH + safezoneY;
           w = 0.09 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 8;
           action = "[8] execVM 'Local_Scripts\localVoteKick.sqf'";
       };
       class RscButton8 : RscButton
       {
			text = "Vote to kick";
           x = 0.8 * safezoneW + safezoneX;
           y = 0.71 * safezoneH + safezoneY;
           w = 0.09 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 9;
           action = "[9] execVM 'Local_Scripts\localVoteKick.sqf'";
       };
       class RscButton9 : RscButton
       {
			text = "Vote to kick";
           x = 0.8 * safezoneW + safezoneX;
           y = 0.76 * safezoneH + safezoneY;
           w = 0.09 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 10;
   		  action = "[10] execVM 'Local_Scripts\localVoteKick.sqf'";
          
       };
       class RscButton10 : RscButton
       {
			text = "Change Ready State";
           x = 0.8 * safezoneW + safezoneX;
           y = 0.81 * safezoneH + safezoneY;
           w = 0.14 * safezoneW;
           h = 0.06 * safezoneH;
           idc = 11;
           action = "execVM 'Local_Scripts\localSetReady.sqf'";
       };
	   //Disable the following functions as this mission is the public version
	   /*
       class RscButton11 : RscButton
       {
			text = "Change Zombie Difficulty";
           x = 0.35 * safezoneW + safezoneX;
           y = 0.75 * safezoneH + safezoneY;
           w = 0.12 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 12;
   		  action = "execVM 'Local_Scripts\localChangeZombieDifficulty.sqf'";
       };
       class RscButton12 : RscButton
       {
			text = "Change Points Per Kill";
           x = 0.35 * safezoneW + safezoneX;
           y = 0.78 * safezoneH + safezoneY;
           w = 0.12 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 13;
   		  action = "execVM 'Local_Scripts\localChangePointsPerKill.sqf'";
       };
	   class RscButton13 : RscButton
       {
			text = "Enable Machine Guns";
           x = 0.35 * safezoneW + safezoneX;
           y = 0.81 * safezoneH + safezoneY;
           w = 0.12 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 14;
   		  action = "execVM 'Local_Scripts\localChangeEnableMGs.sqf'";
       };
	   class RscButton14 : RscButton
       {
			text = "Enable Special Weapons";
           x = 0.35 * safezoneW + safezoneX;
           y = 0.84 * safezoneH + safezoneY;
           w = 0.12 * safezoneW;
           h = 0.03 * safezoneH;
           idc = 15;
   		  action = "execVM 'Local_Scripts\localChangeSpecialWeapons.sqf'";
       };
	   */
   };
};
