# License: CC-by-SA
# (C) 2009 Keith Gable

###############################################################################
# Culinary Arts - Part 1
###############################################################################

QTInput("Originals\Culinary 090610 Part 1.mov",audio=true)

# Basic changes
ConvertToYV12()
Normalize()

Trim(50,5189)				# Trim the first 50 frames off of the video
Crop(10,0,-6,480)			# Crop the overscan

MCBob_EEDI()				# Deinterlace!
ColorYUV(levels = "PC->TV")	# Fix the levels.
HQDN3D()					# Denoise the output.

CropBottom(2)				# Remove VCR artifacts
