$name=$ARGV[0];

undef $/;
$input = <STDIN>;

$scale = 1.5/6;

print <<"EOF";

(module "$name" (layer F.Cu) (tedit 5DB7B801)
  (fp_text reference "REF**" (at -0.05 -0.85 unlocked) (layer F.SilkS) hide
    (effects (font (size 1 1) (thickness 0.15)))
  )
  (fp_text value "arUco-s-0" (at 0.05 -1.75 unlocked) (layer F.Fab) hide
    (effects (font (size 1 1) (thickness 0.15)))
  )


EOF

$input =~ /svg viewBox="0 0 (\d+) (\d+)/ or die;
$mx = - - $1;
$my = - - $2;
for($x = 0; $x < $mx; ++ $x)
{
	for($y = 0; $y < $my; ++ $y)
	{
		if($x == 0 || $y == 0 || $x == $mx - 1 || $y == $my - 1)
		{
			$x0 = $scale * $x;
			$y0 = $scale * $y;
			$x1 = $scale * ($x + 1);
			$y1 = $scale * ($y + 1);
	print "
  (fp_poly (pts (xy $x0 $y0) (xy $x1 $y0) (xy $x1 $y1) (xy $x0 $y1)) (layer F.SilkS) (width 0.01))
	";
		}
	}
	
}


while($input =~  /x="(\d+)" y="(\d+)" fill="black"/gs)
{
	$x = - - $1;
	$y = - - $2;

	$x0 = $scale * $x;
	$y0 = $scale * $y;
	$x1 = $scale * ($x + 1);
	$y1 = $scale * ($y + 1);

	print "
  (fp_poly (pts (xy $x0 $y0) (xy $x1 $y0) (xy $x1 $y1) (xy $x0 $y1)) (layer F.SilkS) (width 0.01))
	";
}


print ")\n";

