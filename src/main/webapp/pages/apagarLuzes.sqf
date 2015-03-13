// NOMES DAS CIDADES OU GAME LOGIC.
_types = ["Land_PowLines_WoodL", "Land_PowLines_ConcL", "Land_lampa_ind_zebr", "Land_lampa_sidl_3", "Land_lampa_vysoka", "Land_lampa_ind", "Land_lampa_ind_b", "Land_lampa_sidl"];
_fim = 0;
while {_fim == 0} do
{
     // power1 and power2 were two objects I placed. EXEMPLO PARA ESPERAR A DESTRUIÇÃO DE DOIS GERADORES.
	//waituntil{!alive power1 and !alive power2};

	// delete the light over the generators. DELETANDO UM OBJETO QUE NO EXEMPLO ERA UMA LUZ NOS GERADORES.
	//deletevehicle obsLight;

	for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
	{
                // powercoverage is a marker I placed.
		_lamps = getmarkerpos "powercoverage" nearObjects [_types select _i, 1200];
		//hintsilent format ["%1",_lamps];
		sleep 1;
		{_x switchLight "OFF";} forEach _lamps;
	};
	
	_fim = 1;
};