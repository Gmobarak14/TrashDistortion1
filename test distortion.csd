<Cabbage> bounds(0, 0, 0, 0)
form caption("RABBIT DISTORTION") bundle("./imgs")size(300, 350), guiMode("queue") pluginId("def1"), colour("black")
image      bounds(0, 140, 300, 156), colour(30, 70, 70, 255), , , alpha(1) channel("image1") file("./imgs/trashrat.jpg")
image      bounds(-6, 18, 304, 41), colour(0, 0, 0, 0), , , alpha(1) channel("image2") file("./imgs/ratbox.jpg")
image      bounds(122, 272, 59, 55), colour(0, 0, 0, 0), , , alpha(1) channel("image3") file("./imgs/whitelogo.jpg")
rslider bounds(26, 72, 68, 69), channel("distortion"), range(0, 5, 0, 1, 0.01), text("Distortion"), trackerColour(255, 255, 255, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255) markerColour(255, 251, 251, 255) colour(29, 28, 28, 255)
rslider bounds(206, 72, 68, 69), channel("volume"), range(0, 1, 0, 1, 0.01), text("Volume"), trackerColour(255, 255, 255, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255) markerColour(255, 255, 255, 255) colour(53, 53, 53, 255)
rslider bounds(116, 72, 68, 69), channel("cutoff"), range(75, 4000, 400, 1, 1), text("Filter"), trackerColour(255, 255, 255, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255) colour(34, 34, 34, 255) markerColour(255, 255, 255, 255) 
//button bounds(40, 276, 59, 44) channel("PlayStop1") colour:1("red") colour:0("white") text("bypass", "on")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-d -n
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1
gifn	ftgen	0,0, 257, 9, .5,1,270
gaReverb init 0

instr 1
kdist cabbageGetValue "distortion"
kvol cabbageGetValue "volume"
alevel        interp    kvol
kcut cabbageGetValue "cutoff"
kbut cabbageGetValue "button1"

a1 inch 1
a2 inch 2
   ; if kbut==1 then
aout	distort	a1, kdist , gifn	; gradually increase the distortion
afilt lowres aout, kcut, 1

		outs	afilt*alevel, afilt*alevel
    ;else
     ; outs a1,a2
      ;endif
       
      
endin
</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>