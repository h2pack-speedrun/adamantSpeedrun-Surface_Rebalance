local behaviors = {
    patches = {},
    hooks = {},
    options = {},
}

local function register(path)
    local behavior = import(path)
    if behavior.option then
        table.insert(behaviors.options, behavior.option)
    end
    for _, patch in ipairs(behavior.patches or {}) do
        table.insert(behaviors.patches, patch)
    end
    for _, hook in ipairs(behavior.hooks or {}) do
        table.insert(behaviors.hooks, hook)
    end
end

register("behaviors/ForceThessalyMiniboss.lua")
register("behaviors/ForceOlympusMidshop.lua")
register("behaviors/RemoveSurfaceHeracles.lua")
register("behaviors/CharybdisBehavior.lua")

return behaviors
