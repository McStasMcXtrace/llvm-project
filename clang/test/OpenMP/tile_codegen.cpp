// RUN: %clang_cc1 -triple x86_64-unknown-unknown -fopenmp -fopenmp-version=51 -emit-llvm %s | FileCheck

#ifndef HEADER
#define HEADER

void body(int,int);

void foo1(int start, int end, int step) {
#if 0
#pragma omp for
  for (int i = 7; i < 17; i += 3)
    i;
#endif

#if 1
#pragma omp tile sizes(5,5)
  for (int i = 7; i < 17; i+=3)
    for (int j = 7; j < 17; j+=3)
      body(i,j);
#endif
}

#if 0
void foo2(int start, int end, int step) {
#pragma omp for
#pragma omp tile sizes(5,5)
  for (int i = 7; i < 17; i += 3)
    for (int j = 7; j < 17; j += 3)
      ;
}
#endif

#endif
