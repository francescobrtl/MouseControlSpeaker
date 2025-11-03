#SingleInstance Force

global gGui := "" 
global volGui := ""

; mute section

XButton1::
{
    muted := SoundGetMute()
    SoundSetMute(!muted)

    if (!muted)
        ShowOSD("MUTE ON")
    else
        HideOSD()

}
return

XButton2::ExitApp

ShowOSD(text)
{
    global gGui
    if IsObject(gGui)
        gGui.Destroy()
    

    gGui := Gui("+AlwaysOnTop -Caption +ToolWindow +Border")
    gGui.BackColor := "Black"
    gGui.SetFont("s28 cWhite", "Minecraftia")
    gGui.Add("Text", "Center w300 h60", text)
    gGui.Show("x" . 10 . " y" . 10)
}

HideOSD()
{
    global gGui
    if IsObject(gGui)
        gGui.Destroy()
}

; --------------
; volume section

GetVolume(){
    return Round(SoundGetVolume())
}

WheelDown::{
    SoundSetVolume("-2")
    volOSD("VOL: " . GetVolume() . "%")
    SetTimer(HidevolOSD, -1200)
}

WheelUp::{
    SoundSetVolume("+2")
    volOSD("VOL: " . GetVolume() . "%")
    SetTimer(HidevolOSD, -1200)
}

volOSD(text)
{
    global volGui
    if IsObject(volGui)
        volGui.Destroy()
    

    volGui := Gui("+AlwaysOnTop -Caption +ToolWindow +Border")
    volGui.BackColor := "Black"
    volGui.SetFont("s28 cWhite", "Minecraftia")
    volGui.Add("Text", "Center w300 h60", text)
    volGui.Show("x" . 10 . " y" . 10)
}

HideVolOSD()
{
    global volGui
    if IsObject(volGui)
        volGui.Destroy()
}
