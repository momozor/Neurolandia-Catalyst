#!/usr/bin/env perl

use strict;
use warnings;
use lib 'lib';
use Neurolandia::Catalyst::CLI;

my $app             = Neurolandia::Catalyst::CLI->new_with_options;
my $no_verbose_test = 'prove -wl ';
my $verbose_test    = 'prove -wlv ';

if ( $app->is_test_path_correct && $app->use_carton ) {
    if ( $app->verbose ) {
        $app->carton_execute( $verbose_test . $app->test_path );
    }
    else {
        $app->carton_execute( $no_verbose_test . $app->test_path );
    }
}

elsif ( $app->is_test_path_correct && !$app->use_carton ) {
    if ( $app->verbose ) {
        system( $verbose_test . $app->test_path );
    }
    else {
        system( $no_verbose_test . $app->test_path );
    }
}

elsif ( !$app->is_test_path_correct ) {

   # TODO throw exception here or in Neurolandia::Catalyst::CLI->test_dir_path
    die(      "[ERROR]: Test directory doesn't exist! "
            . "Please make sure you use correct test directory or file path.\n"
    );
}
