[![Build Status](https://travis-ci.org/momozor/Neurolandia-Catalyst.svg?branch=master)](https://travis-ci.org/momozor/Neurolandia-Catalyst)
[![Kritika Analysis Status](https://kritika.io/users/faraco/repos/9904562727444606/heads/master/status.svg)](https://kritika.io/users/faraco/repos/9904562727444606/heads/master/)
[![Kritika Analysis Status](https://kritika.io/users/faraco/repos/9904562727444606/heads/master/status.svg?type=coverage)](https://kritika.io/users/faraco/repos/9904562727444606/heads/master/)
[![Kritika Analysis Status](https://kritika.io/users/faraco/repos/9904562727444606/heads/master/status.svg?type=deps)](https://kritika.io/users/faraco/repos/9904562727444606/heads/master/)

Neurolandia::Catalyst
---------------------
Neurolandia::Catalyst is a revamped version of Neurolandia Mojolicious that I made.
It is a blog with typical CRUD operations, authentication and authorization.
No registration is included due to the concept of the web app being similar to a simple
CMS application.

Requirements
------------
* (first time) Working internet connection to download Perl dependencies
from CPAN (or now, MetaCPAN)
* At least perl 5.10+
* cpanm
* (Optional) Carton

Installing Dependencies
-----------------------
Simply run `cpanm --installdeps .` or if you have Carton, run `carton install`.

Testing
-------
Neurolandia::Catalyst (NC) development sees automated testing as one of the
most important practice for better quality software.

1. First, migrate the schema by running the
./script/neurolandia_catalyst_migrate.pl script

2. Run ./script/neurolandia_catalyst_test_more.pl to run the tests *after*
you ran the migration script
    - If you want to run the tests with Carton, just add `--use_carton` flag
    to the script.

Local Server
------------
You can see how it works and looks in your browser at http://127.0.0.1:3000 by
running script/neurolandia_catalyst_server.pl.
