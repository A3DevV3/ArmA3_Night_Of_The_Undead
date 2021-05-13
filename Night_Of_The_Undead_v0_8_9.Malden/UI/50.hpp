class GUI50 {
   idd = 50;
   name = "50";
   onload = "uiNamespace setVariable ['Overlay', _this select 0]";
   duration = 99999;
   fadeout=0;
   fadein=0;
   class controlsBackground
   {
   };
   class controls
   {
	   class RscStructuredText0
       {
           idc = 1;
           type = 0;
           style = 0;
           x = 0.02 * safezoneW + safezoneX;
           y = 0.65 * safezoneH + safezoneY;
           h = 0.15 * safezoneH;
           w = 0.3 * safezoneW;
           font = "EtelkaNarrowMediumPro";
           sizeex = 0.1;
           colorbackground[] = {0,0,0,0};
           colortext[] = {1,1,1};
           text = "";
       };
       class RscStructuredText1
       {
           idc = 2;
		   type = 0;
           style = 0;
           x = 0.03 * safezoneW + safezoneX;
           y = 0.65 * safezoneH + safezoneY;
           h = 0.2 * safezoneH;
           w = 0.8 * safezoneW;
           font = "EtelkaNarrowMediumPro";
           sizeex = 0.05;
           colorbackground[] = {0,0,0,0};
           colortext[] = {1,1,1};
           text = "";
       };
   };
};