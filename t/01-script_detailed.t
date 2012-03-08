#!perl
use strict;
use warnings;
use Test::More;
use File::Basename;
use Dir::Self qw(:static);
use Data::Dumper;
use Archive::Extract;
use File::Spec;
use Config;
use Dir::Self;
use lib __DIR__;
use PkgConfigTest;

run_common("glib-2.0"); ok($RV == 0, "package name exists");

run_common("--exists glib-2.0"); ok($RV == 0, "package name (--exists)");

run_common("--libs glib-2.0"); like($S, qr/-lglib-2\.0/, "Got expected libs");
ok($S !~ /-L/, "No -L directive for standard search path");



run_common("--cflags glib-2.0");
expect_flags("-I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include",
             "Got expected include flags");

done_testing();