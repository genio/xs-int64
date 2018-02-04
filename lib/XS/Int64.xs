#define PERL_NO_GET_CONTEXT 1
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <assert.h>
#include <stdlib.h>
#include <stdint.h>

#include "perl_math_int64_types.h"
#define MATH_INT64_NATIVE_IF_AVAILABLE
#include "perl_math_int64.h"

MODULE = XS::Int64             PACKAGE = XS::Int64      PREFIX = xs_int64_

PROTOTYPES: ENABLE

BOOT:
{
    PERL_MATH_INT64_LOAD_OR_CROAK;
}

uint64_t xs_int64_yay(uint64_t test)
    CODE:
        RETVAL = test + 100;
    OUTPUT:
    RETVAL
