# License: CC-by-SA
# (C) 2009 Keith Gable

###############################################################################
# Culinary Arts Discover Oklahoma Video
###############################################################################

LoadPlugin("C:\Program Files (x86)\DGMPGDec\DGDecode.dll")

video = MPEG2Source("Originals\CUA-DiscoverOklahoma.d2v", cpu=6, iPP=true)
audio = DirectShowSource("Originals\CUA-DiscoverOklahoma T80 2_0ch 256Kbps DELAY 130ms.ac3", video=false)
original = AudioDub(video, audio)

original = original.ConvertToYV12().Normalize()		# Basic changes

intro = FadeOut(original.Trim(5958,6870), 30)

blackout_audio = original.Trim(12680, 12691)
blackout_video = BlankClip(original, length=11)
blackout = AudioDub(blackout_video, blackout_audio)

segment = FadeIn(original.Trim(12692,19623), 30)

output = intro + blackout + segment
output = output.MCBob_EEDI()					# Deinterlace
output = output.Crop(10,60,-6,-60)				# Crop off overscan and hard letterboxing
output = output.ColorYUV(levels = "PC->TV")		# Fix levels
output = output.HQDN3D()						# Denoise the output
output = output.MSharpen()						# Sharpen the output

return output
