# License: CC-by-SA
# (C) 2009 Keith Gable

###############################################################################
# Visual Communications - Kelly Kerr on Good Day Tulsa
###############################################################################

original = DirectShowSource("Originals\VIS-KellyKerr-GDT.vob")
original = original.DelayAudio(-0.250)	# A/V sync if off in the original.

intro = original.Trim(5716, 6000)
teaser = original.Trim(20915, 21479)
segment = original.Trim(26042, 34085)

new = intro + teaser + segment

# Basic changes
new = new.ConvertToYV12()
new = new.Normalize()

new = new.Crop(10,0,-6,480)				# Crop off overscan
new = new.ColorYUV(levels = "PC->TV")	# Fix levels
new = new.HQDN3D()						# Denoise the output

return new
