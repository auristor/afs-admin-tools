#!/usr/bin/perl
#
# Make sure the perl source follows format standards.
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

for my $script_name (@script_list) {
    my $script = "blib/script/$script_name";
    if (!-e $script) {
        fail('script $script missing');
        next;
    }
    my $t = "${script}.tdy";
    my @cmd = ('perltidy');
    push @cmd, '-bbao';  # put line breaks before any operator
    push @cmd, '-nbbc';  # don't force blank lines before comments
    push @cmd, '-ce';    # cuddle braces around else
    push @cmd, '-l=79';  # don't want 79-long lines reformatted
    push @cmd, '-pt=2';  # don't add extra whitespace around parentheses
    push @cmd, '-sbt=2'; # ...or square brackets
    push @cmd, '-sfs';   # no space before semicolon in for
    push @cmd, $script;
    system(@cmd);

    @cmd = ('diff', '-u', $script, $t);
    if (system(@cmd) == 0) {
        pass("$script is Tidy");
    } else {
        fail("$script is UNTIDY");
    }
    unlink $t;
}

exit;


