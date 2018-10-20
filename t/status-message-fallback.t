use strict;
use warnings;

use Test::More;
plan tests => 12;

use HTTP::Status qw(status_message status_message_fallback);

foreach my $code (100, 200, 300, 400, 500) {
    is(status_message_fallback($code), undef);
}

is(status_message_fallback(0), undef);
is(status_message_fallback(199), "OK");
is(status_message_fallback(299), "OK");
is(status_message_fallback(399), "Redirect");
is(status_message_fallback(499), "Client Error");
is(status_message_fallback(599), "Server Error");
is(status_message_fallback(600), undef);
