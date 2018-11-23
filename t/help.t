#!/usr/bin/perl -w
#
# t/help.t

use strict;
use Test::More tests => 8;

my @script_list = (
    'frak',
    'fsr',
    'lsmounts',
    'mvto',
    'partinfo',
    'volcreate',
    'volcreate-logs',
    'volnuke'
);

for my $script (@script_list) {
    my $out;
    $out = `$script --help 2>&1`;
    if (!ok($out =~ /^NAME/, "$script Help Switch")) {
        print('out:' . $out . "\n");
        `$script --help`;
    }
}

exit;


