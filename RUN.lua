--[[

8888888b.                                 8888888888                                             
888   Y88b                                888                                                    
888    888                                888                                                    
888   d88P 888  888 88888b.   .d88b.      8888888     .d88b.  88888b.   .d8888b  .d88b.  888d888 
8888888P"  888  888 888 "88b d8P  Y8b     888        d8P  Y8b 888 "88b d88P"    d8P  Y8b 888P"   
888 T88b   888  888 888  888 88888888     888        88888888 888  888 888      88888888 888     
888  T88b  Y88b 888 888  888 Y8b.         888        Y8b.     888  888 Y88b.    Y8b.     888     
888   T88b  "Y88888 888  888  "Y8888      888         "Y8888  888  888  "Y8888P  "Y8888  888     
                                                                                                 
                                                                                                 
]]
windower.add_to_chat(123,[[RUN Lua Author: Byrne #7894 (Discord); Byrne(Asura); Archiie (Legend support and debugging)]])
windower.add_to_chat(160,[[Movement speed by default will not equip when engaged, Press F1 to handle auto-kiting while engaged.]])

-- Initialization function for this job file.
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
--================================================--
function job_setup()
	setupTextWindow(1400, 600)
	state.Moving = M('false', 'true')
end

--====================================================--
--	                                                  --
--	.   .                   ,---.     |               --
--	|   |,---.,---.,---.    `---.,---.|--- .   .,---. --
--	|   |`---.|---'|            ||---'|    |   ||   | --
--	`---'`---'`---'`        `---'`---'`---'`---'|---' --
--	                                            |     --
--                                                    --
--====================================================--

function user_setup()
	state.OffenseMode:options('Normal','DTmeva','TH','HybridDPS')
	state.IdleMode:options('Normal','Tanking')
	state.WeaponLockMode = M('Unlocked','Locked')
	state.DoomMode = M('OFF', 'Doom')
	state.ZoneRing = M('None','Warp', 'Holla', 'Dem', 'Mea')
	state.EngagedMoving = M('Disabled','Enabled')

	send_command('gs c set IdleMode Tanking; gs c set OffenseMode DTmeva')
	send_command('bind f1 gs c cycle EngagedMoving')
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind f12 gs c cycle WeaponLockMode')
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind f11 gs c set IdleMode Tanking; gs c set OffenseMode DTmeva')
	send_command('bind ^f11 gs c set IdleMode Normal; gs c set OffenseMode Normal')
	send_command('bind f7 gs c set OffenseMode Normal')
	send_command('bind f8 gs c set OffenseMode HybridDPS')
	send_command('bind f5 gs c cycle ZoneRing')
	
	
	select_default_macro_book()
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

	send_command('unbind !f9')
	send_command('unbind !f10')
	send_command('unbind !f11')
	send_command('unbind !f12')

	send_command('unbind f9')
	send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')
	send_command('unbind f5')
	send_command('unbind f1')
		
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

	sets.Enmity = {}
		
	sets.EnmityMax = set_combine(sets.Enmity, {})

--=================================--
--      ___       _   _            --
--     |_ _|   __| | | |   ___     --
--      | |   / _` | | |  / _ \    --
--      | |  | (_| | | | |  __/    --
--     |___|  \__,_| |_|  \___|    --
--=================================--

	sets.idle = {}
		
	sets.idle.Tanking = {}		
		
	--[[In this lua MDT will be handled automatically dependent upon whether you 
	currently have Shell or not to help ensure you are at capped MDT.  This set
	will not be toggleable, and instead will automatically swap in when shell either
	wears off, or is dispelled from you.  Please ensure this set has as much MDT and
	magic evasion as possible without sacrificing too much HP.]]

	sets.idle.MDT = {}
		
	sets.idle.Doom = {}
		
	sets.latent_refresh = {}
		
--====================================================--
--     _____   ____      ____           _             --
--    |_   _| |  _ \    / ___|    ___  | |_   ___     --
--      | |   | |_) |   \___ \   / _ \ | __| / __|    --
--      | |   |  __/     ___) | |  __/ | |_  \__ \    --
--      |_|   |_|       |____/   \___|  \__| |___/    --
--====================================================--

	sets.engaged = {}

	sets.engaged.TH = set_combine(sets.DTmeva, {})

	--[[In this lua MDT will be handled automatically dependent upon whether you 
	currently have Shell or not to help ensure you are at capped MDT.  This set
	will not be toggleable, and instead will automatically swap in when shell either
	wears off, or is dispelled from you.  Please ensure this set has as much MDT and
	magic evasion as possible without sacrificing too much HP.]]

	sets.engaged.MDT = {}

	--[[Generally speaking this set will be your go-to tanking as it is a hybrid set. 
	By default only THIS set will swap in MDT when shell is dropped, but if you copy
	it's functions around you can make it apply to whichever sets you may need.  If 
	you do not know how, simply contact Byrne (Asura) and I will help you if I
	have time]]

	sets.engaged.DTmeva = {}
		
	sets.engaged.HybridDPS = {}

	sets.engaged.repulse = {back="Repulse Mantle"}

	--movement speed gear inside adoulin--Councilor's Garb
	sets.Adoulin = {body="Councilor's Garb",}

	--movement speed outside adoulin, handled automatically; you can put whatever gear you want in here to pad out stats lost from equipping movement speed gear.
	sets.MoveSpeed = {}

	--Turms/Parry/Inquartata
	sets.Battuta = {}

	sets.Doom = {}
	
--===============================================================================--		
-- __        __                                               _      _   _   _   --
-- \ \      / /   ___    __ _   _ __     ___    _ __    ___  | | __ (_) | | | |  --
--  \ \ /\ / /   / _ \  / _` | | '_ \   / _ \  | '_ \  / __| | |/ / | | | | | |  --
--   \ V  V /   |  __/ | (_| | | |_) | | (_) | | | | | \__ \ |   <  | | | | | |  --
--    \_/\_/     \___|  \__,_| | .__/   \___/  |_| |_| |___/ |_|\_\ |_| |_| |_|  --
--                             |_|                                               --
--===============================================================================--


	sets.precast.WS['Resolution'] = {}

	sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'], {})

	sets.precast.WS['Dimidiation'] = {}

	sets.precast.WS['Ground Slash'] = {}
		
	sets.precast.WS['Ground Slash'].Acc = sets.precast.WS['Ground Slash']

	sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS['Dimidiation'].Normal, {})
		
	sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})

	sets.precast.WS['Herculean Slash'].Acc = set_combine(sets.precast.WS['Herculean Slash'].Normal, {})	
	
	
	
