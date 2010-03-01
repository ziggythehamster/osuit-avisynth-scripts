# License: CC-by-SA
# (C) 2010 Keith Gable

###############################################################################
# Visual Communications - Multimedia
###############################################################################

# Notes:
# This video has a transition that looks like it was supposed to be a linear
# wipe, but it instead turned into an interlacey wipe. There's not much that
# I can do to recover the lost progressive frames, though Yadif provides a
# much better deinterlacing strategy than MCBob_EEDI does.

LoadCPlugin("C:\Program Files (x86)\AviSynth 2.5\cplugins\yadif.dll")
source = DirectShowSource("Originals\Paul Gilling\MultimediaGPPv6.avi")

# Basic changes
source = source.ConvertToYV12()
source = source.Normalize()

source = source.Crop(10,0,-6,480)			# Crop off overscan

#source = source.MCBob_EEDI()				# Deinterlace!
source = source.ColorYUV(levels = "PC->TV")	# Fix levels

# Split into clips.
clip1  = source.Trim(0, 264)				# 00:00 - 00:08 | Needs AA
clip2  = source.Trim(265, 295)				# 00:08 - 00:09 | Needs Yadif
clip3  = source.Trim(296, 731)				# 00:09 - 00:24
clip4  = source.Trim(732, 760)				# 00:24 - 00:25 | Needs Yadif
clip5  = source.Trim(761, 948)				# 00:25 - 00:31 | Needs AA
clip6  = source.Trim(949, 977)				# 00:31 - 00:32 | Needs Yadif
clip7  = source.Trim(978, 1778)				# 00:32 - 00:59
clip8  = source.Trim(1779, 1809)			# 00:59 - 01:00 | Needs Yadif
clip9  = source.Trim(1810, 1949)			# 01:00 - 01:05 | Needs AA
clip10 = source.Trim(1950, 1980)			# 01:05 - 01:06 | Needs Yadif
clip11 = source.Trim(1981, 3289)			# 01:06 - 01:49
clip12 = source.Trim(3290, 3318)			# 01:49 - 01:50 | Needs Yadif
clip13 = source.Trim(3319, 3521)			# 01:50 - 01:57 | Needs AA
clip14 = source.Trim(3522, 3549)			# 01:57 - 01:58 | Needs Yadif
clip15 = source.Trim(3550, 10960)			# 01:58 - 06:05
clip16 = source.Trim(10961, source.FrameCount) # 06:05 - 06:21 | Needs AA

# Process clips.
clip1  = clip1.MCBob_EEDI().Antialiasing()
clip2  = clip2.Yadif(3)
clip3  = clip3.MCBob_EEDI()
clip4  = clip4.Yadif(3)
clip5  = clip5.MCBob_EEDI().Antialiasing()
clip6  = clip6.Yadif(3)
clip7  = clip7.MCBob_EEDI()
clip8  = clip8.Yadif(3)
clip9  = clip9.MCBob_EEDI().Antialiasing()
clip10 = clip10.Yadif(3)
clip11 = clip11.MCBob_EEDI()
clip12 = clip12.Yadif(3)
clip13 = clip13.MCBob_EEDI().Antialiasing()
clip14 = clip14.Yadif(3)
clip15 = clip15.MCBob_EEDI()
clip16 = clip16.MCBob_EEDI().Antialiasing()

# Build output
output = clip1 + clip2 + clip3 + clip4 + clip5 + clip6 + clip7 + clip8 + clip9 + clip10 + clip11 + clip12 + clip13 + clip14 + clip15 + clip16
output = output.HQDN3D()					# Denoise the output
return output
