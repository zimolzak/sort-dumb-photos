#!/usr/bin/perl -w
use strict;

my @files = split(/\n/, `ls`);
my @years;
for(@files){
    next unless /\.jpg/;
    my $yearnum = $_; #have to be nondestructive to @files
    $yearnum =~ s/^\d\d\d\d(\d\d).*/$1/; # extract years: mmdd(YY)hhhh....
    push(@years, $yearnum);
}

my @unique_years = @{uniq(\@years)};

for(@unique_years){
    (system("mkdir year" . $_) == 0) or warn "Can't mkdir year $_, stopped";
    #mkdir returns 0 on success.
}

for(@files){ #requires this second pass
    next unless /\.jpg/;
    my $dir = $_;
    $dir =~ s/^\d\d\d\d(\d\d).*/year$1/;
    (system("mv $_ $dir") == 0) or die "Can't mv $_ $dir, stopped";
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
