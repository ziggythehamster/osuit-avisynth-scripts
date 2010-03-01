QTInput("Originals\EEI & INS 090610.mov",audio=true)
ConvertToYV12()
Normalize()

MCBob_EEDI()
ColorYUV(levels = "PC->TV")
HQDN3D()
