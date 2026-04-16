#include <stdio.h>

// =========================================
// Declaración de funciones en ASM / C
// =========================================
extern int add(int a, int b);
extern int sub(int a, int b);
extern int mul(int a, int b);
extern int sum_array(int *arr, int n);
extern int sum_array_c(int *arr, int n);

// =========================================
// MAIN - Punto de entrada para GDB
// =========================================
int main() {

    // -------------------------------------
    // TEST 1: operaciones simples ASM
    // -------------------------------------
    int a = 10;
    int b = 20;

    int r_add = add(a, b);
    int r_sub = sub(a, b);
    int r_mul = mul(a, b);

    printf("\n=== OPERACIONES BASICAS ===\n");
    printf("add: %d\n", r_add);
    printf("sub: %d\n", r_sub);
    printf("mul: %d\n", r_mul);

    // -------------------------------------
    // TEST 2: arrays (ASM vs C)
    // -------------------------------------
    int arr[5] = {1, 2, 3, 4, 5};

    int r_c = sum_array_c(arr, 5);
    int r_asm = sum_array(arr, 5);

    printf("\n=== SUMA ARRAY ===\n");
    printf("C   : %d\n", r_c);
    printf("ASM : %d\n", r_asm);

    // -------------------------------------
    // VALIDACIÓN SIMPLE
    // -------------------------------------
    if (r_c == r_asm) {
        printf("\nOK: ASM coincide con C\n");
    } else {
        printf("\nERROR: diferencia entre ASM y C\n");
    }

    return 0;
}
