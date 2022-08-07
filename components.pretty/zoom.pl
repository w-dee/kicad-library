
undef $/;

$input = <STDIN>;

$input =~ s/(start|end|xy)\s+([0-9.-]+)\s+([0-9.-]+)/"$1 ". (- -$2)*2 ." " .(- -$3)*2 . " "/egs;

print $input;


