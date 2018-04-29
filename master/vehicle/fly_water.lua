-- __ Script is made by mta-sa.org community and is open source __--
-- __ feel free to use it, but do not call it selfmade	__--

-- Added by TheOne @28.04.2018, 12:35 -- 
-- Edit by ... Fixed ... --
-- Car fly and water driving system
local carFlyIsEnabled = false
function carFly(player)
    if (carFlyIsEnabled == false) then
        carFlyIsEnabled = true
        outputChatBox("Flying-Cars set to "..tostring(carFlyIsEnabled)..".", 255, 0, 0 )
        setWorldSpecialPropertyEnabled("aircars", true )
    else
        carFlyIsEnabled = false
        outputChatBox("Flying-Cars set to "..tostring(carFlyIsEnabled)..".", 255, 0, 0 )
		setWorldSpecialPropertyEnabled("aircars", false )
	end
end
addCommandHandler("fly", carFly)
local waterCarIsEnabled = false
function water_car(player)
	if (waterCarIsEnabled == false) then
        setWorldSpecialPropertyEnabled("hovercars", true )
        waterCarIsEnabled = true
		outputChatBox("Swimming-Cars set to "..tostring(waterCarIsEnabled)..".", 255, 0, 0 )
    else
        setWorldSpecialPropertyEnabled("hovercars", false )
        waterCarIsEnabled = false
		outputChatBox("Swimming-Cars set to "..tostring(waterCarIsEnabled)..".", 255, 0, 0 )
	end
end
addCommandHandler("water", water_car )
