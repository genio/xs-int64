use strict;
use warnings;

use XS::Int64 ();
use Test::More;

is(XS::Int64::yay(100), 200, "yay");
done_testing();
