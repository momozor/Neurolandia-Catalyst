#!/usr/bin/env perl

use Modern::Perl;
use lib 'lib';
use v5.10;
use Neurolandia::Catalyst::CLI::Migration;

my $app = Neurolandia::Catalyst::CLI::Migration->new_with_options;

sub run_create_tables_db {
    die "[ERROR]: Cannot overwrite database\n" if !$app->migrate_db;
    say
        '[SUCCESS]: SQLite database table migration has been successfully completed.';
}

sub run_model_and_schema_migration {
    if ( !$app->migrate_schema_and_model ) {
        warn "[WARNING]: Cannot overwrite schema file!\n";
    }
    else {
        say
            '[SUCCESS]: Model and Schema file(s) migration has been successfully completed.';
    }
}

sub run_populate_created_tables_db {
    die "[ERROR]: Cannot populated SQLite database with test fixtures!\n "
        if !$app->populate_db;
    say '[SUCCESS]: SQLite database has been populated with test fixtures.';
}

if ( $app->migrate ) {
    run_create_tables_db;
    run_model_and_schema_migration;
}

elsif ( $app->migrate_and_populate ) {
    run_create_tables_db;
    run_populate_created_tables_db;

    # need to be last because most of the time
    # nobody would delete the model and schema files
    # just to create tables and populate the tables
    # this also will result into unpopulated database
    # which controller_post.t depends on to run properly
    run_model_and_schema_migration;
}

elsif (!$app->migrate
    && !$app->migrate_and_populate )
{
    $app->print_usage_text( $app->usage );
}

