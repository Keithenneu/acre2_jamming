class CfgFunctions
{
    class bso_jamming
    {
        class internal
        {
            class acreSignal
            {
                file = "jamming\fnc_getSignal.sqf";
            };
            
            class turnOnClient
            {
                file = "jamming\fnc_turnOnClient.sqf";
            };
        };
        
        class public
        {
            class turnOn
            {
                file = "jamming\fnc_turnOn.sqf";
            };
            
            class turnOff
            {
                file = "jamming\fnc_turnOff.sqf";
            };
        };
    };
};