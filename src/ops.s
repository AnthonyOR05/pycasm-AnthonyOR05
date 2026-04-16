// ============================================================
//   PROGRAM HEADER GENERATOR PRO :: ARM64 MODULE
// ============================================================
//
// 📁 Archivo: ops.s
// 🧠 Módulo: ARM64 HIGH PERFORMANCE OPS LIBRARY
// 🎓 Asignatura: Lenguajes de Interfaz (TECNM Campus ITT)
// 👤 Autor: Ordoñez Marrufo Anthony - 23212033
// 📅 Fecha: 2026/04/16
//
// 💡 Descripción:
// Biblioteca de funciones en ensamblador ARM64 para operaciones
// aritméticas y procesamiento de arreglos en alto rendimiento.
// Incluye suma, resta, multiplicación, suma de arreglos,
// conteo de números pares y producto punto.
//
// ============================================================
// =========================================
// ARM64 HIGH PERFORMANCE OPS LIBRARY
// Archivo: ops.s
// =========================================

    .text
    .global add
    .global sub
    .global mul
    .global sum_array
    .global count_even
    .global dot_product

// -----------------------------------------
// int add(int a, int b)
// x0=a, x1=b → x0
// -----------------------------------------
add:
    add x0, x0, x1
    ret

// -----------------------------------------
// int sub(int a, int b)
// -----------------------------------------
sub:
    sub x0, x0, x1
    ret

// -----------------------------------------
// int mul(int a, int b)
// -----------------------------------------
mul:
    mul x0, x0, x1
    ret

// -----------------------------------------
// int sum_array(int *arr, int n)
// x0 = ptr, x1 = n
// -----------------------------------------
sum_array:
    mov x2, #0          // sum = 0
    mov x3, #0          // i = 0

loop_sum:
    cmp x3, x1
    b.ge end_sum

    ldr w4, [x0, x3, lsl #2]
    add x2, x2, x4
    add x3, x3, #1
    b loop_sum

end_sum:
    mov x0, x2
    ret

// -----------------------------------------
// int count_even(int *arr, int n)
// -----------------------------------------
count_even:
    mov x2, #0
    mov x3, #0

loop_even:
    cmp x3, x1
    b.ge end_even

    ldr w4, [x0, x3, lsl #2]
    and w5, w4, #1
    cbnz w5, skip

    add x2, x2, #1

skip:
    add x3, x3, #1
    b loop_even

end_even:
    mov x0, x2
    ret

// -----------------------------------------
// int dot_product(int *a, int *b, int n)
// -----------------------------------------
dot_product:
    mov x3, #0
    mov x4, #0

loop_dot:
    cmp x3, x2
    b.ge end_dot

    ldr w5, [x0, x3, lsl #2]
    ldr w6, [x1, x3, lsl #2]

    mul w7, w5, w6
    add x4, x4, x7

    add x3, x3, #1
    b loop_dot

end_dot:
    mov x0, x4
    ret
