for _, type in pairs({ "assembling-machine", "beacon", "resource", "electric-turret", "inserter", "lab", "lamp", "loader", "loader-1x1", "mining-drill", "pump", "radar", "roboport", "rocket-silo", "boiler", "furnace", "programmable-speaker", "arithmetic-combinator", "decider-combinator", "construction-robot", "logistic-robot", "locomotive" }) do
  for k, v in pairs(data.raw[type]) do
    if settings.startup["tfe-remove-electricity-cost"].value == true and v.energy_source ~= nil then
      if v.energy_source["type"] == "electric" then
          v.energy_source = {type = "void"}
      end
    end
    if settings.startup["tfe-remove-burner-cost"].value == true and v.energy_source ~= nil then
      if v.energy_source["type"] == "burner" then
        v.energy_source = {type = "void"}
      end
    end
    if settings.startup["tfe-remove-fluid-cost"].value == true and v.energy_source ~= nil then
      if v.energy_source["type"] == "fluid" then
        v.energy_source = {type = "void"}
      end
    end
    if settings.startup["tfe-remove-heat-cost"].value == true and v.energy_source ~= nil then
      if v.energy_source["type"] == "heat" then
        v.energy_source = {type = "void"}
      end
    end
    if settings.startup["tfe-remove-robot-cost"].value == true and (type == "construction-robot" or type == "logistic-robot")  then
      v.energy_per_tick = "0J"
      v.energy_per_move = "0J"
    end
    if settings.startup["tfe-remove-train-cost"].value == true and type == "locomotive" then
      v.energy_source = {type = "void"}
    end
  end
end
