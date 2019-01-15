--[[

888       888 888      d8b 888                 888b     d888                            
888   o   888 888      Y8P 888                 8888b   d8888                            
888  d8b  888 888          888                 88888b.d88888                            
888 d888b 888 88888b.  888 888888  .d88b.      888Y88888P888  8888b.   .d88b.   .d88b.  
888d88888b888 888 "88b 888 888    d8P  Y8b     888 Y888P 888     "88b d88P"88b d8P  Y8b 
88888P Y88888 888  888 888 888    88888888     888  Y8P  888 .d888888 888  888 88888888 
8888P   Y8888 888  888 888 Y88b.  Y8b.         888   "   888 888  888 Y88b 888 Y8b.     
888P     Y888 888  888 888  "Y888  "Y8888      888       888 "Y888888  "Y88888  "Y8888  
                                                                           888          
                                                                      Y8b d88P          
                                                                       "Y88P"           
]]

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
	state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
	state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
	state.Moving = M(false, "moving")
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

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('None', 'Normal')
	state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Normal', 'PDT' ,'Refresh')
	state.ZoneRing = M('None','Warp', 'Holla', 'Dem', 'Mea')


	select_default_macro_book()
	set_lockstyle()
	
	send_command('bind f5 gs c cycle ZoneRing')
	
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
		
end

-- Define sets and vars used by this job file.
function init_gear_sets()

