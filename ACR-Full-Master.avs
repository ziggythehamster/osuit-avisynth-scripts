# License: CC-by-SA
# (C) 2009 Keith Gable

###############################################################################
# Air Conditioning and Refrigeration Technologies
###############################################################################

LoadCPlugin("C:\Program Files (x86)\AviSynth 2.5\cplugins\yadif.dll")

src = DirectShowSource("Originals\Paul Gilling\ACRTECHv8DV.mov")

# Basic changes
src = src.ConvertToYV12()
src = src.Normalize()

src = src.Crop(10,0,-6,480)				# Crop off overscan

src = src.MCBob_EEDI()					# Deinterlace!

# Break up into clips since some sections need special processing.
clip1 = src.Trim(0, 2134)				# 00:00 - 00:35
clip2 = src.Trim(2135, 2487)			# 00:35 - 00:41 | Needs additional deinterlacing (output is combed)
clip3 = src.Trim(2488, 3139)			# 00:41 - 00:52
clip4 = src.Trim(3140, 4107)			# 00:52 - 01:08 | Needs additional deinterlacing (output is combed)
clip5 = src.Trim(4108, src.FrameCount)	# 01:08 - End

# Clips that need another deinterlace pass.
clip2 = clip2.Yadif(0)
clip4 = clip4.Yadif(0)

# Assemble finished product.
finished = clip1 + clip2 + clip3 + clip4 + clip5

finished = finished.ColorYUV(levels = "PC->TV")	# Fix levels
finished = finished.HQDN3D()					# Denoise the output
finished = finished.AntiAliasing()				# Antialias the clip

return finished
