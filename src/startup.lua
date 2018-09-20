local function center ( y, string )
  local w, h = term.getSize() 
  local x = ( w / 2 ) - ( #string / 2)
  term.setCursorPos( x, y )
  print( string )
end

-- check if game disk is in
local function diskCheck()
  if fs.exists( "/disk/boot" ) then
    term.setBackgroundColour(colours.black)
    term.clear()
    shell.run( "/disk/boot" )
  elseif fs.exists( "/disk/startgame" ) then
    term.setBackgroundColour(colours.blue)
    term.clear()
    term.setTextColour(colours.white)
    center(6, "Jaguar has crashed!" )
    center(9, "Unaccepted disk format" )
    center(12, "Rebooting in 8 seconds..." )
    sleep(8)
    os.reboot()
    end
end

term.setBackgroundColour(colours.black)
term.clear()
paintutils.drawImage(paintutils.loadImage ("/Jaguar/screen"), 1, 1) -- logo
sleep(2)
term.setBackgroundColour(colours.green)
term.clear()
sleep() -- quick green flash like an atari jaguar

local function flash()
  term.setBackgroundColour(colours.red)
  term.setTextColour(colours.black)
  term.clear()
  diskCheck()
  center(9,"Please insert disk")
end
  
local function insert()
  flash()
  sleep(0.5)
  term.clear()
end

insert()

for i=1,50 do
  insert()
end
