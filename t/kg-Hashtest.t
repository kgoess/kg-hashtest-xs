# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl kg-Hashtest.t'

#########################

# change 'tests => 2' to 'tests => last_test_to_print';

use strict;
use warnings;
use Data::Dump qw/dump/;

use Test::More tests => 4;
use kg::Hashtest;


diag "easy method, just return the name";

is kg::Hashtest::get_area_name_for_id(2), 'Canada', "canada is #2!!";

ok ! kg::Hashtest::get_area_name_for_id(99999), "don't segfault if item not found" ;

my $hash = kg::Hashtest::get_area_for_id(2);
my $expected = { description => "Canada is #2!", id => 2, name => "Canada" };
is_deeply $hash, $expected or dump $hash;

ok ! kg::Hashtest::get_area_for_id(99999), "don't segfault if item not found" ;
