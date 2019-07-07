#!/usr/bin/env perl

use strict;
use warnings;

my $option = $ARGV[0] ||= '';
if ( $option eq '-v' || $option eq '--verbose' ) {
    system('prove -wlv ./t');
}
else {
    system('prove -wl ./t');
}
