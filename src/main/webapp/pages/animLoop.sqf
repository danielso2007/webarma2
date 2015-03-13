_unit = _this select 0;
_animation = _this select 1;
_noWeapons = _this select 2;
_switchMove = _this select 3;
_allowDamage = _this select 4;

_unit disableAI "ANIM";
//_unit allowDamage _allowDamage;
//_unit setDamage 0;
_unit setVariable ["BIS_noCoreConversations", true];
if (_noWeapons) then {removeAllWeapons _unit};

sleep random 5;

if (_switchMove) then {
	while {true} do {
		_unit switchMove _animation;
		if (!alive _unit) exitWith {_unit enableAI "ANIM";_unit switchMove "";};
		waitUntil {!(animationState _unit == _animation)};
	};
} else {
	while {true} do {
		_unit playMove _animation;
		if (!alive _unit) exitWith {_unit enableAI "ANIM";_unit switchMove "";};
		waitUntil {!(animationState _unit == _animation)};
	};
};