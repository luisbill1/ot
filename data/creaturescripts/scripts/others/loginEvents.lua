function onLogin(player)

	local events = {
	"ParasiteWarzone",
	"ElementalSpheresOverlords",
	"BigfootBurdenVersperoth",
	"BigfootBurdenWiggler",
	"SvargrondArenaKill",
	"NewFrontierShardOfCorruption",
	"NewFrontierTirecz",
	"ServiceOfYalaharDiseasedTrio",
	"ServiceOfYalaharAzerus",
	"ServiceOfYalaharQuaraLeaders",
	"InquisitionBosses",
	"InquisitionUngreez",
	"KillingInTheNameOfKills",
	"KillingInTheNameOfKillss",
	"KillingInTheNameOfKillsss",
	"SecretServiceBlackKnight",
	"ThievesGuildNomad",
	"WotELizardMagistratus",
	"WotELizardNoble",
	"WotEKeeper",
	"WotEBosses",
	"WotEZalamon",
	"PlayerDeath",
	"AdvanceSave",
	"bossesWarzone",
	"AdvanceRookgaard",
	"PythiusTheRotten",
	"DropLoot",
	"Yielothax",
	"BossParticipation",
	"Energized Raging Mage",
	"Raging Mage",
	"lowerRoshamuul",
	"petlogin",
	"petthink",
	"UpperSpikeKill",
	"MiddleSpikeKill",
	"LowerSpikeKill",
	"BossesForgotten",
	"ReplicaServants",
	"EnergyPrismDeath",
	"AstralPower",
	"BossesKill",
	"TheShattererKill",
	"BossesHero",
	"Kill Dragon",
	"Somewhat Beatable Death",
	"deeplingBosses",
	"theGreatDragonHuntKill",
	"bossesMissionCults",
	"bragrumol_kill",
	"mozradek_kill",
	"xogixath_kill",
	"CultoFafnar",
	"BestiaryOnKill"
}
	
	for i = 1, #events do
		player:registerEvent(events[i])
	end
return true
end
