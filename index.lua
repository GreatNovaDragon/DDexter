showa=0
showb=0
showc=1
oldpad = KEY_A
loaded = false
gui=Screen.loadImage(System.currentDirectory().."/gui.jpg")
-- font is verdana
font=Font.load(System.currentDirectory().."/verdana.ttf")
cursiv=Font.load(System.currentDirectory().."/verdanai.ttf")
dfont=Font.load(System.currentDirectory().."/verdana.ttf")
Font.setPixelSizes(dfont,12)
black=Color.new(0,0,0)
function Print(x, y, text, color, screen)
	if string.len(text) > 50 and string.len(text) < 204 then
		Font.print(font,x+3, y, string.sub(text,1,50), color, screen)
		Font.print(font,x+3, y+15, string.sub(text,51,101), color, screen)
		Font.print(font,x+3, y+30, string.sub(text,102,152), color, screen)
		Font.print(font,x+3, y+45, string.sub(text,153,204), color, screen)
	else
		Font.print(font,x+3, y, text, color, screen)
	end
end
function DPrint(x, y, text, color, screen)
	if string.len(text) > 50 and string.len(text) < 404 then
		Font.print(dfont,x+3, y, string.sub(text,1,80), color, screen)
		Font.print(dfont,x+3, y+15, string.sub(text,81,161), color, screen)
		Font.print(dfont,x+3, y+30, string.sub(text,162,242), color, screen)
		Font.print(dfont,x+3, y+45, string.sub(text,243,324), color, screen)
	else
		Font.print(font,x+3, y, text, color, screen)
	end
end
function CPrint(x, y, text, color, screen)
	if string.len(text) > 50 and string.len(text) < 204 then
		Font.print(cursiv,x+3, y, string.sub(text,1,50), color, screen)
		Font.print(cursiv,x+3, y+15, string.sub(text,51,101), color, screen)
		Font.print(cursiv,x+3, y+30, string.sub(text,102,152), color, screen)
		Font.print(cursiv,x+3, y+45, string.sub(text,153,204), color, screen)
	
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
		elseif (Controls.check(pad,KEY_SELECT)) and not Controls.check(oldpad,KEY_SELECT) then
		showa=0
		showb=0
		showc=1
		loaded = true
		oldpad=pad
		elseif (Controls.check(pad,KEY_X)) and not Controls.check(oldpad,KEY_X) then
		System.takeScreenshot("/"..showa..showb..showc.."screen.jpg",true)
		oldpad=pad
	end
	if (Controls.check(pad,KEY_START)) then
		 System.exit()
	end
	if (Controls.check(pad,KEY_L)) and not Controls.check(oldpad,KEY_L) then
		 System.takeScreenshot(System.currentDirectory().."/screenshots/screenshot"..showa..showb..showc..".jpg",true)
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
	Screen.drawImage(0,0,gui,TOP_SCREEN)
	Print(175,15,showa..showb..showc,black,TOP_SCREEN)
	CPrint(200,15,name,black,TOP_SCREEN)
	Print(175,60,type1,black,TOP_SCREEN)
	Print(250,60,type2,black,TOP_SCREEN)
	Print(175,75,"Height: "..height,black,TOP_SCREEN)
	Print(175,90,"Weight: "..weight,black,TOP_SCREEN)

	DPrint(15,175,dextext,black,TOP_SCREEN)
	Print(175,45,"Species: "..kind,black,TOP_SCREEN)
	Screen.drawImage(10,10,pic,TOP_SCREEN)
	Screen.flip()
	oldpad = pad
end
