#!/usr/bin/env perl

use strict;
use warnings;
use lib 'lib';
use v5.10;
use Neurolandia::Catalyst::CLI::Migration;

my $app = Neurolandia::Catalyst::CLI::Migration->new_with_options;

if ( $app->migrate != 0 ) {
    die "[ERROR]: Cannot overwrite database\n" if $app->migrate_db != 1;
    say
        '[SUCCESS]: SQLite database migration has been successfully completed.';

    die "[Error]: Cannot overwrite schema file\n"
        if $app->migrate_schema_and_model != 1;
    say
        '[SUCCESS]: Model and Schema file(s) migration has been successfully completed.';
}

elsif ( $app->migrate != 1 && $app->rollback != 1 ) {
    $app->print_usage_text( $app->usage );
}

