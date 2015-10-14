showa=0
showb=0
showc=1
oldpad = KEY_A
while true do
pad = Controls.read()
if (Controls.check(pad,KEY_DRIGHT)) and not Controls.check(oldpad,KEY_DRIGHT) then
		showc=showc+1
		oldpad=pad
		pic= nil
		elseif (Controls.check(pad,KEY_DLEFT)) and not Controls.check(oldpad,KEY_DLEFT) then
		showc=showc-1
		pic= nil
		oldpad=pad
	end
	if (Controls.check(pad,KEY_SELECT)) and not Controls.check(oldpad,KEY_SELECT) then
		showa=0
		showb=0
		showc=1
	end
	if (Controls.check(pad,KEY_START)) then
		 System.exit()
	end
if showc == 0 and showb == 0 and showa == 0 then
		showa=0
		showb=0
		showc=1
		end
if showc < 0 and showb >= 0 then
showc=9
showb=showb-1
elseif showc < 0 then
showc=0
end

if showb < 0 then
showb=9
showa=showa-1
end
if showa < 0 then
showa=0
end
if showc >= 10 then 
showc=0
showb=showb+1 
end
if showb >= 10 then
showb=0
showa=showa+1 
end
if showa >= 10 then
 showa=0
showb=0
showc=1
end
dofile(System.currentDirectory().."/dex/"..showa..showb..showc.."/info.lua")
pic=Screen.loadImage(System.currentDirectory().."/dex/"..showa..showb..showc.."/pic.jpg")
Screen.waitVblankStart()
	Screen.refresh()
	Screen.clear(TOP_SCREEN)
	Screen.debugPrint(0,0,showa,Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(10,0,showb,Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(20,0,showc,Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(105,13,name,Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(105,33,typ1,Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(200,33,typ2,Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(0,150,dextext,Color.new(255,255,255),TOP_SCREEN)
	Screen.debugPrint(105,23,kind,Color.new(255,255,255),TOP_SCREEN)
	Screen.drawImage(0,11,pic,TOP_SCREEN)
	Screen.flip()
	pic = nil
	oldpad = pad
end
