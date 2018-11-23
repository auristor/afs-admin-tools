#!/usr/bin/perl -w
#
# t/perltidy.t

use Test::More tests => 8;
use strict;

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


