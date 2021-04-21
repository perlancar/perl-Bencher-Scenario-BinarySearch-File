package Bencher::Scenario::BinarySearch::File;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

use File::Temp qw(tempdir);
use Tie::Simple;

my $dir = tempdir(CLEANUP => !$ENV{DEBUG});
say "tempdir: $dir" if $ENV{DEBUG};

our $fh_1k_num  ; open $fh_1k_num  , ">", "$dir/1k_num"  ; for (0..       999) { print $fh_1k_num   "$_\n" } close $fh_1k_num   ; open $fh_1k_num   , "<", "$dir/1k_num";
our $fh_10k_num ; open $fh_10k_num , ">", "$dir/10k_num" ; for (0..     9_999) { print $fh_10k_num  "$_\n" } close $fh_10k_num  ; open $fh_10k_num  , "<", "$dir/10k_num";
our $fh_100k_num; open $fh_100k_num, ">", "$dir/100k_num"; for (0..    99_999) { print $fh_100k_num "$_\n" } close $fh_100k_num  ; open $fh_100k_num  , "<", "$dir/100k_num";
our $fh_1m_num  ; open $fh_1m_num  , ">", "$dir/1m_num"  ; for (0..   999_999) { print $fh_1m_num   "$_\n" } close $fh_1m_num  ; open $fh_1m_num  , "<", "$dir/1m_num";
our $fh_10m_num ; open $fh_10m_num , ">", "$dir/10m_num" ; for (0.. 9_999_999) { print $fh_10m_num  "$_\n" } close $fh_10m_num ; open $fh_10m_num , "<", "$dir/10m_num";
our $fh_100m_num; open $fh_100m_num, ">", "$dir/100m_num"; for (0..99_999_999) { print $fh_100m_num "$_\n" } close $fh_100m_num; open $fh_100m_num, "<", "$dir/100m_num";

our $scenario = {
    summary => 'Benchmark binary searching sorted lines from a file',
    participants => [
        {module=>'File::SortedSeek', name=>'File::SortedSeek-1k-num'  , code_template=>'File::SortedSeek::numeric($Bencher::Scenario::BinarySearch::File::fh_1k_num  , int (     1_000*rand()))'},
        {module=>'File::SortedSeek', name=>'File::SortedSeek-10k-num' , code_template=>'File::SortedSeek::numeric($Bencher::Scenario::BinarySearch::File::fh_10k_num , int(     10_000*rand()))'},
        {module=>'File::SortedSeek', name=>'File::SortedSeek-100k-num', code_template=>'File::SortedSeek::numeric($Bencher::Scenario::BinarySearch::File::fh_100k_num, int(    100_000*rand()))'},
        {module=>'File::SortedSeek', name=>'File::SortedSeek-1m-num'  , code_template=>'File::SortedSeek::numeric($Bencher::Scenario::BinarySearch::File::fh_1m_num  , int(  1_000_000*rand()))'},
        {module=>'File::SortedSeek', name=>'File::SortedSeek-10m-num' , code_template=>'File::SortedSeek::numeric($Bencher::Scenario::BinarySearch::File::fh_10m_num , int( 10_000_000*rand()))'},
        {module=>'File::SortedSeek', name=>'File::SortedSeek-100m-num', code_template=>'File::SortedSeek::numeric($Bencher::Scenario::BinarySearch::File::fh_100m_num, int(100_000_000*rand()))'},
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES
