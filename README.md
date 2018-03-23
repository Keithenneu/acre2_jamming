Just a simple script for adding a jammer to a mission

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
#include "jamming\config.cpp
```

### Usage

#### Turn On

`bso_jamming_fnc_turnOn`

Turns on jamming, originating from a given point.
Must be executed on server.

Takes 3 arguments:
- A position (3D)
- A range in meters for maximum jamming
- An additional range for gradually weaker jamming (smooth transition between full and no jamming)

Example
```sqf
// jammer is some antenna/device/object in the mission
[position jammer, 100, 100] call bso_jamming_fnc_turnOn;
```

#### Turn On

`bso_jamming_fnc_turnOff`

Turns jamming off.
Must be executed on server.

No arguments.

Example
```sqf
[] call bso_jamming_fnc_turnOff;
```
