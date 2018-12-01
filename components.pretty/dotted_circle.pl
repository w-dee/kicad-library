#!/usr/bin/perl


$radius = $ARGV[0];
$segments = $ARGV[1];
$dot_percent = $ARGV[2];



for($i = 0; $i < $segments; ++ $i)
{
	$rad = 2.0 * 3.14159265358979 * $i / $segments; 


	$sx = cos($rad) * $radius;
	$sy = - sin($rad) * $radius;

	$angle = 360.0 / $segments * $dot_percent / 100.0;

	printf "(fp_arc (start 0 0) (end %.6f %.6f) (angle %.4f) (layer F.SilkS) (width 0.15)) \n",
		$sx, $sy, $angle;
}
