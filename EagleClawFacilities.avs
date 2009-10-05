# License: CC-by-SA
# (C) 2009 Keith Gable

###############################################################################
# Eagle Claw Facilties Video
###############################################################################

original = DirectShowSource("Originals\EagleClawFacilities.vob")

original = original.ConvertToYV12().Normalize()		# Basic changes
original = original.Crop(10,0,-6,480)				# Crop off overscan
original = original.ColorYUV(levels = "PC->TV")		# Fix levels

# Split into sections
intro = original.Trim(0,546)
needs_rainbow_fix = original.Trim(547,2465) 
rest = original.Trim(2466, original.FrameCount)

# Derainbow
needs_rainbow_fix = needs_rainbow_fix.DeHalo_alpha()
needs_rainbow_fix = needs_rainbow_fix.LUTDeRainbow(cthresh=10, y=false)
needs_rainbow_fix = needs_rainbow_fix.DFMDeRainbow()

# Process output
output = intro + needs_rainbow_fix + rest
output = output.HQDN3D()

return output
