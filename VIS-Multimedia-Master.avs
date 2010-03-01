# License: CC-by-SA
# (C) 2010 Keith Gable

###############################################################################
# Visual Communications - Multimedia
###############################################################################

DirectShowSource("Originals\Paul Gilling\MultimediaGPPv6.avi")

# Basic changes
ConvertToYV12()
Normalize()

Crop(10,0,-6,480)			# Crop off overscan

MCBob_EEDI()				# Deinterlace!
ColorYUV(levels = "PC->TV")	# Fix levels
HQDN3D()					# Denoise the output
