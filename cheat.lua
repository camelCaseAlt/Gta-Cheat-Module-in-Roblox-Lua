-- A refresh cheat, typing REFRESH on keyboard runs refresh function

local yourcheat = {"R","E","F","R","E","S","H"} -- must be caps

function refresh()
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
end

cheatModuleLikeInGta(yourcheat, refresh, true)


[[
cheat: table of characters
callback: function to run after typing the cheat
notif: print cheat that will ran
]]
function cheatModuleLikeInGta(cheat, callback, notif)
	local validator = {}
	for i,v in pairs(cheat) do
		validator[i] = false	
	end
	local numofvalid = #validator
	local inumofvalid = 0
		
	game:GetService("UserInputService").InputBegan:Connect(function(input)		
		if (game:GetService("UserInputService"):GetFocusedTextBox()) then
			return; -- make sure player's not chatting!
		end
				
		for i,v in pairs(validator) do
			if validator[i] == false then
				if input.KeyCode == Enum.KeyCode[cheat[i]] then
					validator[i] = true
					for i3,v3 in pairs(validator) do
						if validator[i3] == true then
							inumofvalid += 1
						else
							inumofvalid = 0
							break
						end
					end
					if inumofvalid == numofvalid then
						if notif == true then
							local s = ""
							for i,v in pairs(cheat) do
								s = s..v
							end
							print(s.." cheat ran")
						end
						callback()
						inumofvalid = 0
						for i3,v3 in pairs(validator) do
							validator[i3] = false
						end
						break
					end
					break
				else
					for i2,v2 in pairs(validator) do
						validator[i2] = false
					end
					break
				end
			else
				continue
			end
		end
	end)
end
