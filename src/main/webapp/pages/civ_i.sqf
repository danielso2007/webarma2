// grab a value for the suspect and check for guilt flag
_suspect = _this select 0;
_bomber = (_this select 3) select 0;

// Remove all actions from the suspect
_action = _suspect addAction["foo", "foo.sqf"];
while {_action >= 0} do	{
	_suspect removeAction _action;
	_action = _action - 1;
};

// Quick animation, I really need to find a better Action for this, talking or something.
_suspect playAction "gestureNod";
sleep 3;

// If he's NOT the bomber, just quit.
if (!_bomber) exitwith {hint "Você percebe que esse cara é de nenhuma utilidade para você."};

// He is the bomber, so lets get all up in ur bidness!
// This animation is a little long, but definitely looks like someone over explaining something.
_suspect playAction "SceneCommanderTalk";
sleep 5;

// Add an action to the suspect to arrest him
hint "Esse cara é, obviamente, tem algo ... Prendam-no!";
_suspect addAction ["Arrest","civ_a.sqf"];