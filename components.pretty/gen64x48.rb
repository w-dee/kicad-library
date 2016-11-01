puts("

(module LED1608_Handsoldering (layer F.Cu) (tedit 5817EB35)
  (fp_text reference REF** (at -1.9 0.15 90) (layer F.SilkS)
    (effects (font (size 1 1) (thickness 0.15)))
  )
  (fp_text value LED1608_Handsoldering (at -0.8 -3) (layer F.Fab)
    (effects (font (size 1 1) (thickness 0.15)))
  )

 ")
for y in (0..47) do
	for x in (0..63) do
		xx = x*4
		yy = y*4
		pk = x + ((y&1)!=0? 64:0) + 1 
		pa = (y >> 1) + 200 + 1
		n = "

  (fp_line (start -1.093898 0.129696) (end -1.093898 -0.170304) (layer F.SilkS) (width 0.15))
  (fp_line (start -1.193898 0.129696) (end -1.193898 -0.170304) (layer F.SilkS) (width 0.15))
  (pad #{pa} smd rect (at -0.293898 -0.020304 90) (size 0.8 0.8) (layers F.Cu F.Paste F.Mask))
  (pad #{pa} smd rect (at -0.043898 -0.020304 90) (size 1.4 0.4) (layers F.Cu F.Paste F.Mask))
  (pad #{pk} smd rect (at 1.056102 -0.020304 90) (size 1.4 0.4) (layers F.Cu F.Paste F.Mask))
  (pad #{pk} smd rect (at 1.306102 -0.020304 90) (size 0.8 0.8) (layers F.Cu F.Paste F.Mask))
	"
		puts n.gsub( /\((start|end|at)\s+([-0-9.]+)\s+([-0-9.]+)/ ) { |match|
			"(#{$1} #{xx+$2.to_f} #{yy+$3.to_f}" }

	end
end


puts ")"
