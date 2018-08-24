if (!hasInterface) exitWith { false };

params ["_source", "_rangefull", "_gradientdistance"];

bso_jamming_source = _source;
bso_jamming_range_full = _rangefull;
bso_jamming_gradient_distance = _gradientdistance;
[compile preprocessFile "jamming\fnc_customSignal.sqf"] call acre_api_fnc_setCustomSignalFunc;
