#include <stdio.h>
#include <stdbool.h>

int sum_of_squares(int quantity){
    int i, sumSquare = 0;
    for (i=0; i<=quantity; i++){
        sumSquare += i*i;
    }
    return sumSquare;
}
int square_of_sum(int quantity){
    int i, squareSum = 0;
    for (i=0; i<=quantity; i++){
        squareSum +=1;
    }
    return squareSum*squareSum;
}
int difference_of_squares(int quantity){

    return square_of_sum(quantity)- sum_of_squares(quantity);
}