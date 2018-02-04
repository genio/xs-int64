use strict;
use warnings;

use ExtUtils::MakeMaker;

use Config;
use ExtUtils::Depends ();

# Some options behave differently on Windows
sub WINLIKE () {
    return 1 if $^O eq 'MSWin32';
    return 1 if $^O eq 'cygwin';
    return 1 if $^O eq 'msys';
    return '';
}

my %xsbuild = (
    XSMULTI => 1,
    XSBUILD  => {
        'lib/UV' => {
          OBJECT => 'lib/UV$(OBJ_EXT) lib/perl_math_int64$(OBJ_EXT)',
        },
    },
    OBJECT  => '$(O_FILES)',
);

my %WriteMakefileArgs = (
  "ABSTRACT" => "Perl XS Code for Int64",
  "AUTHOR" => "Chase Whitener <capoeirab\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Config" => 0,
    "ExtUtils::MakeMaker" => "7.12",
    "Math::Int64" => 0,
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "7.12",
    "Math::Int64" => 0
  },
  "DISTNAME" => "XS-Int64",
  "LICENSE" => "perl",
  "NAME" => "XS::Int64",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Exporter" => "5.57",
    "Math::Int64" => 0,
    "XSLoader" => "0.14",
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Errno" => 0,
    "ExtUtils::MakeMaker" => "7.12",
    "File::Spec" => 0,
    "FindBin" => 0,
    "Test::More" => "0.88",
  },
  "VERSION" => "1.000006",
  "test" => {
    "TESTS" => "t/*.t"
  }
);

%WriteMakefileArgs = (
    %WriteMakefileArgs,
    %xsbuild,
);

my %FallbackPrereqs = (
  "Carp" => 0,
  "Config" => 0,
  "Errno" => 0,
  "Exporter" => "5.57",
  "ExtUtils::MakeMaker" => "7.12",
  "File::Spec" => 0,
  "FindBin" => 0,
  "Math::Int64" => 0,
  "Test::More" => "0.88",
  "Try::Tiny" => 0,
  "XSLoader" => "0.14",
  "parent" => 0,
  "strict" => 0,
  "warnings" => 0
);

unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
