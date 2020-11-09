use strict;
use warnings;
use lib 'lib';

use Neurolandia::Catalyst;

my $app = Neurolandia::Catalyst->apply_default_middlewares(Neurolandia::Catalyst->psgi_app);
$app;

