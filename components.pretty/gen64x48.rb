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
		xx = x*3.85
		yy = y*3.85
		pk = x + ((y&1)!=0? 64:0) + 1 
		pa = (y >> 1) + 200 + 1
		n = "
  (fp_line (start 1.606102 0.129696) (end 1.606102 -0.170304) (layer F.SilkS) (width 0.15))
  (fp_line (start 1.506102 0.129696) (end 1.506102 -0.170304) (layer F.SilkS) (width 0.15))
  (fp_text user #{x},#{y} (at -0.3 -1.3) (layer F.SilkS)
    (effects (font (size 0.6 0.6) (thickness 0.15)))
  )



  (pad #{pa} smd rect (at -0.55 0 90) (size 0.8 0.7) (drill (offset 0 -0.2)) (layers F.Cu F.Paste F.Mask))
  (pad #{pa} smd rect (at -0.55 0 90) (size 1.1 0.5) (layers F.Cu F.Paste F.Mask))
  (pad #{pk} smd rect (at 0.55 0 90) (size 1.1 0.5) (layers F.Cu F.Paste F.Mask))
  (pad #{pk} smd rect (at 0.55 0 90) (size 0.8 0.7) (drill (offset 0 0.2)) (layers F.Cu F.Paste F.Mask))



	"
		puts n.gsub( /\((start|end|at)\s+([-0-9.]+)\s+([-0-9.]+)/ ) { |match|
			"(#{$1} #{xx+$2.to_f} #{yy+$3.to_f}" }

	end
end


puts ")"
