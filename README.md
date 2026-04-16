[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/f2eBoHec)
![](imagen/portadatcnm.png)

#    Tecnológico Nacional de México
#   Instituto Tecnológico de Tijuana
#        Subdirección Académica
# Departamento de Sistemas y Computación
#  Ingeniería en Sistemas Computacionales
##        LENGUAJES DE INTERFAZ
#   Profesor: MC. René Solis Reyes
#    Semestre enero - julio 2026
----
# Proyecto: Integración Python + C + ARM64 Assembly

## Autor

Ordoñez Marrufo Anthony - 23212033

## Descripción

Este proyecto implementa una librería de alto rendimiento en ARM64 Assembly, integrada con Python mediante C y ctypes.

## Objetivo

Demostrar la interoperabilidad entre lenguajes de alto y bajo nivel, así como analizar el rendimiento.

## Tecnologías

* Python 3
* C (clang)
* ARM64 Assembly (AArch64)
* Termux / Raspberry Pi OS

## Funcionalidades

* Operaciones básicas
* Procesamiento de arreglos
* Funciones optimizadas en ensamblador

## Compilación

```bash
make
```

## Ejecución

```bash
python src/app.py
```

## Resultados esperados

Comparación de rendimiento entre:

* Python
* C
* Assembly

## Conclusiones

A través de esta práctica aprendí a construir una librería de alto rendimiento integrando tres capas tecnológicas: Python como interfaz, C como puente de integración y ARM64 Assembly como motor de cómputo optimizado. Comprendí las convenciones ABI de AArch64 —el uso correcto de registros, alineación del stack y preservación de callee-saved registers—, así como el flujo completo de compilación, linkeo y depuración con GDB. También aprendí a medir y comparar el rendimiento entre las tres capas, lo que me dio una visión clara de cuándo vale la pena descender al nivel de ensamblador y cómo este tipo de arquitectura puede escalar hacia sistemas embebidos y hardware real como Raspberry Pi.

## Autorreflexión

Si volviera a realizar esta práctica, me enfocaría en dos aspectos que siento que quedaron incompletos: primero, dedicaría más tiempo a provocar y depurar errores reales en GDB —como segmentation faults y fallos de linkeo— en lugar de solo estudiarlos de forma teórica, ya que la experiencia práctica con errores es donde más se consolida el aprendizaje; segundo, implementaría al menos una función usando instrucciones NEON para experimentar de primera mano la vectorización, que en esta práctica solo abordé a nivel conceptual. En general, siento que el trabajo me dejó una base sólida, pero la profundidad real viene de repetir el ciclo con problemas más complejos.

---
