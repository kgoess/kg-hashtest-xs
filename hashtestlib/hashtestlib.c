
#include <stdio.h>
#include "./hashtestlib.h"

#include "./areas_by_id.h"

    
const char * get_area_name_for_id(int id){
    if (id >= sizeof(area_by_id) / sizeof(area_by_id[0])){
        return NULL;
    }
    return area_by_id[id].name;
}

Area * get_area_for_id(int id){
    if (id >= sizeof(area_by_id) / sizeof(area_by_id[0])){
        return NULL;
    }
    return &area_by_id[id];
}
