#include <stdio.h>

// ASM functions
extern int add(int a, int b);
extern int sub(int a, int b);
extern int mul(int a, int b);
extern int sum_array(int *arr, int n);
extern int count_even(int *arr, int n);
extern int dot_product(int *a, int *b, int n);

// =========================================
// C IMPLEMENTATION (NO ASM)
// =========================================
int sum_array_c(int *arr, int n) {
    int sum = 0;
    for(int i = 0; i < n; i++) {
        sum += arr[i];
    }
    return sum;
}
