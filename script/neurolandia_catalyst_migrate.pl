#!/usr/bin/env perl

use strict;
use warnings;

system('sqlite3 ./var/database.db < ./sql/NCSchema.sql');

system("./script/neurolandia_catalyst_create.pl model NCModel DBIC::Schema NCSchema create=static 'dbi:SQLite:./var/database.db' on_connect_do='PRAGMA foreign_keys = ON'");

