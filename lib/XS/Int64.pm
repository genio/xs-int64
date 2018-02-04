package XS::Int64;

our $VERSION = '0.001';
our $XS_VERSION = $VERSION;

use strict;
use warnings;

use Exporter qw(import);
use Math::Int64 ();
require XSLoader;
XSLoader::load('XS::Int64', $XS_VERSION);

1;
