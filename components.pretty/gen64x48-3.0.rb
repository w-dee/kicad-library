puts <<EOF

(module "LEDMATRIX_64x48-3.0" (layer F.Cu) (tedit 5D9AC9AF)
  (descr "LED SMD 0603 (1608 Metric) 64x48 matrix, 3.0mm pitch")
  (tags "diode")
  (attr smd)
  (fp_text reference "REF**" (at -4.85 -1.9) (layer F.SilkS)
    (effects (font (size 1 1) (thickness 0.15)))
  )
  (fp_text value "LEDMATRIX_64x48-3.0" (at 0.8 -3.8) (layer F.Fab)
    (effects (font (size 1 1) (thickness 0.15)))
  )
  (fp_text user "%R" (at 0 0) (layer F.Fab)
    (effects (font (size 0.4 0.4) (thickness 0.06)))
  )

EOF

for y in (0..47) do
	for x in (0..63) do
		xx = x*3
		yy = y*3
		pk = x + ((y&1)!=0? 64:0) + 1 
		pa = (y >> 1) + 200 + 1
		n = <<"EOF"
  (fp_line (start -1.3 0.8) (end -0.85 1.25) (layer F.SilkS) (width 0.12))

  (pad #{pk} smd roundrect (at -0.556847 0.556847 45) (size 0.875 0.95) (layers "F.Cu" "F.Paste" "F.Mask") (roundrect_rratio 0.25))
  (pad #{pa} smd roundrect (at 0.556847 -0.556847 45) (size 0.875 0.95) (layers "F.Cu" "F.Paste" "F.Mask") (roundrect_rratio 0.25))


  (fp_text user "#{x},#{y}" (at -0.75 -0.75 45) (layer F.SilkS)
    (effects (font (size 0.6 0.6) (thickness 0.15)))
  )

EOF


		puts n.gsub( /\((start|end|at)\s+([-0-9.]+)\s+([-0-9.]+)/ ) { |match|
			"(#{$1} #{xx+$2.to_f} #{yy+$3.to_f}" }

	end
end


puts ")"