--==================================================--
--  ____                                       _    --
-- |  _ \   _ __    ___    ___    __ _   ___  | |_  --
-- | |_) | | '__|  / _ \  / __|  / _` | / __| | __| --
-- |  __/  | |    |  __/ | (__  | (_| | \__ \ | |_  --
-- |_|     |_|     \___|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--

	sets.precast.FC = {}
	
	
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})
	

	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Orison Pantaloons +2"})
	
	
	sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
	
	-- You can use cure casting spelltime - gear here to pad out a mediocre fast cast set, or to retain other stats like DT/HP in return.
	sets.precast.FC.Cure = {}
	
	
	sets.precast.FC.CureSolace = sets.precast.FC.Cure
	-- CureMelee spell map should default back to Healing Magic.
    
	-- Precast sets to enhance JAs
	sets.precast.JA.Benediction = {body="Piety Briault"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
    
	
--==================================================--
--   __  __   _       _                        _    --
--  |  \/  | (_)     | |                      | |   --
--  | \  / |  _    __| |   ___    __ _   ___  | |_  --
--  | |\/| | | |  / _` |  / __|  / _` | / __| | __| --
--  | |  | | | | | (_| | | (__  | (_| | \__ \ | |_  --
--  |_|  |_| |_|  \__,_|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--

	--for Arise
	sets.midcast.FastRecast = {}

	
	sets.midcast.Cure = {}
	
	
	sets.midcast.CureMelee = {}
	
	
	sets.midcast.CureSolace = {}

	
	sets.midcast.Cursna = {}

	
	sets.midcast.Curaga = {}
	
	
	--Na spell removal, can put Yagrush here if you have it
	sets.midcast.StatusRemoval = {}
	
	
	--Combination of gear that enhances barspells and enhancing skill (Eburs+1 Head, Hands, Body, Feet; Piety Pantaloons +1~3)
	--This set is also called for Boost spells.
	sets.midcast.BarElement = {}
	
	
	sets.midcast.BarElement.SCH = {}
	
	
	--Enhancing Magic Skill (500 cap) and Damage Taken or Magic Evasion Gear
	sets.midcast['Enhancing Magic'] = {}
	
	
	--Requires less skill due to Light Arts skill bonus.  Will only be called when Light Arts is active.
	sets.midcast['Enhancing Magic'].SCH = {}
	
	
	sets.midcast['Enhancing Magic'].EnhancingDuration = {}
	
	sets.midcast.Arise = sets.midcast.FastRecast
	sets.midcast.Haste = sets.midcast['Enhancing Magic'].EnhancingDuration
	sets.midcast.Storms = sets.midcast['Enhancing Magic'].EnhancingDuration
	sets.midcast.Aquaveil = sets.midcast['Enhancing Magic'].EnhancingDuration
	sets.midcast.Auspice = sets.midcast['Enhancing Magic'].EnhancingDuration
	sets.midcast.Blink = sets.midcast['Enhancing Magic'].EnhancingDuration
	sets.midcast.Refresh = sets.midcast['Enhancing Magic'].EnhancingDuration
	sets.midcast.Sneak = sets.midcast['Enhancing Magic'].EnhancingDuration
	sets.midcast.Invisible = sets.midcast['Enhancing Magic'].EnhancingDuration
	sets.midcast.Deodorize = sets.midcast['Enhancing Magic'].EnhancingDuration
	sets.midcast.Shellra = sets.midcast['Enhancing Magic'].EnhancingDuration
	sets.midcast.Protectra = sets.midcast['Enhancing Magic'].EnhancingDuration
	
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'].EnhancingDuration,{})
	
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'].EnhancingDuration,{})

	
	sets.midcast['Divine Magic'] = {}

	
	sets.midcast['Enfeebling Magic'] = {}
	
	
	sets.midcast['Enfeebling Magic'].MndEnfeebles = {}
	
	
	sets.midcast['Enfeebling Magic'].IntEnfeebles = {}
    
	
--===============================================================================--		
-- __        __                                               _      _   _   _   --
-- \ \      / /   ___    __ _   _ __     ___    _ __    ___  | | __ (_) | | | |  --
--  \ \ /\ / /   / _ \  / _` | | '_ \   / _ \  | '_ \  / __| | |/ / | | | | | |  --
--   \ V  V /   |  __/ | (_| | | |_) | | (_) | | | | | \__ \ |   <  | | | | | |  --
--    \_/\_/     \___|  \__,_| | .__/   \___/  |_| |_| |___/ |_|\_\ |_| |_| |_|  --
--                             |_|                                               --
--===============================================================================--

	sets.precast.WS = {}
    
	
	sets.precast.WS['Flash Nova'] = {}
    
	
--=================================--
--      ___       _   _            --
--     |_ _|   __| | | |   ___     --
--      | |   / _` | | |  / _ \    --
--      | |  | (_| | | | |  __/    --
--     |___|  \__,_| |_|  \___|    --
--=================================--

	sets.idle = {}
	
	
	sets.idle.PDT = {}
	
	
	sets.Resting = {}
	
	
--====================================================--
--     _____   ____      ____           _             --
--    |_   _| |  _ \    / ___|    ___  | |_   ___     --
--      | |   | |_) |   \___ \   / _ \ | __| / __|    --
--      | |   |  __/     ___) | |  __/ | |_  \__ \    --
--      |_|   |_|       |____/   \___|  \__| |___/    --
--====================================================--

	--aim for 26% haste, then acc/multi-attack/storeTP
	sets.engaged = {}

	
--------------------------------------------------------------------------------------------------------	
---  _____    ____    _   _   _____    _____   _______   _____    ____    _   _              _       ---
--  / ____|  / __ \  | \ | | |  __ \  |_   _| |__   __| |_   _|  / __ \  | \ | |     /\     | |       --
-- | |      | |  | | |  \| | | |  | |   | |      | |      | |   | |  | | |  \| |    /  \    | |       --
-- | |      | |  | | | . ` | | |  | |   | |      | |      | |   | |  | | | . ` |   / /\ \   | |       --
-- | |____  | |__| | | |\  | | |__| |  _| |_     | |     _| |_  | |__| | | |\  |  / ____ \  | |____   --
--  \_____|  \____/  |_| \_| |_____/  |_____|    |_|    |_____|  \____/  |_| \_| /_/    \_\ |______|  --
--- 																								 ---
--------------------------------------------------------------------------------------------------------

	-- Empy gloves +1~Reforge+1; Mending Cape.  Provides immunity for up to FIVE enfeebles for removed debuff while Divine Caress is active
	sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
	
	--Obi/Cape for Cure/Curaga during weather/day/storm
	--Many luas have an argument you can borrow for returning specific obis based on element if you've not made this yet.  You can google it if need be.
	sets.Weather = {waist="Hachirin-no-Obi"}
	sets.latent_refresh = {waist="Fucho-no-Obi"}
	sets.Adoulin = {body="Councilor's Garb",}
	sets.MoveSpeed = {feet = "Herald's Gaiters",}
	
end


--=================================================================--
--  _____                          _     _                         --
-- |  ___|  _   _   _ __     ___  | |_  (_)   ___    _ __    ___   --
-- | |_    | | | | | '_ \   / __| | __| | |  / _ \  | '_ \  / __|  --
-- |  _|   | |_| | | | | | | (__  | |_  | | | (_) | | | | | \__ \  --
-- |_|      \__,_| |_| |_|  \___|  \__| |_|  \___/  |_| |_| |___/  --
--                                                                 --
--=================================================================--

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
                state.Moving.value = true
                send_command('gs c update')
				if world.area:contains("Adoulin") then
                send_command('gs equip sets.Adoulin')
				else
                send_command('gs equip sets.MoveSpeed')
                end

                moving = true

            elseif dist < 1 and moving then
                state.Moving.value = false
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


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)

    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
	
	if buffactive['Afflatus Solace'] and spell.action_type == "Magic" and spell.english:startswith('Cure') then
		equip(sets.precast.FC.CureSolace)
	elseif	spell.action_type == "Magic" and spell.english:startswith('Curaga') then
		equip(sets.precast.FC.Cure)
	end
	
end


function job_post_midcast(spell, action, spellMap, eventArgs)

    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
	
	if (player.sub_job == 'SCH' and buffactive['Light Arts']) and 
		(spell.english == 'Barfira' or spell.english == 'Barwatera' or spell.english == 'Barthundra' or 
		spell.english == 'Barstonra' or spell.english == 'Barblizzara' or spell.english == 'Baraera') then
			equip(sets.midcast.BarElement.SCH)
	elseif (player.sub_job == 'SCH' and buffactive['Light Arts']) and spell.skill == 'Enhancing Magic' then
		equip(sets.midcast['Enhancing Magic'].SCH)
	end
	
	if (spell.english:startswith('Bar') or spell.english:startswith('Boost')) and (player.sub_job == 'SCH' and buffactive['Light Arts']) and not 
		(spell.english == 'Barfira' or spell.english == 'Barwatera' or spell.english == 'Barthundra' or 
		spell.english == 'Barstonra' or spell.english == 'Barblizzara' or spell.english == 'Baraera') then
			equip(sets.midcast['Enhancing Magic'].SCH)
	elseif (spell.english:startswith('Bar')or spell.english:startswith('Boost')) and not (spell.english == 'Barfira' or spell.english == 'Barwatera' or 
		spell.english == 'Barthundra' or spell.english == 'Barstonra' or spell.english == 'Barblizzara' or spell.english == 'Baraera') then
			equip(sets.midcast['Enhancing Magic'])
	end
	
	if (spell.skill == 'Healing Magic' and spell.english:startswith('Cure')) and (spell.element == world.weather_element or spell.element == world.day_element) then
		equip(set_combine(sets.midcast.Cure, sets.Weather))
	elseif (spell.skill == 'Healing Magic' and spell.english:startswith('Cure')) then
		equip(sets.midcast.Cure)
	elseif (spell.skill == 'Healing Magic' and spell.english:startswith('Curaga')) and (spell.element == world.weather_element or spell.element == world.day_element) then
		equip(set_combine(sets.midcast.Curaga, sets.Weather))
	elseif (spell.skill == 'Healing Magic' and spell.english:startswith('Curaga')) then
		equip(sets.midcast.Curaga)
	end
	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)

    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
	
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)

    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
		end
    elseif spell.skill == "Enfeebling Magic" then
        if spell.type == "WhiteMagic" then
			return "MndEnfeebles"
		else
			return "IntEnfeebles"
		end
	end
	
end


function job_buff_change(buff, gain)

	if (buff and gain) or (buff and not gain) then
		send_command('gs c update')
	end
	
end


function customize_idle_set(idleSet)

    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
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


function customize_melee_set(meleeSet)

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

windower.register_event('zone change', function()

	send_command('gs c set ZoneRing None')
	
end)

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)

    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
	
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)

    display_current_caster_state()
    eventArgs.handled = true
	
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()

    -- Default macro set/book
    set_macro_page(1, 4)

end

function set_lockstyle()

    send_command('wait 2; input /lockstyleset 016')

end
