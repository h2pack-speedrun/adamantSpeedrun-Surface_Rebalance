return {
    option = {
        type = "checkbox",
        alias = "CharybdisBehavior",
        label = "Adjust Charybdis Behavior",
        default = false,
        tooltip =
        "At phase transition, Tentacles despawn in 1s (not 9s). Charybdis fires 6 spits instead of 8."
    },
    patches = {
        {
            key = "CharybdisBehavior",
            fn = function(plan)
                plan:set(UnitSetData.Charybdis.CharybdisTentacle.AIStages[3], "WaitDuration", 1.0)
                plan:set(WeaponData.CharybdisSpit3.AIData, "FireTicks", 6)
                plan:set(WeaponDataEnemies.CharybdisSpit3.AIData, "FireTicks", 6)
            end
        },
    },
}
