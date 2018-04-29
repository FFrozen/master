-- __ Script is made by mta-sa.org community and is open source __--
-- __ feel free to use it, but do not call it selfmade	__--

-- Added by TheOne @28.04.2018, 12:35 -- 
-- Edit by ... Fixed ... --
-- shooting vehicle system

local coolDownTime = 100
local isCoolDownEnabled = false 
local shooterCarEnabled = false
addEventHandler("onClientKey",root, 
function()
    if(getPedControlState("vehicle_fire") and getPedOccupiedVehicle ( localPlayer ) and shooterCarEnabled == true and isCoolDownEnabled == false) then 
        isCoolDownEnabled = true -- Aktiviere cool down 
        triggerEvent("CG:CreateRocket", root, localPlayer ) --triggert an alle Spieler damit die Rakete auch Sync. wird.
        setTimer(function()
            isCoolDownEnabled = false 
        end, coolDownTime, 1)
    end
end)

addEvent("CG:CreateRocket",true)
addEventHandler("CG:CreateRocket", root,
function(attacker,target)
    if( attacker and not target) then 
        local x,y,z = getElementPosition(attacker)
        local rx,ry,rz = getElementRotation(attacker)
        --local vx,vy,vz = getElementVelocity(attacker)
        local x, y, z, lx, ly, lz = getCameraMatrix ()
        local rocket = createProjectile(attacker, 19,lx,ly,lz+10,3.0, nil,rx,ry,rz)
        setProjectileCounter(rocket, 50000)
    end
end)

addCommandHandler("shootercar",
function()
    if(shooterCarEnabled == false and getPedOccupiedVehicle ( localPlayer )) then
        shooterCarEnabled = true 
        setElementData(localPlayer, "CG:ShootingCarEnabled",shooterCarEnabled) -- Damit kann man abfragen ob der Spieler das Shooting Car aktiviert hat.
        outputChatBox("Shooting-Cars set to "..tostring(shooterCarEnabled)..".", 255, 0, 0 )
        addEventHandler("onClientRender",root,renderShootingPoint)
    elseif(getPedOccupiedVehicle ( localPlayer ))then
        shooterCarEnabled = false 
        setElementData(localPlayer, "CG:ShootingCarEnabled",shooterCarEnabled) 
        outputChatBox("Shooting-Cars set to "..tostring(shooterCarEnabled)..".", 255, 0, 0 ) 
        removeEventHandler("onClientRender",root,renderShootingPoint)
    end
end)

function renderShootingPoint()
    if(getPedOccupiedVehicle ( localPlayer ))then 
        local x, y, z, lx, ly, lz = getCameraMatrix ()
        --local vx,vy,vz = getElementPosition(getPedOccupiedVehicle(localPlayer))
        dxDrawLine3D ( x, y, z, lx, ly, lz, tocolor ( 0, 255, 0, 250 ), 5)
    else 
        removeEventHandler("onClientRender",root, renderShootingPoint)
    end
end
