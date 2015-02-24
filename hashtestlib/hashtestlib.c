
#include <stdio.h>
#include "./hashtestlib.h"

Area area_by_id[] = 
{
   { "Area0",     0, "there is no zero" },
   { "Bay Area",  1, "Go, Giants!" },
   { "Canada",    2, "Canada is #2!" },
   { "Manhattan", 3, "I'll take Manhattan" },
   { "San Diego", 4, "Actually, the Niners are here now" }
};
    
char * get_area_name_for_id(int id){
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
