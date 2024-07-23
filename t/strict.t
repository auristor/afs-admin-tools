#!/usr/bin/perl
#
# Test Perl code for strict, warnings, and syntax.
#
# Written by Russ Allbery <eagle@eyrie.org>
#
# The authors hereby relinquish any claim to any copyright that they may have
# in this work, whether granted under contract or by operation of law or
# international treaty, and hereby commit to the public, at large, that they
# shall not, at any time in the future, seek to enforce any copyright in this
# work against any person or entity, or prevent any person or entity from
# copying, publishing, distributing or creating derivative works of this work.

use strict;
use warnings;

use File::Spec;
use Test::More;

# Skip tests if Test::Strict is not installed.
if (!eval { require Test::Strict }) {
    plan skip_all => 'Test::Strict required to test Perl syntax';

    # Suppress "only used once" warnings.
    $Test::Strict::TEST_WARNINGS = 0;
}
Test::Strict->import;

# Test everything in the distribution directory.  We also want to check use
# warnings.
$Test::Strict::TEST_WARNINGS = 1;
all_perl_files_ok('blib/script');
