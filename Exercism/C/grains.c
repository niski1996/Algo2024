#include <stdio.h>
#include <math.h>

unsigned long long square(int base){
    return base * base;
}

unsigned long long total(int base){
    return pow(2, base+1);
    
}