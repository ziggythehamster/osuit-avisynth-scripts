# License: CC-by-SA
# (C) 2009 Keith Gable

###############################################################################
# Visual Communications - Graphic Design
###############################################################################

DirectShowSource("Originals\Paul Gilling\GRAPHICDESIGNGPPv4.mov")

# Basic changes
ConvertToYV12()
Normalize()

Crop(10,0,-6,480)			# Crop off overscan

MCBob_EEDI()				# Deinterlace!
ColorYUV(levels = "PC->TV")	# Fix levels
HQDN3D()					# Denoise the output
