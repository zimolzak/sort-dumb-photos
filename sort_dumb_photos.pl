#!/usr/bin/perl -w
use strict;

my @files = split(/\n/, `ls`);
my @years;
for(@files){
    next unless /\.jpg/;
    s/^\d\d\d\d(\d\d).*/$1/; # mmdd(YY)hhhh
    push(@years, $_);
}

my $uref = uniq(\@years);
print @{$uref};

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
