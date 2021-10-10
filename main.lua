Object = require "libraries/classic/classic"

function love.load()
  local object_files = {}
  recursiveEnumerate("objects", object_files)
  requireFiles(object_files)

  -- circle = Circle(400, 300, 50)
  hyperCircle = HyperCircle(400, 300, 50, 10, 120)
end

function recursiveEnumerate(folder, file_list)
    local items = love.filesystem.getDirectoryItems(folder)
    for _, item in ipairs(items) do
        local file = folder .. '/' .. item
        if love.filesystem.getInfo(file) then
            table.insert(file_list, file)
        elseif love.filesystem.isDirectory(file) then
            recursiveEnumerate(file, file_list)
        end
    end
end

function requireFiles(files)
    for _, file in ipairs(files) do
        local file = file:sub(1, -5)
        require(file)
    end
end

function love.update(dt)
  -- circle:update(dt)
  hyperCircle:update(dt)
end

function love.draw()
  -- circle:draw()
  hyperCircle:draw()
end

-- Main Run delta time
-- function love.run()
--   if love.math then
--     love.math.setRandomSeed(os.time())
--   end
--
--   if love.load then love.load(arg) end
--
--   -- We don't want the first frame's dt to include time taken by love.load.
--   if love.timer then love.timer.step() end
--
--   local dt = 0
--
--   -- Main loop time.
--   while true do
--     -- Process events.
--     if love.event then
--       love.event.pump()
--       for name, a,b,c,d,e,f in love.event.poll() do
--         if name == "quit" then
--           if not love.quit or not love.quit() then
--             return a
--           end
--         end
--         love.handlers[name](a,b,c,d,e,f)
--       end
--     end
--
--     -- Update dt, as we'll be passing it to update
--     if love.timer then
--       love.timer.step()
--       dt = love.timer.getDelta()
--     end
--
--     -- Call update and draw
--     if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled
--
--     if love.graphics and love.graphics.isActive() then
--       love.graphics.clear(love.graphics.getBackgroundColor())
--       love.graphics.origin()
--       if love.draw then love.draw() end
--       love.graphics.present()
--     end
--
--     if love.timer then love.timer.sleep(0.001) end
--   end
-- end

-- Fixed Delta Time
-- function love.run()
--   if love.math then love.math.setRandomSeed(os.time()) end
--   if love.load then love.load(arg) end
--
--   local dt = 1/60
--
--   -- Main loop time.
--   while true do
--     -- Process events.
--     if love.event then
--       love.event.pump()
--       for name, a,b,c,d,e,f in love.event.poll() do
--         if name == "quit" then
--           if not love.quit or not love.quit() then
--             return a
--           end
--         end
--         love.handlers[name](a,b,c,d,e,f)
--       end
--     end
--
--     -- Call update and draw
--     if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled
--
--     if love.graphics and love.graphics.isActive() then
--       love.graphics.clear(love.graphics.getBackgroundColor())
--       love.graphics.origin()
--       if love.draw then love.draw() end
--       love.graphics.present()
--     end
--
--     if love.timer then love.timer.sleep(0.001) end
--   end
-- end

-- Variable delta timer
-- function love.run()
--   if love.math then love.math.setRandomSeed(os.time()) end
--   if love.load then love.load(arg) end
--   if love.timer then love.timer.step() end
--
--   local dt = 0
--
--   -- Main loop time.
--   while true do
--     -- Process events.
--     if love.event then
--       love.event.pump()
--       for name, a,b,c,d,e,f in love.event.poll() do
--         if name == "quit" then
--           if not love.quit or not love.quit() then
--             return a
--           end
--         end
--         love.handlers[name](a,b,c,d,e,f)
--       end
--     end
--
--     -- Update dt, as we'll be passing it to update
--     if love.timer then
--       love.timer.step()
--       dt = love.timer.getDelta()
--     end
--
--     -- Call update and draw
--     if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled
--
--     if love.graphics and love.graphics.isActive() then
--       love.graphics.clear(love.graphics.getBackgroundColor())
--       love.graphics.origin()
--       if love.draw then love.draw() end
--       love.graphics.present()
--     end
--
--     if love.timer then love.timer.sleep(0.001) end
--   end
-- end

-- semi-foxed timestep
function love.run()
  if love.math then love.math.setRandomSeed(os.time()) end
  if love.load then love.load(arg) end
  if love.timer then love.timer.step() end

  local dt = 0

  -- Main loop time.
  while true do
    -- Process events.
    if love.event then
      love.event.pump()
      for name, a,b,c,d,e,f in love.event.poll() do
        if name == "quit" then
          if not love.quit or not love.quit() then
            return a
          end
        end
        love.handlers[name](a,b,c,d,e,f)
      end
    end

    -- Update dt, as we'll be passing it to update
    if love.timer then
      love.timer.step()
      dt = love.timer.getDelta()
    end

    -- Call update and draw
    if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled

    if love.graphics and love.graphics.isActive() then
      love.graphics.clear(love.graphics.getBackgroundColor())
      love.graphics.origin()
      if love.draw then love.draw() end
      love.graphics.present()
    end

    if love.timer then love.timer.sleep(0.001) end
  end
end
