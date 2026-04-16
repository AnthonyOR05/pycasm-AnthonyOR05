/* ============================================================
   PROGRAM HEADER GENERATOR PRO :: C BRIDGE MODULE
   ============================================================

📁 Archivo: bridge.c
🎓 Asignatura: Lenguajes de Interfaz (TECNM Campus ITT)
👤 Autor: Ordoñez Marrufo Anthony - 23212033
📅 Fecha: 2026/04/16

💡 Descripción:
Módulo en C que actúa como puente entre Python y código ASM,
gestionando llamadas, memoria y comunicación de bajo nivel.

============================================================ */
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
