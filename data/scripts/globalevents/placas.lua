local effects = {
    {position = Position(32373, 32239, 7), text = 'Adventurer\'s Guild', effect = 56},
    {position = Position(32373, 32239, 7), text = '', effect = 57},
    {position = Position(32365, 32236, 7), text = 'Online Trainers', effect = 57},
    {position = Position(32365, 32236, 7), text = '', effect = 56},
    -- {position = Position(32345, 32221, 7), text = 'Breve\n [Mysterious Ornate Chest Quest]\n\nwww.maserots.online', effect = 201},
  }
  
  local PlacasMagicEffect = GlobalEvent("PlacasMagicEffect")
  
  function PlacasMagicEffect.onThink(cid, interval)
      for i = 1, #effects do
          local settings = effects[i]
          local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
          if #spectators > 0 then
              if settings.text then
                  for i = 1, #spectators do
                      spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                  end
              end
              if settings.effect then
                  settings.position:sendMagicEffect(settings.effect)
              end
          end
      end
     return true
  end
  
  PlacasMagicEffect:interval(6000)
  PlacasMagicEffect:register()