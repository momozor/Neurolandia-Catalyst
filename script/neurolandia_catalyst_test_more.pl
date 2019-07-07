#!/usr/bin/env perl

use strict;
use warnings;
use lib 'lib';
use Neurolandia::Catalyst::CLI;

my $app = Neurolandia::Catalyst::CLI->new_with_options;

if ( $app->is_test_path_correct ) {

    if ( $app->verbose ) {
        system( 'prove -wlv ' . $app->test_dir_path );
    }
    else {
        system( 'prove -wl ' . $app->test_dir_path );
    }
}
else {
   # TODO throw exception here or in Neurolandia::Catalyst::CLI->test_dir_path
    die(      "[ERROR]: Test directory doesn't exist! "
            . "Please make sure you use correst test directory path.\n" );
}
