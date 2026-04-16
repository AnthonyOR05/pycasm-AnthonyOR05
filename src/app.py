# ============================================================
#   PROGRAM HEADER GENERATOR PRO :: PYTHON MODULE
# ============================================================

# 📁 Archivo: app.py
# 🎓 Asignatura: Lenguajes de Interfaz (TECNM Campus ITT)
# 👤 Autor: Ordoñez Marrufo Anthony - 23212033
# 📅 Fecha: 2026/04/16
#
# 💡 Descripción:
# Interfaz en Python para ejecutar y gestionar código ensamblador (ASM)
# mediante llamadas al sistema y control de procesos.
#
# ============================================================
# =========================================
# ARM64 HIGH PERFORMANCE OPS LIBRARY
# Archivo: app.py
# =========================================

import ctypes
import time
import random

lib = ctypes.CDLL("./build/libops.so")

# -----------------------------------------
# Firmas
# -----------------------------------------
lib.add.argtypes = [ctypes.c_int, ctypes.c_int]
lib.add.restype = ctypes.c_int

lib.sum_array.argtypes = [ctypes.POINTER(ctypes.c_int), ctypes.c_int]
lib.sum_array.restype = ctypes.c_int

lib.sum_array_c.argtypes = [ctypes.POINTER(ctypes.c_int), ctypes.c_int]
lib.sum_array_c.restype = ctypes.c_int

# -----------------------------------------
# Python puro
# -----------------------------------------
def sum_array_py(arr):
    total = 0
    for x in arr:
        total += x
    return total

# -----------------------------------------
# Benchmark
# -----------------------------------------
def benchmark():
    print("\n===== BENCHMARK =====")

    arr = [random.randint(1, 100) for _ in range(100000)]
    c_arr = (ctypes.c_int * len(arr))(*arr)

    # -------------------------
    # Python
    # -------------------------
    start = time.time()
    result_py = sum_array_py(arr)
    end = time.time()
    time_py = end - start

    print("Python resultado:", result_py)
    print("Python tiempo:", time_py)

    # -------------------------
    # C
    # -------------------------
    start = time.time()
    result_c = lib.sum_array_c(c_arr, len(arr))
    end = time.time()
    time_c = end - start

    print("\nC resultado:", result_c)
    print("C tiempo:", time_c)

    # -------------------------
    # ASM
    # -------------------------
    start = time.time()
    result_asm = lib.sum_array(c_arr, len(arr))
    end = time.time()
    time_asm = end - start

    print("\nASM resultado:", result_asm)
    print("ASM tiempo:", time_asm)

    # -------------------------
    # Validación
    # -------------------------
    if result_py == result_c == result_asm:
        print("\nOK: todos los resultados coinciden")
    else:
        print("\nERROR: resultados diferentes")

    # -------------------------
    # Tabla final
    # -------------------------
    print("\n===== TABLA =====")
    print("Python:", time_py)
    print("C:", time_c)
    print("ASM:", time_asm)


# -----------------------------------------
# MAIN
# -----------------------------------------
print("Add:", lib.add(10, 20))
benchmark()
