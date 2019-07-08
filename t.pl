#!/usr/bin/perl

use strict;
use warnings;
use v5.10;
use Email::Valid;
         my $address = Email::Valid->address('maurice@hevane');
         say $address; 

