QTInput("Originals\POWER PLANT 090610.mov",audio=true)
ConvertToYV12()
Normalize()

MCBob_EEDI()
ColorYUV(levels = "PC->TV")
HQDN3D()
