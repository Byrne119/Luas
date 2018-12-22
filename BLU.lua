--[[                                                                                                     
88888888ba   88                               88b           d88                                       
88      "8b  88                               888b         d888                                       
88      ,8P  88                               88`8b       d8'88                                       
88aaaaaa8P'  88  88       88   ,adPPYba,      88 `8b     d8' 88  ,adPPYYba,   ,adPPYb,d8   ,adPPYba,  
88""""""8b,  88  88       88  a8P_____88      88  `8b   d8'  88  ""     `Y8  a8"    `Y88  a8P_____88  
88      `8b  88  88       88  8PP"""""""      88   `8b d8'   88  ,adPPPPP88  8b       88  8PP"""""""  
88      a8P  88  "8a,   ,a88  "8b,   ,aa      88    `888'    88  88,    ,88  "8a,   ,d88  "8b,   ,aa  
88888888P"   88   `"YbbdP'Y8   `"Ybbd8"'      88     `8'     88  `"8bbdP"Y8   `"YbbdP"Y8   `"Ybbd8"'  
                                                                              aa,    ,88              
                                                                               "Y8bbdP"               
																			   
]]
windower.add_to_chat(123,[[BLU Lua Author: Kuroganashi; modified by Byrne(Asura)]])
windower.add_to_chat(160,[[Feel free to DM me if you have any questions or suggestions for this file.]])
function get_sets()
	mote_include_version = 2
    
    -- Load and initialize the include file.
	include('Mote-Include.lua')
end

--================================================--
--                                                --
--      |     |        ,---.     |                --
--      |,---.|---.    `---.,---.|--- .   .,---.  --
--      ||   ||   |        ||---'|    |   ||   |  --
--  `---'`---'`---'    `---'`---'`---'`---'|---'  --
--                                         |      --
--                                                --
--================================================--

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
state.Buff.Doomed = buffactive.doomed or false
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
	  playermoving  = M(false, "moving")
    include('Mote-TreasureHunter')
	
	
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false


    blue_magic_maps = {}
    
    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods.
    
    -- Physical Spells --
    
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Battle Dance','Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
        'Uppercut','Vertical Cleave'
    }
        
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault',
        'Vanity Dive'
    }
        
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum','Sprout Smack','Saurian Slide','Sweeping Gouge','Sub-zero Smash'
    }
        
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream',
        'Pinecone Bomb','Spiral Spin','Wild Oats'
    }

    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite','Queasyshroom'
    }

    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }

    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical Spells --

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Embalming Earth','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Spectral Floe','Subduction','Tem. Upheaval','Water Bomb'
    }

	  --Tenebral Crush
	  blue_magic_maps.TenebralCrush = S{'Tenebral Crush'}
	
    -- Magical spells with a primary Mnd mod
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Nectarous Deluge','Magic Hammer','Mind Blast','Scouring Spate'
    }

    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }

    -- Magical spells with a Vit stat mod (on top of Int)
    blue_magic_maps.MagicalVit = S{
        'Atra. Libations','Entomb','Thermal Pulse'
    }

	  --Magical spells with a AGI Stat Mod.
	  blue_magic_maps.MagicalAgi = S{
        'Molting Plumage','Palling Salvo','Silent Storm'
    }
	
	  --Magical spells with a STR Stat Mod.
	  blue_magic_maps.MagicalStr = S{
        'Blinding Fulgor','Searing Tempest'
    }
	
    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Anvil Lightning','Charged Whisker','Gates of Hades'
    }
            
    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'
    }
        
    -- Breath-based spells
    blue_magic_maps.Breath = S{
        'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'
    }

    -- Stun spells
    blue_magic_maps.Stun = S{
        'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
        'Thunderbolt','Whirl of Rage'
    }
        
    -- Healing spells
    blue_magic_maps.Healing = S{
        'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind',
        'Wild Carrot'
    }
    
    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{
        'Barrier Tusk','Diamondhide','Magic Barrier','Mighty Guard','Metallic Body','Plasma Charge',
        'Pyric Bulwark','Reactor Cool',
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Mighty Guard','Nat. Meditation','Occultation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
        'Zephyr Mantle'
    }
    
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve','Cruel Joke','Cesspool',
        'Crashing Thunder','Droning Whirlwind','Gates of Hades','Harden Shell','Mighty Guard','Polar Roar',
        'Pyric Bulwark','Tearing Gust','Thunderbolt','Tourbillion','Uproot'
    }
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

