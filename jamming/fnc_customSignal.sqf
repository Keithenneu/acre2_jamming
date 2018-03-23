/* bso_jamming_location = _location;
 *  bso_jamming_range_full = _rangefull;
 * bso_jamming_gradient_distance = _gradientdistance;
 */
 
 /*
 * Arguments:
 * 0: Frequency <NUMBER>
 * 1: Power <NUMBER>
 * 2: Receiving Radio ID <STRING>
 * 3: Transmitting Radio ID <STRING>
 *
 * Return Value:
 * Tuple of power and maximum signal strength <ARRAY>
 *
 * Example:
 * [30, 5000, "ACRE_PRC343_ID_1", "ACRE_PRC343_ID_2"] call acre_sys_signal_fnc_getSignal
 *
 * Public: No
 */
 
#define JAMMING_LEVEL 0.18

params ["_freq", "_pwr", "_rx", "_tx"];

private _receiverPos = [_rx] call acre_sys_radio_fnc_getRadioPos;
private _distance = bso_jamming_location distance _receiverPos;

private _realRadioRx = [_rx] call acre_sys_radio_fnc_getRadioBaseClassname;
private _min = getNumber (configFile >> "CfgAcreComponents" >> _realRadioRx >> "sensitivityMin");
private _max = getNumber (configFile >> "CfgAcreComponents" >> _realRadioRx >> "sensitivityMax");

private _maxJamSignal = _min + (_max - _min) * JAMMING_LEVEL;

if (_distance <= bso_jamming_range_full) exitWith
{
    [JAMMING_LEVEL, _maxJamSignal]
};

private _acreResult = _this call bso_jamming_fnc_acreSignal;

private _px = _acreResult select 0;
private _maxSignal = _acreResult select 1;

if (_maxSignal < _maxJamSignal) exitWith { _acreResult };

if (_distance > bso_jamming_range_full + bso_jamming_gradient_distance) exitWith {_acreResult};

private _impact = (bso_jamming_range_full + bso_jamming_gradient_distance - _distance) / bso_jamming_gradient_distance;
_impact = (_impact min 1.0) max 0.0;

private _maxJamSignal = _min + (_max - _min) * JAMMING_LEVEL;
private _signal = _impact * _maxJamSignal + (1 - _impact) * _maxSignal;
_px = _impact * JAMMING_LEVEL + (1 - _impact) * _px;

[_px, _signal];