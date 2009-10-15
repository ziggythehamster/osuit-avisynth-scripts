# License: CC-by-SA
# (C) 2009 Keith Gable

###############################################################################
# Automotive Collision Technologies - Mustang Makeover (Part 1)
###############################################################################

DirectShowSource("Originals\CollisionUpdate1-a.wmv")

# Basic changes
ConvertToYV12()
Normalize()

ColorYUV(levels = "PC->TV")	# Fix levels
HQDN3D()					# Denoise the output
