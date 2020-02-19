// RUN: %clang_cc1 -fopenmp -ast-print %s | FileCheck %s --check-prefix=ASTPRINT

#ifndef HEADER
#define HEADER

void foo() {
// ASTPRINT: #pragma omp tile sizes(5)
#pragma omp tile sizes(5)
  for (int i = 0; i < 10; ++i)
    ;
}

#endif
