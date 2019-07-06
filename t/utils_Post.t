use strict;
use warnings;
use Test::More;

use Catalyst::Test 'Neurolandia::Catalyst';
BEGIN { use_ok('Neurolandia::Catalyst::Utils::Post') }

use Moose;
extends 'Catalyst::Controller';

my $pu = Neurolandia::Catalyst::Utils::Post->new;

isa_ok ( 'Neurolandia::Catalyst::Model::NCModel',
         $pu->get_model_object_by_id('object',
         $pu->current_post_model,
         1) );

done_testing();
