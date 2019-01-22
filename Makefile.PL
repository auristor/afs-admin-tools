# Makefile.PL for afs-admin-tools.
#
# Written by Russ Allbery <eagle@eyrie.org>
# Copyright 2011, 2013
#     The Board of Trustees of the Leland Stanford Junior University
#
# See LICENSE for licensing terms.

use 5.006;
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'afs-admin-tools',
    ABSTRACT         => 'Utilities for AFS management',
    AUTHOR           => 'Russ Allbery <eagle@eyrie.org>',
    EXE_FILES        => [ qw(frak fsr lsmounts mvto partinfo volcreate
                             volcreate-logs volnuke) ],
    VERSION_FROM     => 'VERSION',
    MIN_PERL_VERSION => 5.006,
    dist             => { COMPRESS => 'gzip', SUFFIX => 'gz' },
    BUILD_REQUIRES   => {
      'Test::MinimumVersion' => '0.1',
      'Test::Pod'            => '1.51',
      'Test::Strict'         => '0.39'
    },
    
    # ExtUtils::MakeMaker only understands this with Perl 5.10 or later.
    ## no critic (ValuesAndExpressions::ProhibitMagicNumbers)
    ($] >= 5.010 ? (LICENSE => 'perl') : ()),
);
