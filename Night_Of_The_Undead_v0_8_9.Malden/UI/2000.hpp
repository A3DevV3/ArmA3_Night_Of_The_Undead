class GUI2000 {
   idd = 2000;
   name = "GUI2000";
   onload = "uiNamespace setVariable ['Overlay', _this select 0]";
   duration = 99999;
   fadeout=0;
   fadein=0;
   class controlsBackground
   {
   };
   class controls
   {
       class RscStructuredText1
       {
           idc = 21;
           type = 0;
           style = 0;
           x = 0.45 * safezoneW + safezoneX;
           y = 0.2 * safezoneH + safezoneY;
           h = 0.2 * safezoneH;
           w = 0.1 * safezoneW;
           font = "EtelkaNarrowMediumPro";
           sizeex = 0.1;
           colorbackground[] = {0,0,0,0};
           colortext[] = {1,1,1};
           text = "Game Over";
       };
   };
};
