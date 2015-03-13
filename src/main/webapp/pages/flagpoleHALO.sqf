haloed = true;
hintSilent "Click on the map where you'd like to HALO.";
onMapSingleClick "player setPos _pos; [player, 2000] exec 'ca\air2\halo\data\Scripts\HALO_init.sqs';haloed = false;hint 'Close the map and don''t forget to open your chute!'";
waitUntil{!haloed};
onMapSingleClick "";