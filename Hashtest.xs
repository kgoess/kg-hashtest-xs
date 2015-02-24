#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <hashtestlib/hashtestlib.h>

#include "const-c.inc"

MODULE = kg::Hashtest		PACKAGE = kg::Hashtest		

INCLUDE: const-xs.inc

SV *
get_area_name_for_id(id)
       int             id
    CODE:
        char * name = get_area_name_for_id(id);
        if (name == NULL){
            XSRETURN_UNDEF;
        }
        SV * nameSV = newSVpv(name, strlen(name));
        RETVAL = nameSV;
    OUTPUT:
       RETVAL

HV *
get_area_for_id(id)
        int id
    CODE:
        SV * valSV;
        SV ** stored;
        HV * areaHash = newHV();
        Area * thisArea = get_area_for_id(id);

        if (thisArea == NULL){
            XSRETURN_UNDEF;
        }

        valSV = newSVpv(thisArea->name, strlen(thisArea->name));
        stored = hv_store(areaHash, "name", strlen("name"), valSV, 0);

        // what if the strlen of the id doesn't fit in an int?
        valSV = newSViv(thisArea->id);
        stored = hv_store(areaHash, "id", strlen("id"), valSV, 0);


        valSV = newSVpv(thisArea->description, strlen(thisArea->description));
        stored = hv_store(areaHash, "description", strlen("description"), valSV, 0);

    RETVAL = areaHash;
    OUTPUT:
        RETVAL

void
print_twos_name(id)
        int       id
    OUTPUT:

#TYPEMAP: <<END
#const Area *    T_HV
#END

#TYPEMAP: <<END
#const char *    T_PV
#END


