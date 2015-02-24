
#define TESTVAL 4

typedef struct
{
    const char * name;
    const int id;
    const char * description;
} Area;

extern Area * get_area_for_id(int);
extern char * get_area_name_for_id(int);
void print_twos_name(int);
