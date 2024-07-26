#!/usr/bin/perl
#
# Make sure scripts return a help message
#
# Written by Bill MacAllister <bill@ca-zephyr.org>
#
# The authors hereby relinquish any claim to any copyright that they may have
# in this work, whether granted under contract or by operation of law or
# international treaty, and hereby commit to the public, at large, that they
# shall not, at any time in the future, seek to enforce any copyright in this
# work against any person or entity, or prevent any person or entity from
# copying, publishing, distributing or creating derivative works of this work.

use strict;
use warnings;

use Test::More tests => 10;

my @script_list = (
    'afs-mkmove-ro',
    'afs-mkmove-rw',
    'frak',
    'fsr',
    'lsmounts',
    'mvto',
    'partinfo',
    'volcreate',
    'volcreate-logs',
    'volnuke'
);

for my $script_name (@script_list) {
    my $script = "blib/script/$script_name";
    if (!-e $script) {
        fail('script $script missing');
        next;
    }
    my $out = `$script --help 2>&1`;
    if ($out) {
        if (!ok($out =~ /^(NAME|Usage)/, "$script Help Switch")) {
            print('out:' . $out . "\n");
            `$script --help`;
        }
    } else {
        fail("No output from $script --help");
    }
}

exit;
