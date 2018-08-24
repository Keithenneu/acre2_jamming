Just a simple script for adding a jammer to a mission.

If the receiving side is within the jamming area, the transmission quality will be reduced until its content is hard to understand. It will still be good enough to allow for communication using slow speaking, repition of messages, spelling alphabets, etc.

### Setup

Add the folder to your mission.

```
mymission.VR
> mission.sqm
> description.ext
> jamming
  > ...
  > files from this repository
  > ...
```

in `description.ext` add
```cpp
#include "jamming\config.cpp"
```

### Usage

#### Turn On

`bso_jamming_fnc_turnOn`

Turns on jamming, originating from a given point.
Must be executed on server.

Takes 3 arguments:
- Jamming source: Either a position (3D), or an object
- A range in meters for maximum jamming
- An additional range for gradually weaker jamming (smooth transition between full and no jamming)

Example
```sqf
// jammer is some antenna/device/object in the mission
// full jamming within 4km
// weaker jamming up to 6km
[position jammer, 4000, 2000] call bso_jamming_fnc_turnOn;
```
```sqf
// jammer is some movable object in the mission
[jammer, 500, 500] call bso_jamming_fnc_turnOn;
```
#### Turn Off

`bso_jamming_fnc_turnOff`

Turns jamming off.
Must be executed on server.

No arguments.

Example
```sqf
[] call bso_jamming_fnc_turnOff;
```


### License

Suppose it has to be GPL as it uses ACRE2 code. Bit ugly tho. Would rather have it MIT and copy the file dynamically.
Who the hell cares about a license for 10 lines of code anyway...
