# License: CC-by-SA
# (C) 2009 Keith Gable

###############################################################################
# 2009 OSUIT Employee Picnic Video
###############################################################################

# I prefer Yadif for deinterlacing.
LoadCPlugin("C:\Program Files (x86)\AviSynth 2.5\cplugins\yadif.dll")

title = DirectShowSource("Originals\Employee Picnic 2009.20091016-122547.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
title = title.FadeIn(60).FadeOut(60)

# All of the clips.
clip1  = DirectShowSource("Originals\Employee Picnic 2009.20091016-113721.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip2  = DirectShowSource("Originals\Employee Picnic 2009.20091016-113758.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip3  = DirectShowSource("Originals\Employee Picnic 2009.20091016-115502.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip4  = DirectShowSource("Originals\Employee Picnic 2009.20091016-115740.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip5  = DirectShowSource("Originals\Employee Picnic 2009.20091016-121644.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip6  = DirectShowSource("Originals\Employee Picnic 2009.20091016-121719.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip6  = DirectShowSource("Originals\Employee Picnic 2009.20091016-121808.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip7  = DirectShowSource("Originals\Employee Picnic 2009.20091016-121844.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip8  = DirectShowSource("Originals\Employee Picnic 2009.20091016-122051.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip9  = DirectShowSource("Originals\Employee Picnic 2009.20091016-122643.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip10 = DirectShowSource("Originals\Employee Picnic 2009.20091016-122755.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip11 = DirectShowSource("Originals\Employee Picnic 2009.20091016-123615.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip12 = DirectShowSource("Originals\Employee Picnic 2009.20091016-124311.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip13 = DirectShowSource("Originals\Employee Picnic 2009.20091016-125121.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)
clip14 = DirectShowSource("Originals\Employee Picnic 2009.20091016-125722.00.avi").ConvertToYV12().Normalize().Crop(10,0,-6,480).ColorYUV(levels = "PC->TV").Yadif(1)

# The introduction with all of the people walking around.
intro = clip1 + clip2 
intro = intro.FadeIn(60).FadeOut(60)

# The introduction, explanation part. Family fund, tobacco cessation, spirit award, and so on...
bruce_part1 = clip3
bruce_part1 = bruce_part1.FadeIn(60).FadeOut(60)

# The spirit stuff.
spirit = clip5 + clip6 + clip7 + clip8
spirit = spirit.FadeIn(60).FadeOut(60)

# Mark Rodriguez singing his song.
mark = clip9 + clip10
mark = mark.FadeIn(60).FadeOut(60)

# Gospel singing guy whose name I can't remember.
gospelguy = clip11.Trim(0,21020)
gospelguy = gospelguy.FadeIn(60).FadeOut(60)

# Becky Mounger singing her gospel song.
becky = clip11.Trim(21020, clip11.FrameCount) + clip12.Trim(0,14350)
becky = becky.FadeIn(60).FadeOut(60)

# Sywan singing Great Balls of Fire
sywan = clip12.Trim(14400, 23160)
sywan = sywan.FadeIn(60).FadeOut(60)

# Brick House
brickhouse = clip12.Trim(23161, Clip12.FrameCount) + clip13
brickhouse = brickhouse.FadeIn(60).FadeOut(60)

# Comedy by Bob Avakian
bob = clip14.Trim(0,10890)
bob = bob.FadeIn(60).FadeOut(60)

# Patricia Hammer
patricia = clip14.Trim(10891, clip14.FrameCount)
patricia = patricia.FadeIn(60).FadeOut(60)

# Connect all of the parts together
combined = title + intro + bruce_part1 + spirit + mark + gospelguy + becky + sywan + brickhouse + bob + patricia

# Now do some final postprocessing.
denoised = combined.HQDN3D()
output = SeeSaw(combined, denoised)

return output

