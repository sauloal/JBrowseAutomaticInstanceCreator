#!/usr/bin/perl
#https://bash.cyberciti.biz/web-server/htpasswd-replacement-perl-script/

use strict;
my $passWord=$ARGV[0];
print crypt($passWord,$passWord)."\n";