--==================================================--
--  ____                                       _    --
-- |  _ \   _ __    ___    ___    __ _   ___  | |_  --
-- | |_) | | '__|  / _ \  / __|  / _` | / __| | __| --
-- |  __/  | |    |  __/ | (__  | (_| | \__ \ | |_  --
-- |_|     |_|     \___|  \___|  \__,_| |___/  \__| --
--==================================================--

	-- Precast sets to enhance JAs
    
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity, {})

	sets.precast.JA['Valiance'] = set_combine(sets.Enmity, {})

	sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {})

	sets.precast.JA['Battuta'] = sets.Enmity

	sets.precast.JA['Liement'] = sets.Enmity

	sets.precast.JA['Elemental Sforzo'] = sets.Enmity

	sets.precast.JA['Swordplay'] = sets.Enmity

	sets.precast.JA['One for All'] = sets.Enmity

	sets.precast.JA['Provoke'] = sets.Enmity

	sets.precast.JA['Weapon Bash'] = sets.Enmity

	sets.precast.JA['Lux'] = {}

	sets.precast.JA['Tenebrae'] = {}

	sets.precast.JA['Lunge'] = {}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	sets.precast.JA['Gambit'] = {}

	sets.precast.JA['Rayke'] = {}
		
	sets.precast.JA['Embolden'] = {}

	sets.precast.JA['Vivacious Pulse'] = {}
		
		
	--[[ Fast cast sets for spells,  FC.Inspired is called when you have Fast Cast buff active from Inspiration, You can use this to get a
	Hybrid set that has more DT and HP while still capping Fast Cast depending on how many merits you have invested in it]]

	sets.precast.FC = {}
		
	sets.precast.FC.Inspired = {}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC['Utsusemi: Ichi'] = set_combine(sets.precast.FC, {})

	sets.precast.FC['Utsusemi: Ni'] = set_combine(sets.precast.FC['Utsusemi: Ichi'], {})



