return {
    option = {
        type = "checkbox",
        alias = "ForceOlympusMidshop",
        label = "Force Olympus Midshop",
        default = false,
        tooltip = "Forces the Olympus midshop to appear between rooms 5-7.",
    },
    patches = {
        {
            key = "ForceOlympusMidshop",
            fn = function(plan)
                plan:setMany(RoomSetData.P.P_Shop01, {
                    ForceAtBiomeDepthMin = 5,
                    ForceAtBiomeDepthMax = 7,
                })
            end,
        },
    },
}
