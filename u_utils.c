#include "u_utils.h"

int U_RandomRangeui(unsigned int min, unsigned int max){
    srand(time(0));
    return rand() % (max - min + 1) + min;
}