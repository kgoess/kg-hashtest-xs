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
        const char * name = get_area_name_for_id(id);
        if (name == NULL){
            XSRETURN_UNDEF;
        }
        SV * nameSV = newSVpv(name, strlen(name));
        RETVAL = nameSV;
    OUTPUT:
       RETVAL

SV *
get_area_for_id(id)
        int id
    CODE:
        SV * valSV;
        SV ** stored;
        SV * blessed_area;
        SV * hashRef;
        HV * packageGlob;
        HV * areaHash = newHV();
        Area * thisArea = get_area_for_id(id);

        if (thisArea == NULL){
            XSRETURN_UNDEF;
        }

        // store the name
        valSV = newSVpv(thisArea->name, strlen(thisArea->name));
        stored = hv_store(areaHash, "name", strlen("name"), valSV, 0);

        // store the id
        // what if the strlen of the id doesn't fit in an int?
        valSV = newSViv(thisArea->id);
        stored = hv_store(areaHash, "id", strlen("id"), valSV, 0);

        // store the description
        valSV = newSVpv(thisArea->description, strlen(thisArea->description));
        stored = hv_store(areaHash, "description", strlen("description"), valSV, 0);

        // bless it into a package
        hashRef = newRV_noinc((SV*)areaHash);
        packageGlob = gv_stashpv("kg::Area", GV_ADD);
        blessed_area = sv_bless(hashRef, packageGlob);

        RETVAL = blessed_area;
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