--==================================================--
--   __  __   _       _                        _    --
--  |  \/  | (_)     | |                      | |   --
--  | \  / |  _    __| |   ___    __ _   ___  | |_  --
--  | |\/| | | |  / _` |  / __|  / _` | / __| | __| --
--  | |  | | | | | (_| | | (__  | (_| | \__ \ | |_  --
--  |_|  |_| |_|  \__,_|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--


	sets.midcast.FastRecast = {}

	sets.midcast.Enhance = {}

	sets.midcast['Phalanx'] = 
		set_combine(sets.midcast.Enhance, {})

	--[[First SIRD set is intended for phalanx, and SIRD2 is for Aquaveil.  Some pieces have Phalanx and SIRD such as augmented Taeon,
		 while Aquaveil doesn't benefit from the +Phalanx and benefits more from straight SIRD]]

	sets.SIRD = {}

	sets.SIRD2 = {}
			
	sets.midcast['Regen'] = {}

	sets.midcast['Stoneskin'] = {}

	sets.midcast['Aquaveil'] = {}

	sets.midcast.Cure = {}

	sets.midcast['Refresh'] = 
		set_combine(sets.midcast.Enhance, {})

		
	sets.midcast.CurePot = {}
		
	sets.midcast.Cocoon = {}
		
	sets.midcast.OmenLowHP = {}
		
	end
	

--======================================================================--
--    __  __                                                     _      --
--   |  \/  |   ___   __   __   ___   _ __ ___     ___   _ __   | |_    --
--   | |\/| |  / _ \  \ \ / /  / _ \ | '_ ` _ \   / _ \ | '_ \  | __|   --
--   | |  | | | (_) |  \ V /  |  __/ | | | | | | |  __/ | | | | | |_    --
--   |_|  |_|  \___/    \_/    \___| |_| |_| |_|  \___| |_| |_|  \__|   --
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
        if pl and pl.x and mov.x and state.EngagedMoving.Value == 'Disabled' then
			--we want this to return a false value if these conditions were met, but we drew our weapons whilst moving.
			--we also want this value to become false if we Disable EngagedMovement while engaged.
			if state.Moving.value == 'true' and player.status == 'Engaged' then
				state.Moving.value = 'false'
			end
			if player.status ~= 'Engaged' then
				dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
				if dist > 1 and not moving then
					state.Moving.value = 'true'
					send_command('gs c update')
					if world.area:contains("Adoulin") then
						send_command('gs equip sets.Adoulin')
					else
						send_command('gs equip sets.MoveSpeed')
					end

					moving = true

				elseif dist < 1 and moving then
					state.Moving.value = 'false'
					send_command('gs c update')
					moving = false
				end
			end
        elseif pl and pl.x and mov.x and state.EngagedMoving.Value == 'Enabled' then
			dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
			if dist > 1 and not moving then
				state.Moving.value = 'true'
				send_command('gs c update')
				if world.area:contains("Adoulin") then
					send_command('gs equip sets.Adoulin')
				else
					send_command('gs equip sets.MoveSpeed')
				end

				moving = true

			elseif dist < 1 and moving then
				state.Moving.value = 'false'
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

windower.register_event('zone change', function()

	if state.ZoneRing.Value ~= 'None' then
		send_command('gs c set ZoneRing None')
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



function job_aftercast(spell, action, spellMap, eventArgs)

	if state.DoomMode.value == 'Doom' then
		send_command('input /party IS STILL DOOMED! AM SCAREBOYE PLES HALP!! <scall15>')
	end

end


function job_post_precast(spell, action, spellMap, eventArgs)

	if buffactive['Fast Cast'] and spell.action_type == 'Magic' then
		equip(sets.precast.FC.Inspired)
	end

end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)

    if spell.english == 'Lunge' or spell.english == 'Swipe' then
        local obi = get_obi(get_rune_obi_element())
        if obi then
            equip({waist=obi})
        end
    end
	
	if spell.english == 'Phalanx' and buffactive['Defense Boost'] and buffactive['Stoneskin'] and buffactive['Phalanx'] then
		equip(set_combine(sets.midcast['Phalanx'], {main="Deacon Sword"}))
	elseif spell.english == 'Phalanx' and buffactive['Phalanx'] then
		send_command('wait 0.2;input //cancel Phalanx')
	end
	
	if spell.english == 'Phalanx' and not (buffactive['phalanx'] or buffactive['aquaveil']) then 
		equip(set_combine(sets.midcast['Phalanx'], sets.SIRD))
	end
	
	if spell.english == 'Aquaveil' and not buffactive['Aquaveil'] then 
		equip(set_combine(sets.midcast['Aquaveil'], sets.SIRD2))
	end
	
	if spell.skill == 'Enhancing Magic' and buffactive['Embolden'] and spell.target.type == 'SELF' then
		equip(sets.Embolden)
	end
	
end



function job_midcast(spell, action, spellMap, eventArgs)

	if spell.english == 'Jettatura' or spell.english == 'Geist Wall' or spell.english == 'Soporific' or spell.english == 'Blank Gaze' 
	or spell.english == 'Sheep Song' or spell.english == 'Chaotic Eye' or spell.english == 'Cursed Sphere' or spell.english == 'Flash' 
	or spell.english == 'Stun' or spell.english == 'Awful Eye'or spell.english == 'Grand Slam' or spell.english == 'Foil' and player.hp > 2500 then
		equip(sets.Enmity)
	elseif spell.english == 'Jettatura' or spell.english == 'Geist Wall' or spell.english == 'Soporific' or spell.english == 'Blank Gaze' 
	or spell.english == 'Sheep Song' or spell.english == 'Chaotic Eye' or spell.english == 'Cursed Sphere' or spell.english == 'Flash' 
	or spell.english == 'Stun' or spell.english == 'Awful Eye' or spell.english == 'Grand Slam' or spell.english == 'Foil' and player.hp < 2500 then
		equip(sets.EnmityMax)
	end
	
	if spell.skill == 'Enhancing Magic' and spell.english ~= 'Foil' then
		equip(sets.midcast.Enhance)
	end
	
	if spell.english == 'Pollen' then
		equip(sets.midcast.OmenLowHP)
	end

	if spell.english == 'Wild Carrot' and player.hp < 2300 then
		equip(sets.midcast.CurePot)
	elseif spell.english == 'Wild Carrot' and player.hp >= 2300 then
		equip(sets.engaged.DTmeva)
	end
	
	if spell.english == 'Stoneskin' and buffactive['Stoneskin'] then
		send_command('wait 1;input //cancel Stoneskin')
	end
	
end

function customize_idle_set(idleSet)

    if buffactive['Doom'] then
        idleSet = set_combine(idleSet, sets.Doom)
	end
	
	if not buffactive['Shell'] and state.IdleMode.value == 'Tanking' then
		if not (world.area:contains("Adoulin") or world.area:contains("Mhaura") 
			or world.area:contains("Selbina") or world.area:contains("Southern San d'Oria") 
			or world.area:contains("Northern San d'Oria") or world.area:contains("Port San d'Oria") 
			or world.area:contains("Chateau d'Oraguille")or world.area:contains("Port Bastok") 
			or world.area:contains("Bastok Mines") or world.area:contains("Bastok Markets") 
			or world.area:contains("Metalworks")or world.area:contains("Windurst Walls") 
			or world.area:contains("Port Windurst") or world.area:contains("Heavens Tower") 
			or world.area:contains("Windurst Waters") or world.area:contains("Windurst Woods")
			or world.area:contains("Norg") or world.area:contains("Kazham") or world.area:contains("Rabao")
			or world.area:contains("Al Zahbi") or world.area:contains("Whitegate")
			or world.area:contains("Port Jeuno") or world.area:contains("Lower Jeuno") 
			or world.area:contains("Upper Jeuno") or world.area:contains("Ru'Lude")
			or world.area:contains("Tavnazian")) then
		idleSet = set_combine(idleSet, sets.idle.MDT)
		end
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
		
		if buff == 'Shell' and not gain then
			if not	(world.area:contains("Adoulin") or world.area:contains("Mhaura") 
			or world.area:contains("Selbina") or world.area:contains("Southern San d'Oria") 
			or world.area:contains("Northern San d'Oria") or world.area:contains("Port San d'Oria") 
			or world.area:contains("Chateau d'Oraguille")or world.area:contains("Port Bastok") 
			or world.area:contains("Bastok Mines") or world.area:contains("Bastok Markets") 
			or world.area:contains("Metalworks")or world.area:contains("Windurst Walls") 
			or world.area:contains("Port Windurst") or world.area:contains("Heavens Tower") 
			or world.area:contains("Windurst Waters") or world.area:contains("Windurst Woods")
			or world.area:contains("Norg") or world.area:contains("Kazham") or world.area:contains("Rabao")
			or world.area:contains("Al Zahbi") or world.area:contains("Whitegate")
			or world.area:contains("Port Jeuno") or world.area:contains("Lower Jeuno") 
			or world.area:contains("Upper Jeuno") or world.area:contains("Ru'Lude")
			or world.area:contains("Tavnazian")) then
			send_command('input /party Shell is DOWN: Magic Defense Bonus Off <call14>')
			end
		end
		
		if buff == 'Defense Boost' and not gain then
			if not	(world.area:contains("Adoulin") or world.area:contains("Mhaura") 
			or world.area:contains("Selbina") or world.area:contains("Southern San d'Oria") 
			or world.area:contains("Northern San d'Oria") or world.area:contains("Port San d'Oria") 
			or world.area:contains("Chateau d'Oraguille")or world.area:contains("Port Bastok") 
			or world.area:contains("Bastok Mines") or world.area:contains("Bastok Markets") 
			or world.area:contains("Metalworks")or world.area:contains("Windurst Walls") 
			or world.area:contains("Port Windurst") or world.area:contains("Heavens Tower") 
			or world.area:contains("Windurst Waters") or world.area:contains("Windurst Woods")
			or world.area:contains("Norg") or world.area:contains("Kazham") or world.area:contains("Rabao")
			or world.area:contains("Al Zahbi") or world.area:contains("Whitegate")
			or world.area:contains("Port Jeuno") or world.area:contains("Lower Jeuno") 
			or world.area:contains("Upper Jeuno") or world.area:contains("Ru'Lude")
			or world.area:contains("Tavnazian")) then
			windower.add_to_chat(122,'|=============|    COCOON   HAS WORN OFF    |=============|')
			--send_command('input /party Cocoon DOWN: Defense Bonus Off <call21>')
			end
		end

		if buff == 'Stoneskin' and not gain then
			windower.add_to_chat(122,'|=============|    STONESKIN   HAS WORN OFF    |=============|')
		end
		
		if buff == 'Phalanx' and not gain then
			windower.add_to_chat(122,'|=============|    PHALANX   HAS WORN OFF    |=============|')
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

function customize_melee_set(meleeSet)
	
	if buffactive['Battuta'] then
        meleeSet = set_combine(meleeSet, sets.Battuta)
    end

	if buffactive['Doom'] then
        meleeSet = set_combine(meleeSet, sets.Doom)
    end
	
	if not buffactive['Shell'] and (state.OffenseMode.value == 'DTmeva' or state.OffenseMode.value == 'HybridDPS') then
		meleeSet = set_combine(meleeSet, sets.engaged.MDT)
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
 
	
--=-----------------------------=--
--          __   __   __   __    --
--    /|/| /  | /    /  | /  |   --
--   ( / |(___|(    (___|(   |   --
--   |   )|   )|   )|\   |   )   --
--   |  / |  / |__/ | \  |__/    --
--=-----------------------------=--

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(4, 5)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 20)
	elseif player.sub_job == 'SAM' then
		set_macro_page(4, 5)
	else
		set_macro_page(4, 5)
	end
end




function get_rune_obi_element()
    weather_rune = buffactive[elements.rune_of[world.weather_element] or '']
    day_rune = buffactive[elements.rune_of[world.day_element] or '']

    local found_rune_element

    if weather_rune and day_rune then
        if weather_rune > day_rune then
            found_rune_element = world.weather_element
        else
            found_rune_element = world.day_element
        end
    elseif weather_rune then
        found_rune_element = world.weather_element
    elseif day_rune then
        found_rune_element = world.day_element
    end

    return found_rune_element
end

function get_obi(element)
    if element and elements.obi_of[element] then
        return (player.inventory[elements.obi_of[element]] or player.wardrobe[elements.obi_of[element]]) and elements.obi_of[element]
    end
end

function add_to_chat(command)
	if handle_unset and command == 'add_to_chat' then
	end
end


--This is used to make sure we will attempt to refresh the window every second
--prerender is actually faster than 1 second as it is called every few milliseconds
time_start = os.time()
windower.register_event(
    "prerender",
    function()
        --Items we want to check every second
        if os.time() > time_start then
            --We want to keep this reset each time we enter so its called every second
            time_start = os.time()

            --Simply refreshes the window
            refreshWindow()
        end
    end
)

--Window
--Default To Set Up the Text Window

-- Place this in the job_function()
-- setupTextWindow(1400, 600)

-- You can toggle this with a command to turn the entire window on and off
-- visible = false
visible = true

function setupTextWindow(pos_x, pos_y)
    tb_name = "run_gs_helper"
    bg_visible = true
    textinbox = " "

    windower.text.create(tb_name)
    -- table_name, x, y
    windower.text.set_location(tb_name, pos_x, pos_y)
    -- transparency, rgb
    windower.text.set_bg_color(tb_name, 170, 30, 30, 40)
    windower.text.set_color(tb_name, 255, 255, 161, 61)
    windower.text.set_font(tb_name, "Trebuchet MS")
    windower.text.set_font_size(tb_name, 13)
    windower.text.set_bold(tb_name, true)
    windower.text.set_italic(tb_name, false)
    windower.text.set_text(tb_name, textinbox)
    windower.text.set_bg_visibility(tb_name, bg_visible)
    windower.text.set_visibility(tb_name, visible)
end

--Hanldles refreshing the current text window
-- refreshWindow() should be called anytime you perform an action that would change what is on the window
function refreshWindow()
    textinbox = " " -- This is what gets drawn on the screen at the end
    textColorNewLine = "\\cr \n" --Placed at the end of a line to end the color and make a new line after
    textColorEnd = " \\cr" -- Placed at the end of what you are displaying to end the given color
    textColor = "\\cs(125, 255, 125)" --RGB color setting

    if not visible then --If not 'true' then it will hide the window all together
        textinbox = ""
        windower.text.set_text(tb_name, textinbox)
        return
    end

    --If you want to Toggle this section uncomment the if and end
    --You'll need to use a variable like this in user_setup():
    --state.textHideMode = M(false, "Hide Mode")
    --then you can toggle it with Mote's
    -- //gs c toggle textHideMode
    
    -- if not state.textHideMode.value then
	
		textinbox = textinbox .. drawTitle("  Local Keybinds  ")
		textinbox = textinbox .. textColor .. "(F8) Engaged Mode -> HybridDPS" .. textColorNewLine
		textinbox = textinbox .. textColor .. "(F11) Idle & Engaged -> Tanking" .. textColorNewLine
		textinbox = textinbox .. textColor .. "(CTRL+F11) Idle & Engaged -> Normal" .. textColorNewLine
	
        textinbox = textinbox .. drawTitle("  Current Settings  ") --Draws the title and puts '=', example ====     Mode     ==== around the title passed in
        textinbox = textinbox .. textColor .. "Idle Mode (F10) : " .. tostring(state.IdleMode.current) .. textColorNewLine
		textinbox = textinbox .. textColor .. "TP Mode (F9) : " .. tostring(state.OffenseMode.current) .. textColorNewLine
		
		if state.WeaponLockMode.value == 'Locked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F12) : " .. "\\cr" .. "\\cs(255, 75, 75)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
		elseif state.WeaponLockMode.value == 'Unlocked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F12) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
		end
       
		
		if state.ZoneRing.current == 'Warp' then
			textinbox = textinbox .. "Zone Ring (F5) : " .. "\\cs(255, 75, 255)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'Holla' then
			textinbox = textinbox .. "Zone Ring (F5) : " .. "\\cs(255, 75, 75)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'Dem' then
			textinbox = textinbox .. "Zone Ring (F5) : " .. "\\cs(0, 175, 255)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'Mea' then
			textinbox = textinbox .. "Zone Ring (F5) : " .. "\\cs(255, 255, 75)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'None' then
			textinbox = textinbox .. "Zone Ring (F5) : " .. "\\cs(255, 255, 255)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		end
		if state.Moving.value == 'false' then
			textinbox = textinbox .. "Player Moving (Auto) : " .. "\\cs(255, 100, 100)" .. tostring(state.Moving.value) .. "\\cr \n"
		else
			textinbox = textinbox .. "Player Moving (Auto) : " .. "\\cs(100, 255, 100)" .. tostring(state.Moving.value) .. "\\cr \n"
		end
			textinbox = textinbox .. textColor .. "Engaged Movespeed (F1) : " .. tostring(state.EngagedMoving.current) .. textColorNewLine



    windower.text.set_text(tb_name, textinbox)
end


--Creates the Title for a section in the Text Screen
function drawTitle(title)
    return "\\cs(200, 222, 255)" .. pad(tostring(title), 6, ":") .. "\\cr \n"
end

--Pads a given chara on both sides (centering with left justification)
function pad(s, l, c)
    local srep = string.rep
    local c = c or " "

    local res1 = srep(c, l) .. s -- pad to half-length s
    local res2 = res1 .. srep(c, l) -- right-pad our left-padded string to the full length

    return res2
end

--Takes a condition and returns a given value based on if it is true or false
function ternary(cond, T, F)
    if cond then
        return T
    else
        return F
    end
end
