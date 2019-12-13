[![Build Status](https://travis-ci.org/momozor/Neurolandia-Catalyst.svg?branch=master)](https://travis-ci.org/momozor/Neurolandia-Catalyst)
[![codecov](https://codecov.io/gh/momozor/Neurolandia-Catalyst/branch/master/graph/badge.svg)](https://codecov.io/gh/momozor/Neurolandia-Catalyst)

Neurolandia::Catalyst
---------------------
Neurolandia::Catalyst is a revamped version of [Neurolandia Mojolicious](https://github.com/momozor/neurolandia)
that I made. It is a project with typical CRUD operations, authentication and authorization and heavy test
suites.

Requirements
------------
* (first time) Working internet connection to download Perl dependencies
from CPAN (or now, MetaCPAN)
* At least perl 5.22+
* cpanm
* sqlite3
* (Optional) Carton

Installing Dependencies
-----------------------
Simply run `cpanm --installdeps .` or if you have Carton, run `carton install`.

Testing
-------
Neurolandia::Catalyst (NC) development sees automated testing as one of the
most important practice for a better quality software. Getting test coverage
over 60% is also a priority.

1. First, migrate the default database, schema and model by running the
`./script/neurolandia_catalyst_migration.pl --migrate_and_populate` (requires sqlite3 binary)
    - You will get a warning telling that you cannot overwrite schema files. This is fine. Ignore it.
        - Overwrite option will be included soon with this migration helper script.
    - If you want to run the migration with carton, just add `--use_carton`
    flag as the script argument. 

2. Run `./script/neurolandia_catalyst_test_more.pl` to run the tests *after*
you ran the migration script
    - Just like the migration script above, add `--use_carton` to run tests
    with carton.

Local Server
------------
You can see how it works and looks in your browser at http://127.0.0.1:3000 by
running script/neurolandia_catalyst_server.pl.
