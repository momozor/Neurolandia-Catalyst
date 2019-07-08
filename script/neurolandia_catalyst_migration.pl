#!/usr/bin/env perl

use strict;
use warnings;

my $sql_file_path   = './sql/NCSchema.sql';
my $sqlite_var_path = './var';
my $sqlite_db_path  = "$sqlite_var_path/database.db";
my $dsn             = $ENV{NEUROLANDIA_DSN} ||= "dbi:SQLite:$sqlite_db_path";
my $user            = $ENV{NEUROLANDIA_USER} ||= '';
my $password        = $ENV{NEUROLANDIA_PASSWORD} ||= '';

if ( $user eq '' || $password eq '' ) {
    die
        "sqlite database in ./var/ already exists! Please remove it manually to continue!\n"
        if -f $sqlite_db_path;
    mkdir($sqlite_var_path) if ( !-d $sqlite_var_path );
    system("sqlite3 $sqlite_db_path < $sql_file_path");
}
system(
    "./script/neurolandia_catalyst_create.pl model NCModel DBIC::Schema NCSchema "
        . "create=static '$dsn' on_connect_do='PRAGMA foreign_keys = ON'" );

