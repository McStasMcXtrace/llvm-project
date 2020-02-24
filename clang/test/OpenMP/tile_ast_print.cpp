// RUN: %clang_cc1 -fopenmp -ast-print %s | FileCheck %s --check-prefix=PRINT
// RUN: %clang_cc1 -fopenmp -dump-ast %s | FileCheck %s --check-prefix=DUMP

#ifndef HEADER
#define HEADER

void foo(int start, int end, int step) {
  for (int i1 = start; i1 < end; i1+=5)
    for (int i2 = i1; i2 < i1+5 && i2 < end; i2+=1)
      ;

#pragma omp simd
  for (int i = start; i < end; i+=1)
      ;

#pragma omp for collapse(2)
  for (int i = start; i < end; i+=step)
    for (int j = start; j < end; j+=step)
      ;

// PRINT: #pragma omp tile sizes(5)
#pragma omp tile sizes(5,5)
  for (int i = 7; i < 17; i+=3)
    for (int j = 7; j < 17; j+=3)
      ;
}

#endif
