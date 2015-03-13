// Grab a value for the suspect
_suspect = _this select 0;

// Remove all actions from the suspect
_action = _suspect addAction["foo", "foo.sqf"];
while {_action >= 0} do	{
	_suspect removeAction _action;
	_action = _action - 1;
};

// Stop the current animation and surrender
_suspect switchmove "";
_suspect playActionNow "Surrender";
sleep 3;

// Alert the soldier
hint "Voce envia o suspeito para investigacao.";

// "Teleport" the suspect to holdover, a GameLogic location pre-placed.
_suspect setPos getPos logic1;