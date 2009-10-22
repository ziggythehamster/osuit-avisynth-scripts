# License: CC-by-SA
# (C) 2009 Keith Gable

###############################################################################
# Automotive Service Technology - Full Overview Video (1920x1080 mixed i/p)
###############################################################################

original = QTInput("Originals\091013 Auto Overview dnxhd.mov",audio=true)

# Basics.
original = original.ConvertToYV12()
original = original.Normalize()

original = original.MCBob_EEDI()				# Deinterlace
original = original.ColorYUV(levels = "PC->TV")	# Fix levels
original = original.HQDN3D()					# Denoise

# Make 720p since the source video was 720p _anyways_
resized = original.BilinearResize(1280,720)

return resized
