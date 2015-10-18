showa=0
showb=0
showc=1
oldpad = KEY_A
loaded = false
gui=Screen.loadImage(System.currentDirectory().."/pic/gui.jpg")
b0=Screen.loadImage(System.currentDirectory().."/pic/0.jpg")
b1=Screen.loadImage(System.currentDirectory().."/pic/1.jpg")
b2=Screen.loadImage(System.currentDirectory().."/pic/2.jpg")
b3=Screen.loadImage(System.currentDirectory().."/pic/3.jpg")
b4=Screen.loadImage(System.currentDirectory().."/pic/4.jpg")
b5=Screen.loadImage(System.currentDirectory().."/pic/5.jpg")
charge=Screen.loadImage(System.currentDirectory().."/pic/charge.jpg")
touch=Screen.loadImage(System.currentDirectory().."/pic/touch.jpg")
intro = Sound.openOgg(System.currentDirectory().."/intro.ogg",true)
loop = Sound.openOgg(System.currentDirectory().."/loop.ogg",true)
-- font is verdana
font=Font.load(System.currentDirectory().."/verdana.ttf")
cursiv=Font.load(System.currentDirectory().."/verdanai.ttf")
dfont=Font.load(System.currentDirectory().."/verdana.ttf")
Font.setPixelSizes(dfont,13)
Font.setPixelSizes(font,13)
Font.setPixelSizes(cursiv,13)
black=Color.new(0,0,0)
white=Color.new(255,255,255)
itime = Sound.getTotalTime(intro)
timer = Timer.new()
if 
function Print(x, y, text, color, screen)
	if string.len(text) > 75 and string.len(text) < 204 then
		Font.print(font,x, y, string.sub(text,1,75), color, screen)
		Font.print(font,x, y+15, string.sub(text,76,151), color, screen)
		Font.print(font,x, y+30, string.sub(text,152,226), color, screen)
		Font.print(font,x, y+45, string.sub(text,227,302), color, screen)
	else
		Font.print(font,x, y, text, color, screen)
	end
end
function DPrint(x, y, text, color, screen)
	if string.len(text) > 70 and string.len(text) < 323 then
		Font.print(dfont,x, y, string.sub(text,1,70), color, screen)
		Font.print(dfont,x, y+15, string.sub(text,71,141), color, screen)
		Font.print(dfont,x, y+30, string.sub(text,141,211), color, screen)
		Font.print(dfont,x, y+25, string.sub(text,213,283), color, screen)
	else
		Font.print(font,x, y, text, color, screen)
	end
end
function CPrint(x, y, text, color, screen)
	if string.len(text) > 50 and string.len(text) < 204 then
		Font.print(cursiv,x, y, string.sub(text,1,50), color, screen)
		Font.print(cursiv,x, y+15, string.sub(text,51,101), color, screen)
		Font.print(cursiv,x, y+30, string.sub(text,102,152), color, screen)
		Font.print(cursiv,x, y+45, string.sub(text,153,204), color, screen)
	
	else
		Font.print(cursiv,x, y, text, color, screen)
	end
end
Sound.init()
Sound.play(intro,NO_LOOP,0x09)
timer = Timer.new()
if Timer.getTime(timer)==itime then
Timer.destroy(timer)
Sound.close(intro)
Sound.play(loop,LOOP,0x09)
end
while true do
pad = Controls.read()
 if Controls.check(Controls.read(),KEY_TOUCH) then
          x,y = Controls.readTouch()
          if y >= 10 and y <= 220 then
            if x >10 and x <= 150 then
             showc=showc-1 
			 loaded = false
            elseif x >= 170 and x <= 310 then
              showc=showc+1
			  loaded = false
            end
          end
	end  
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
		loaded = false
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
pic=Screen.loadImage(System.currentDirectory().."/dex/pic/"..showa..showb..showc..".png")
loaded = true 
end
Screen.waitVblankStart()
	Screen.refresh()
	Screen.clear(TOP_SCREEN)
		
	Screen.drawImage(0,0,gui,TOP_SCREEN)
	Screen.drawImage(0,0,touch,BOTTOM_SCREEN)
	Print(180,50,"No."..showa..showb..showc,white,TOP_SCREEN)
	CPrint(280,50,name,white,TOP_SCREEN)
	Print(180,90,"TYPE",black,TOP_SCREEN)
	Print(280,90,type1.." "..type2,black,TOP_SCREEN)
	Print(180,110,"HEIGHT",black,TOP_SCREEN)
	Print(280,110,height,black,TOP_SCREEN)
	Print(180,130,"WEIGHT",black,TOP_SCREEN)
	Print(280,130,weight,black,TOP_SCREEN)
	DPrint(15,175,dextext,black,TOP_SCREEN)
	Print(180,70,"Species: ",black,TOP_SCREEN)
	Print(280,70,kind,black,TOP_SCREEN)
	Screen.drawImage(25,50,pic,TOP_SCREEN)
	hours,minutes,seconds = System.getTime()
	day_value,day,month,year = System.getDate()
	Font.print(font,190,6,day.."."..month.."."..year,white,TOP_SCREEN)
		if minutes < 10 then
			minutes = "0"..minutes
		end
		if seconds < 10 then
			seconds = "0"..seconds
		end
		formatted_time = hours..":"..minutes..":"..seconds
		Font.print(font,280,6,formatted_time,white,TOP_SCREEN)
	if  System.isBatteryCharging() then
			Screen.drawImage(355,6,charge,TOP_SCREEN)
		else
			battery_lv = System.getBatteryLife()
			if battery_lv == 0 then
				Screen.drawImage(355,6,b0,TOP_SCREEN)
			elseif battery_lv == 1 then
				Screen.drawImage(355,6,b1,TOP_SCREEN)
			elseif battery_lv == 2 then
				Screen.drawImage(355,6,b2,TOP_SCREEN)
			elseif battery_lv == 3 then
				Screen.drawImage(355,6,b3,TOP_SCREEN)
			elseif battery_lv == 4 then
				Screen.drawImage(355,6,b4,TOP_SCREEN)
			else
				Screen.drawImage(355,6,b5,TOP_SCREEN)
			end
		end
	Screen.flip()
	oldpad = pad
end
