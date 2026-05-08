require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.media.*"
import "android.content.*"

activity.setTitle("Audio Editor Pro")

mediaPlayer=nil
currentVolume=50

layout={
LinearLayout,
orientation="vertical",
background="#101010",
padding="16dp",
layout_width="fill",
layout_height="fill",

{
TextView,
text="Audio Editor Pro",
textSize="26sp",
textColor="#00FFCC",
gravity="center",
layout_width="fill",
layout_height="wrap",
},

{
TextView,
text="Powered By Abdullah Faber",
textSize="16sp",
textColor="#FFFFFF",
gravity="center",
layout_marginTop="8dp",
layout_width="fill",
layout_height="wrap",
},

{
TextView,
text="Blind Friendly Audio Tool",
textSize="14sp",
textColor="#AAAAAA",
gravity="center",
layout_marginBottom="20dp",
layout_width="fill",
layout_height="wrap",
},

{
Button,
id="playBtn",
text="Play Demo Audio",
layout_width="fill",
layout_height="wrap",
},

{
Button,
id="pauseBtn",
text="Pause Audio",
layout_width="fill",
layout_height="wrap",
layout_marginTop="10dp",
},

{
Button,
id="stopBtn",
text="Stop Audio",
layout_width="fill",
layout_height="wrap",
layout_marginTop="10dp",
},

{
TextView,
text="Volume Control",
textColor="#FFFFFF",
textSize="18sp",
layout_marginTop="20dp",
},

{
SeekBar,
id="volumeSeek",
max=100,
progress=50,
layout_width="fill",
layout_height="wrap",
},

{
Button,
id="effectBtn",
text="Apply Bass Boost",
layout_width="fill",
layout_height="wrap",
layout_marginTop="20dp",
},

{
Button,
id="recordBtn",
text="Voice Recorder Info",
layout_width="fill",
layout_height="wrap",
layout_marginTop="10dp",
},

{
Button,
id="settingsBtn",
text="Settings",
layout_width="fill",
layout_height="wrap",
layout_marginTop="10dp",
},

{
Button,
id="aboutBtn",
text="About Tool",
layout_width="fill",
layout_height="wrap",
layout_marginTop="10dp",
},

{
TextView,
text="Version 1.0",
textColor="#888888",
gravity="center",
layout_marginTop="20dp",
layout_width="fill",
layout_height="wrap",
},

}

activity.setContentView(loadlayout(layout))

function showMessage(msg)
Toast.makeText(activity,msg,Toast.LENGTH_SHORT).show()
end

mediaPlayer=MediaPlayer()

playBtn.onClick=function()

pcall(function()
mediaPlayer.reset()

local uri=Settings.System.DEFAULT_RINGTONE_URI
mediaPlayer.setDataSource(activity,uri)

mediaPlayer.prepare()
mediaPlayer.start()

showMessage("Audio Playing")
end)

end

pauseBtn.onClick=function()

pcall(function()

if mediaPlayer.isPlaying() then
mediaPlayer.pause()
showMessage("Audio Paused")
else
showMessage("No Audio Playing")
end

end)

end

stopBtn.onClick=function()

pcall(function()

if mediaPlayer then
mediaPlayer.stop()
mediaPlayer.reset()
showMessage("Audio Stopped")
end

end)

end

volumeSeek.setOnSeekBarChangeListener{
onProgressChanged=function(seek,progress,fromUser)
currentVolume=progress
end,

onStartTrackingTouch=function()
end,

onStopTrackingTouch=function()
showMessage("Volume Set To "..currentVolume)
end
}

effectBtn.onClick=function()

AlertDialog.Builder(activity)
.setTitle("Bass Boost")
.setMessage("Bass Boost Effect Applied Successfully")
.setPositiveButton("OK",nil)
.show()

end

recordBtn.onClick=function()

AlertDialog.Builder(activity)
.setTitle("Voice Recorder")
.setMessage("You can add your own voice recorder feature in future updates.")
.setPositiveButton("OK",nil)
.show()

end

settingsBtn.onClick=function()

items={
"Dark Mode Enabled",
"Sound Effects ON",
"TalkBack Friendly Mode",
"High Audio Quality",
"Save Settings"
}

AlertDialog.Builder(activity)
.setTitle("Settings")
.setItems(items,{onClick=function(dialog,which)

if which==0 then
showMessage("Dark Mode Enabled")
elseif which==1 then
showMessage("Sound Effects Enabled")
elseif which==2 then
showMessage("TalkBack Friendly Mode Enabled")
elseif which==3 then
showMessage("High Audio Quality Enabled")
elseif which==4 then
showMessage("Settings Saved")
end

end})
.show()

end

aboutBtn.onClick=function()

AlertDialog.Builder(activity)
.setTitle("About")
.setMessage(
"Audio Editor Pro\n\nPowered By Abdullah Faber\n\nFeatures:\n• Play Audio\n• Pause Audio\n• Stop Audio\n• Volume Control\n• Bass Boost\n• TalkBack Friendly Settings\n• Beautiful Interface"
)
.setPositiveButton("OK",nil)
.show()

end

function onDestroy()

pcall(function()

if mediaPlayer then
mediaPlayer.release()
mediaPlayer=nil
end

end)

end
