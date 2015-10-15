showa=0
showb=0
showc=1
oldpad = KEY_A
loaded = false

-- font is verdana
font=Font.load(System.currentDirectory().."/verdana.ttf")
cursiv=Font.load(System.currentDirectory().."/verdanai.ttf")

function Print(x, y, text, color, screen)
	if string.len(text) > 60 and string.len(text) < 244 then
		Font.print(font,x+3, y, string.sub(text,1,60).."-", color, screen)
		Font.print(font,x+3, y+15, string.sub(text,61,121).."-", color, screen)
		Font.print(font,x+3, y+30, string.sub(text,122,182).."-", color, screen)
		Font.print(font,x+3, y+45, string.sub(text,183,244), color, screen)
	elseif string.len(text) > 60 and string.len(text) < 182 then
		Font.print(font,x+3, y, string.sub(text,1,60).."-", color, screen)
		Font.print(font,x+3, y+15, string.sub(text,61,121).."-", color, screen)
		Font.print(font,x+3, y+30, string.sub(text,122,182), color, screen)
	elseif string.len(text) > 60 and string.len(text) < 121 then
		Font.print(font,x+3, y, string.sub(text,1,60).."-", color, screen)
		Font.print(font,x+3, y+15, string.sub(text,61,121), color, screen)
	elseif string.len(text) > 60 and string.len(text) < 305 then
		Font.print(font,x+3, y, string.sub(text,1,60).."-", color, screen)
		Font.print(font,x+3, y+15, string.sub(text,61,121).."-", color, screen)
		Font.print(font,x+3, y+30, string.sub(text,122,182).."-", color, screen)
		Font.print(font,x+3, y+45, string.sub(text,183,244).."-", color, screen)
		Font.print(font,x+3, y+60, string.sub(text,245,305), color, screen)
	elseif string.len(text) > 60 and string.len(text) < 366 then
		Font.print(font,x+3, y, string.sub(text,1,60).."-", color, screen)
		Font.print(font,x+3, y+15, string.sub(text,61,121).."-", color, screen)
		Font.print(font,x+3, y+30, string.sub(text,122,182).."-", color, screen)
		Font.print(font,x+3, y+45, string.sub(text,183,244).."-", color, screen)
		Font.print(font,x+3, y+60, string.sub(text,245,305).."-", color, screen)
		Font.print(font,x+3, y+75, string.sub(text,306,366), color, screen)
	else
		Font.print(font,x+3, y, text, color, screen)
	end
end
function CPrint(x, y, text, color, screen)
	if string.len(text) > 60 and string.len(text) < 244 then
		Font.print(cursiv,x+3, y, string.sub(text,1,60).."-", color, screen)
		Font.print(cursiv,x+3, y+15, string.sub(text,61,121).."-", color, screen)
		Font.print(cursiv,x+3, y+30, string.sub(text,122,182).."-", color, screen)
		Font.print(cursiv,x+3, y+45, string.sub(text,183,244), color, screen)
	elseif string.len(text) > 60 and string.len(text) < 182 then
		Font.print(cursiv,x+3, y, string.sub(text,1,60).."-", color, screen)
		Font.print(cursiv,x+3, y+15, string.sub(text,61,121).."-", color, screen)
		Font.print(cursiv,x+3, y+30, string.sub(text,122,182), color, screen)
	elseif string.len(text) > 60 and string.len(text) < 121 then
		Font.print(cursiv,x+3, y, string.sub(text,1,60).."-", color, screen)
		Font.print(cursiv,x+3, y+15, string.sub(text,61,121), color, screen)
	elseif string.len(text) > 60 and string.len(text) < 305 then
		Font.print(cursiv,x+3, y, string.sub(text,1,60).."-", color, screen)
		Font.print(cursiv,x+3, y+15, string.sub(text,61,121).."-", color, screen)
		Font.print(cursiv,x+3, y+30, string.sub(text,122,182).."-", color, screen)
		Font.print(cursiv,x+3, y+45, string.sub(text,183,244).."-", color, screen)
		Font.print(cursiv,x+3, y+60, string.sub(text,245,305), color, screen)
	elseif string.len(text) > 60 and string.len(text) < 366 then
		Font.print(cursiv,x+3, y, string.sub(text,1,60).."-", color, screen)
		Font.print(cursiv,x+3, y+15, string.sub(text,61,121).."-", color, screen)
		Font.print(cursiv,x+3, y+30, string.sub(text,122,182).."-", color, screen)
		Font.print(cursiv,x+3, y+45, string.sub(text,183,244).."-", color, screen)
		Font.print(cursiv,x+3, y+60, string.sub(text,245,305).."-", color, screen)
		Font.print(cursiv,x+3, y+75, string.sub(text,306,366), color, screen)
	else
		Font.print(cursiv,x+3, y, text, color, screen)
	end
end
while true do
pad = Controls.read()
if (Controls.check(pad,KEY_DRIGHT)) and not Controls.check(oldpad,KEY_DRIGHT) then
		showc=showc+1
		oldpad=pad
		pic = nil
		loaded = false
		elseif (Controls.check(pad,KEY_DLEFT)) and not Controls.check(oldpad,KEY_DLEFT) then
		showc=showc-1
		pic= nil
		loaded = false
		oldpad=pad
	end
	if (Controls.check(pad,KEY_SELECT)) and not Controls.check(oldpad,KEY_SELECT) then
		showa=0
		showb=0
		showc=1
		loaded = true
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
if not loaded then
pic=Screen.loadImage(System.currentDirectory().."/dex/"..showa..showb..showc.."/pic.jpg")
loaded = true 
end
Screen.waitVblankStart()
	Screen.refresh()
	Screen.clear(TOP_SCREEN)
	Print(155,0,"Index: "..showa..showb..showc,Color.new(255,255,255),TOP_SCREEN)
	CPrint(155,13,name,Color.new(255,255,255),TOP_SCREEN)
	Print(155,43,typ1,Color.new(255,255,255),TOP_SCREEN)
	Print(230,43,typ2,Color.new(255,255,255),TOP_SCREEN)
	Print(155,58,"Width: "..width,Color.new(255,255,255),TOP_SCREEN)
	Print(155,73,"Mass: "..mass,Color.new(255,255,255),TOP_SCREEN)

	Print(0,155,dextext,Color.new(255,255,255),TOP_SCREEN)
	Print(155,28,"Species: "..kind,Color.new(255,255,255),TOP_SCREEN)
	Screen.drawImage(0,0,pic,TOP_SCREEN)
	Screen.flip()
	oldpad = pad
end
