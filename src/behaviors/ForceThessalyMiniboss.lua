return {
    option = {
        type = "checkbox",
        alias = "ForceThessalyMiniboss",
        label = "Force Thessaly Miniboss",
        default = false,
        tooltip = "Forces one Thessaly miniboss to appear between rooms 2-4.",
    },
    patches = {
        {
            key = "ForceThessalyMiniboss",
            fn = function(plan)
                plan:setMany(RoomSetData.O.O_MiniBoss01, {
                    ForceAtBiomeDepthMin = 2,
                    ForceAtBiomeDepthMax = 4,
                })
                plan:setMany(RoomSetData.O.O_MiniBoss02, {
                    ForceAtBiomeDepthMin = 2,
                    ForceAtBiomeDepthMax = 4,
                })

                for _, roomName in ipairs({ "O_MiniBoss01", "O_MiniBoss02" }) do
                    plan:transform(RoomData, roomName, function(room)
                        if room == nil then
                            return room
                        end
                        local copy = rom.game.DeepCopyTable(room)
                        if copy.GameStateRequirements then
                            for _, req in ipairs(copy.GameStateRequirements) do
                                if req.Path and req.Path[2] == "BiomeDepthCache" then
                                    if req.Comparison == ">=" and req.Value == 3 then
                                        req.Value = 2
                                    elseif req.Comparison == "<=" and req.Value == 5 then
                                        req.Value = 4
                                    end
                                end
                            end
                        end
                        return copy
                    end)
                end
            end,
        },
    },
}
