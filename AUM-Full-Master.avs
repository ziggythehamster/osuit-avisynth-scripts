# License: CC-by-SA
# (C) 2009 Keith Gable

###############################################################################
# Automotive Service Technology - Full Overview Video
###############################################################################

QTInput("Originals\091013 Auto Overview dnxhd.mov",audio=true)

# Basics.
ConvertToYV12()
Normalize()

Crop(10,0,-6,480)			# Crop off overscan

MCBob_EEDI()				# Deinterlace
ColorYUV(levels = "PC->TV")	# Fix levels
HQDN3D()					# Denoise