--====================================================--
--	                                                  --
--	.   .                   ,---.     |               --
--	|   |,---.,---.,---.    `---.,---.|--- .   .,---. --
--	|   |`---.|---'|            ||---'|    |   ||   | --
--	`---'`---'`---'`        `---'`---'`---'`---'|---' --
--	                                            |     --
--                                                    --
--====================================================--

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    
	state.OffenseMode:options('Normal', 'Crit', 'Solo', 'Safe', 'DT')
	state.IdleMode:options('Normal', 'Refresh', 'PDT', 'Cleaving')
	state.WeaponLockMode = M('Unlocked','Locked')
	state.DoomMode = M('OFF', 'Doom')
	state.ZoneRing = M('None','Warp', 'Holla', 'Dem', 'Mea')


	--default starting commands
	send_command('input //gs equip sets.default_melee_weapons;wait 0.2;gs c set WeaponLockMode Locked')
	
    -- Additional local binds
	
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind f12 gs c cycle WeaponLockMode')
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind f11 gs c set IdleMode PDT; gs c set OffenseMode Solo')
	send_command('bind ^f11 gs c set IdleMode Normal; gs c set OffenseMode Normal')
	send_command('bind f6 gs c set OffenseMode Normal')
	send_command('bind f7 gs c set OffenseMode Solo')
	send_command('bind f8 gs c set WeaponLockMode Unlocked;wait 0.2;input //gs equip sets.default_melee_weapons;wait 0.2;gs c set WeaponLockMode Locked')
	send_command('bind f5 gs c cycle ZoneRing')
	send_command('bind ^f9 gs c cycle TreasureMode')
	
	select_default_macro_book()
	set_lockstyle()
	
end

--=================================--
--  _  _ _  _ _    ____ ____ ___   --
--  |  | |\ | |    |  | |__| |  \  --
--  |__| | \| |___ |__| |  | |__/  --
--                                 --
--=================================--

function user_unload()

	send_command('unbind ^f9')
	send_command('unbind ^f10')
	send_command('unbind ^f11')
	send_command('unbind ^f12')
	send_command('unbind f8')
       
	send_command('unbind !f9')
	send_command('unbind !f10')
	send_command('unbind !f11')
	send_command('unbind !f12')

	send_command('unbind f9')
	send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')
	send_command('unbind f5')

	send_command('unbind -')
	send_command('unbind =')
		
end


