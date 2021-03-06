#!/usr/bin/perl
use strict;
use warnings;
#将两次生物学重复数据合并取交集。
#选取输入文件第一个数据。

open IN, $ARGV[0] or die;
my @file1 = <IN>;
close IN;
open IN, $ARGV[1] or die;
my @file2 = <IN>;
close IN;
my @file3;
foreach my $line1 (@file1){
	my($chr1, $start1, $end1) = (split /\t/, $line1)[0,,1,2];
	foreach my $line2 (@file2){
		my($chr2, $start2, $end2) = (split /\t/, $line2)[0,1,2];
		next if $chr1 ne $chr2;
		if (($start1 >= $start2 and $start1 <= $end2) or ($end1 >= $start2 and $end1 <= $end2) or ($start1 <= $start2 and $end1 >= $end2)){
		push @file3, $line1;
		last;
		}
	}
}
print @file3;