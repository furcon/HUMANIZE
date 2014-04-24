package HUMANIZE;

use POSIX;

use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(file_size);

#Acknowledment: inspired by HumanizeJS, a github project
#https://raw.github.com/milanvrekic/JS-humanize/master/humanize.js


sub number_format {
	my $number = shift;
	my $decimal = shift;
	my $format = "%.".$decimal."f";

	return sprintf $format, $number;
}

#standard used: kilo-byte  = 2 ^ 10 bytes 
sub file_size {
	my $filesize = shift;

	if($filesize >= 1125899906842624) {
		$filesize = number_format($filesize / 1125899906842624,2). " Pb";#peta byte
	}	
	elsif($filesize >= 1099511627776) {
 		$filesize = number_format($filesize / 1099511627776, 2) . " Tb";#tera byte
	}
	elsif ($filesize >= 1073741824) {
		 $filesize = number_format($filesize / 1073741824, 2) . " Gb";
	} 
	elsif ($filesize >= 1048576) {
	 	$filesize = number_format($filesize / 1048576, 2) . " Mb";
   	} 
	elsif ($filesize >= 1024) {
		$filesize = number_format($filesize / 1024, 2) . " Kb";
  	} 
	else {
		$filesize = number_format($filesize, 2) . " bytes";
	}
	
	return $filesize;
}



1;
