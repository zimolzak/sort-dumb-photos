#!/usr/bin/perl -w
use strict;

my @files = split(/\n/, `ls`);
my @years;
for(@files){
    next unless /\.jpg/;
    s/^\d\d\d\d(\d\d).*/$1/; # extract years: mmdd(YY)hhhh....
    push(@years, $_);
}

my @unique_years = @{uniq(\@years)};

for(@unique_years){
    (system("mkdir year" . $_) == 0) or die "Can't mkdir year $_, stopped";
    #mkdir returns 0 on success.
}

sub uniq {
    my $ref = shift;
    my @sorted = sort{$a<=>$b}(@{$ref});
    my @uniqd;
    push(@uniqd, $sorted[0]);  #index 0 alway unique
    for(my $i=1;$i<@sorted;$i++){ #start at index 1
	if($sorted[$i] != $sorted[$i-1]){
	    push(@uniqd, $sorted[$i])
	}
    }
    return \@uniqd;
}
