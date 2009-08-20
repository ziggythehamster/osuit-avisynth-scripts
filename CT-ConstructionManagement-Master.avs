# License: CC-by-SA
# (C) 2009 Keith Gable

###############################################################################
# Construction Technologies - Construction Management
###############################################################################

DirectShowSource("Originals\Paul Gilling\CONSTRUCTv5_DV25_NTSC.mov")

# Basic changes
ConvertToYV12()
Normalize()

Crop(10,0,-6,480)			# Crop off overscan

MCBob_EEDI()				# Deinterlace!
ColorYUV(levels = "PC->TV")	# Fix levels
HQDN3D()					# Denoise the output
AntiAliasing()				# Antialias the clip
