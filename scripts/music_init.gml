///initializing music at the beginning of the game
globalvar sndDeath,sndDJump,sndJump,sndShoot;
globalvar bgmBoss;
//BGM_Ad = FMODSoundAdd(global.music_directory + 'base.ogg',0,0);
sndDeath = FMODSoundAdd(global.music_directory + 'sndDeath.wav',0,0);
sndDJump = FMODSoundAdd(global.music_directory + 'sndDJump.wav',0,0);
sndJump = FMODSoundAdd(global.music_directory + 'sndJump.wav',0,0);
sndShoot = FMODSoundAdd(global.music_directory + 'sndShoot.wav',0,0);

//FMODSoundSetMaxVolume(BGM_Ad,1)
FMODSoundSetMaxVolume(sndDeath,1)
FMODSoundSetMaxVolume(sndDJump,1)
FMODSoundSetMaxVolume(sndJump,1)
FMODSoundSetMaxVolume(sndShoot,1)
