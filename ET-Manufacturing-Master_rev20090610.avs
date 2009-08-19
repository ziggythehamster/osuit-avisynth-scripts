# License: CC-by-SA
# (C) 2009 Keith Gable

###############################################################################
# Engineering Technologies - Manufacturing
###############################################################################

QTInput("Originals\Manufacturing 090610.mov",audio=true)

# Basic changes
ConvertToYV12()
Normalize()

Trim(0,5743)				# Remove garbage from end
Crop(10,0,-6,480)			# Crop off overscan

MCBob_EEDI()				# Deinterlace!
ColorYUV(levels = "PC->TV")	# Fix levels
HQDN3D()					# Denoise the output