--=============================================--
--                                             --
--   ..|'''.|  '||''''|      |     '||''|.     --
--  .|'     '   ||  .       |||     ||   ||    --
--  ||    ....  ||''|      |  ||    ||''|'     --
--  '|.    ||   ||        .''''|.   ||   |.    --
--   ''|...'|  .||.....| .|.  .||. .||.  '|'   --
--                                             --
--=============================================--

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	sets.buff['Burst Affinity'] = {}
	sets.buff['Chain Affinity'] = {}
	sets.buff.Convergence = {}
	sets.buff.Diffusion = {}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {}

--==================================================--
--  ____                                       _    --
-- |  _ \   _ __    ___    ___    __ _   ___  | |_  --
-- | |_) | | '__|  / _ \  / __|  / _` | / __| | __| --
-- |  __/  | |    |  __/ | (__  | (_| | \__ \ | |_  --
-- |_|     |_|     \___|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--

	sets.precast.JA['Azure Lore'] = {}

	sets.precast.JA['Provoke'] = {}

	sets.enmity = {}

	sets.precast.Waltz = {}
		
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}


	sets.precast.FC = {}
		
	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
   

   
   
--===============================================================================--		
-- __        __                                               _      _   _   _   --
-- \ \      / /   ___    __ _   _ __     ___    _ __    ___  | | __ (_) | | | |  --
--  \ \ /\ / /   / _ \  / _` | | '_ \   / _ \  | '_ \  / __| | |/ / | | | | | |  --
--   \ V  V /   |  __/ | (_| | | |_) | | (_) | | | | | \__ \ |   <  | | | | | |  --
--    \_/\_/     \___|  \__,_| | .__/   \___/  |_| |_| |___/ |_|\_\ |_| |_| |_|  --
--                             |_|                                               --
--                                                                               --
--===============================================================================--


   
	sets.precast.WS = {}

	sets.precast.WS['Requiescat'] = {}

	sets.precast.WS['Expiacion'] = {}

	sets.precast.WS['Savage Blade'] = {}

	sets.precast.WS['Chant du Cygne'] = {}

	sets.precast.WS['Vorpal Blade'] = {}

	sets.precast.WS['Sanguine Blade'] = {}


	--[[Club Weaponskill]]


	sets.precast.WS['Realmrazer'] = {}

	sets.precast.WS['Black Halo'] = {}

	sets.precast.WS['Flash Nova'] = {}

	sets.precast.WS['True Strike'] = {}
	
	
--==================================================--
--   __  __   _       _                        _    --
--  |  \/  | (_)     | |                      | |   --
--  | \  / |  _    __| |   ___    __ _   ___  | |_  --
--  | |\/| | | |  / _` |  / __|  / _` | / __| | __| --
--  | |  | | | | | (_| | | (__  | (_| | \__ \ | |_  --
--  |_|  |_| |_|  \__,_|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--


	sets.midcast['Blue Magic'] = {}

	--[[PHYSICAL SPELLS]]

	sets.midcast['Blue Magic'].Physical = {}


	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, 
		{})


	--[[MAGICAL SPELLS]]

	sets.midcast['Blue Magic'].Magical = {}


	sets.midcast['Blue Magic'].MagicalInt = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, 
		{})

	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].MagicalAgi = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].MagicalStr = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, 
		{})

	sets.midcast['Blue Magic'].TenebralCrush = {}
		
		
	sets.midcast['Blue Magic'].MagicAccuracy = {}


	sets.midcast['Blue Magic'].Breath = {}


	sets.midcast['Blue Magic'].Stun = {}
		
		
	sets.midcast['Blue Magic']['White Wind'] = {}


	sets.midcast['Blue Magic'].Healing = {}


	sets.midcast['Blue Magic'].SkillBasedBuff = {}


	sets.midcast['Blue Magic'].Buff = {}


	sets.midcast['Phalanx'] = {}



--=================================--
--      ___       _   _            --
--     |_ _|   __| | | |   ___     --
--      | |   / _` | | |  / _ \    --
--      | |  | (_| | | | |  __/    --
--     |___|  \__,_| |_|  \___|    --
--                                 --
--=================================--
    

	sets.idle = {}


	sets.idle.Refresh = {}


	sets.idle.PDT = {}


	sets.idle.Cleaving = {}


--====================================================--
--     _____   ____      ____           _             --
--    |_   _| |  _ \    / ___|    ___  | |_   ___     --
--      | |   | |_) |   \___ \   / _ \ | __| / __|    --
--      | |   |  __/     ___) | |  __/ | |_  \__ \    --
--      |_|   |_|       |____/   \___|  \__| |___/    --
--                                                    --
--====================================================--
    
	sets.default_melee_weapons = {}


	sets.engaged = {}


	sets.engaged.Haste_30 = {}
	--Reiki Yotai


	sets.engaged.Crit = {}


	sets.engaged.Solo = {}


	sets.engaged.Safe = {}


	sets.engaged.DT = {}
	

--------------------------------------------------------------------------------------------------------	
---- _____    ____    _   _   _____    _____   _______   _____    ____    _   _              _      ----
--  / ____|  / __ \  | \ | | |  __ \  |_   _| |__   __| |_   _|  / __ \  | \ | |     /\     | |       --
-- | |      | |  | | |  \| | | |  | |   | |      | |      | |   | |  | | |  \| |    /  \    | |       --
-- | |      | |  | | | . ` | | |  | |   | |      | |      | |   | |  | | | . ` |   / /\ \   | |       --
-- | |____  | |__| | | |\  | | |__| |  _| |_     | |     _| |_  | |__| | | |\  |  / ____ \  | |____   --
--  \_____|  \____/  |_| \_| |_____/  |_____|    |_|    |_____|  \____/  |_| \_| /_/    \_\ |______|  --
----																								----
--------------------------------------------------------------------------------------------------------

	sets.TreasureHunter = {}


	--For alternate earring to moonshade at 3000TP
	sets.MaxTP = {}


	--Movement speed inside Adoulin (handled automatically)
	sets.Adoulin = {body="Councilor's Garb",}


	--Movement speed outside Adoulin (handled automatically)
	sets.MoveSpeed = {}


	--Fucho-no-Obi
	sets.latent_refresh = {}


	--Store TP gear for Aftermath Up
	sets.engaged.Aftermath3 = set_combine(sets.engaged, {})


	--Store TP gear; swap windbuffet for Yotai, Adhemar Jacket +1 for Herc Vest +4TA for Store TP,  Store TP ambu cape.
	sets.engaged.AM3HasteCap = {}


	sets.self_healing = set_combine(sets.midcast['Blue Magic'].Healing, {})


	sets.WeatherObi = {}


	sets.Doom = {}
	
	
end


--======================================================================--
--    __  __                                                     _      --
--   |  \/  |   ___   __   __   ___   _ __ ___     ___   _ __   | |_    --
--   | |\/| |  / _ \  \ \ / /  / _ \ | '_ ` _ \   / _ \ | '_ \  | __|   --
--   | |  | | | (_) |  \ V /  |  __/ | | | | | | |  __/ | | | | | |_    --
--   |_|  |_|  \___/    \_/    \___| |_| |_| |_|  \___| |_| |_|  \__|   --
--                                                                      --
--======================================================================--



mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end


moving = false
windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;
    if mov.counter>15 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x then
            dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
            if dist > 1 and not moving then
                playermoving.value = true
                send_command('gs c update')
				if world.area:contains("Adoulin") then
                send_command('gs equip sets.Adoulin')
				else
                send_command('gs equip sets.MoveSpeed')
                end

                moving = true

            elseif dist < 1 and moving then
                playermoving.value = false
                send_command('gs c update')
                moving = false
            end
        end
        if pl and pl.x then
            mov.x = pl.x
            mov.y = pl.y
            mov.z = pl.z
        end
        mov.counter = 0
    end
end)



--=================================================================--
--  _____                          _     _                         --
-- |  ___|  _   _   _ __     ___  | |_  (_)   ___    _ __    ___   --
-- | |_    | | | | | '_ \   / __| | __| | |  / _ \  | '_ \  / __|  --
-- |  _|   | |_| | | | | | | (__  | |_  | | | (_) | | | | | \__ \  --
-- |_|      \__,_| |_| |_|  \___|  \__| |_|  \___/  |_| |_| |___/  --
--                                                                 --
--=================================================================--


function job_precast(spell, action, spellMap, eventArgs)

    if unbridled_spells:contains(spell.english) and not state.Buff['Unbridled Learning'] then
        eventArgs.cancel = true
        windower.send_command('@input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
    end
	
end




function job_post_precast(spell, action, spellMap, eventArgs)

	if player.tp > 2750 then
		equip(sets.MaxTP)	
	end
	
	if spell.skill == 'Blue Magic' then
		equip(set_combine(sets.precast.FC['Blue Magic'], sets.precast.FC['Blue Magic']))
	end
	
end




function job_post_midcast(spell, action, spellMap, eventArgs)

    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
		
		if spellMap == 'Healing' and spell.target.type == 'SELF' then
            equip(sets.self_healing)
		end
	
    end
	
	if spell.skill == 'Blue Magic'  then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.WeatherObi)

        end
    end

end





function job_aftercast(spell, action, spellMap, eventArgs)

	if state.DoomMode.value == 'Doom' then
		send_command('input /party IS STILL DOOMED! AM SCAREBOYE PLES HALP!! <scall15>')
	end

	if not spell.interrupted then
       if spell.english == "Dream Flower" then -- Sleep Countdown --
            send_command('wait 60;input /echo DREAM FLOWER: [WEARING OFF IN 30 SEC.];wait 15;input /echo DREAM FLOWER: [WEARING OFF IN 15 SEC.];wait 10;input /echo DREAM FLOWER: [WEARING OFF IN 5 SEC.]')
        elseif spell.english == "Entomb" then -- Petrify Countdown --
            send_command('wait 30;input /echo ENTOMB: [WEARING OFF IN 30 SEC.];wait 15;input /echo ENTOMB: [WEARING OFF IN 15 SEC.];wait 10;input /echo ENTOMB: [WEARING OFF IN 5 SEC.]')        
        elseif spell.english == "Tenebral Crush" then -- Defense Down Countdown --
			send_command('wait 30;input /echo Defense Down wearing off (maybe?) in [30 seconds];wait 15;input /echo Defense Down wearing off (maybe?) [15 seconds];wait 10;input /echo Defense Down wearing off (maybe?) [5 seconds]')
		elseif spell.english == "Nat. Meditation" then -- Attack up Countdown Countdown --
			send_command('wait 60;input /echo Nat. Meditation RECAST!!! [30 Sec.];wait 15;input /echo Nat. Meditation RECAST!!! [15 Sec.];wait 10;input /echo Nat. Meditation RECAST!!! [5 Sec.]')	
		end
    end
	
end




function customize_idle_set(idleSet)

    if player.mpp < 51 then
        set_combine(idleSet, sets.latent_refresh)
    end
	
	if state.ZoneRing.value == 'Warp' then
		idleSet = set_combine(idleSet, {right_ring="Warp Ring"})
	elseif state.ZoneRing.value == 'Holla' then
		idleSet = set_combine(idleSet, {right_ring="Dimensional ring (Holla)"})
	elseif state.ZoneRing.value == 'Dem' then
		idleSet = set_combine(idleSet, {right_ring="Dimensional ring (Dem)"})
	elseif state.ZoneRing.value == 'Mea' then
		idleSet = set_combine(idleSet, {right_ring="Dimensional ring (Mea)"})	
		return idleSet
	end
	
    return idleSet
	
end




function job_buff_change(buff, gain)

	if (buff and gain) or (buff and not gain) then
		send_command('gs c update')
	end
	
	if buff == "doom" and gain then
			send_command('gs c set DoomMode Doom')
	elseif buff == "doom" and not gain then
			send_command('gs c set DoomMode OFF')
	end

end




function job_state_change(stateField, newValue, oldValue)

	send_command('gs c update')

	if state.WeaponLockMode.value == newValue and newValue == 'Locked' then
		disable('main','sub','range')
	elseif state.WeaponLockMode.value == newValue and newValue == 'Unlocked' then
		enable('main','sub','range')
	end
	
	if state.DoomMode.value == 'Doom' then
		send_command("input /party I'm DOOOOOMED, HAAAAAALP! <scall15>")
	elseif state.DoomMode.value ==  newValue and newValue == 'OFF' then
		send_command('input /party Doom is off! THENKS BUD :D <scall11>')
	end

end

windower.register_event('zone change', function()

	send_command('gs c set ZoneRing None')
	
end)
	
function customize_melee_set(meleeSet)

	if player.equipment.main == 'Tizona' and (buffactive['Aftermath: Lv.3'] and (buffactive['Embrava'] or buffactive['March'] or buffactive[580] or buffactive['Mighty Guard'])) then
		meleeSet = set_combine(meleeSet, sets.engaged.Aftermath3, sets.engaged.AM3HasteCap)
	elseif player.equipment.main == 'Tizona' and buffactive['Aftermath: Lv.3'] and not (buffactive['Embrava'] or buffactive['March'] or buffactive[580] or buffactive['Mighty Guard']) then
		meleeSet = set_combine(meleeSet, sets.engaged.Aftermath3)
	end

    if not ((buffactive['Embrava'] or buffactive['March'] or buffactive[580] or buffactive['Mighty Guard']) and 
	(state.OffenseMode.value == 'Normal' or state.OffenseMode.value == 'Crit' or state.OffenseMode.value == 'Solo')) then
        meleeSet = set_combine(meleeSet, sets.engaged.Haste_30)
    end
	
	if buffactive['Doom'] then
        meleeSet = set_combine(meleeSet, sets.Doom)
    end
	
	if not buffactive['Shell'] and (state.OffenseMode.value == 'Solo') then
		meleeSet = set_combine(meleeSet, sets.engaged.Safe)
	end
	
	if state.ZoneRing.value == 'Warp' then
		meleeSet = set_combine(meleeSet, {right_ring="Warp Ring"})
	elseif state.ZoneRing.value == 'Holla' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Holla)"})
	elseif state.ZoneRing.value == 'Dem' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Dem)"})
	elseif state.ZoneRing.value == 'Mea' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Mea)"})	
		return meleeSet
	end
	
	return meleeSet
	
end

	
	
	
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
    end
end



--=-----------------------------=--
--          __   __   __   __    --
--    /|/| /  | /    /  | /  |   --
--   ( / |(___|(    (___|(   |   --
--   |   )|   )|   )|\   |   )   --
--   |  / |  / |__/ | \  |__/    --
--=-----------------------------=--

function select_default_macro_book()
    -- Default macro set/book
	
	if player.sub_job == 'WAR' then
        set_macro_page(3, 7)
	elseif player.sub_job ~= 'WAR' then
		set_macro_page(3, 7)
	end
	
end


function set_lockstyle()

    send_command('wait 2; input /lockstyleset 004')

end
