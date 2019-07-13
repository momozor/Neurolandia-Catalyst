#!/usr/bin/env perl

use Modern::Perl;
use lib 'lib';
use Neurolandia::Catalyst::CLI::Testing;

my $app             = Neurolandia::Catalyst::CLI::Testing->new_with_options;
my $no_verbose_test = 'prove -wl ';
my $verbose_test    = 'prove -wlv ';

if ( $app->is_test_path_correct ) {
    if ( $app->verbose ) {
        $app->auto_execute( $verbose_test . $app->test_path );
    }
    else {
        $app->auto_execute( $no_verbose_test . $app->test_path );
    }
}

elsif ( !$app->is_test_path_correct ) {

    # TODO throw exception here or in Neurolandia::Catalyst::CLI->test_path
    die(      "[ERROR]: Test directory or file path doesn't exist! "
            . "Please make sure you use correct test directory or file path.\n"
    );
}
