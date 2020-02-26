// RUN: %clang_cc1 -triple x86_64-unknown-unknown -fopenmp -fopenmp-version=51 -fsyntax-only -verify %s
// expected-no-diagnostics

// RUN: %clang_cc1 -triple x86_64-unknown-unknown -fopenmp -fopenmp-version=51 -ast-print %s | FileCheck %s --check-prefix=PRINT
// RUN: %clang_cc1 -triple x86_64-unknown-unknown -fopenmp -fopenmp-version=51 -ast-dump  %s | FileCheck %s --check-prefix=DUMP

// RUN: %clang_cc1 -triple x86_64-unknown-unknown -fopenmp -fopenmp-version=51 -emit-pch -o %t %s
// RUN: %clang_cc1 -triple x86_64-unknown-unknown -fopenmp -fopenmp-version=51 -include-pch %t -ast-dump %s | FileCheck %s --check-prefix=DUMP

#ifndef HEADER
#define HEADER

// PRINT-LABEL: void foo(
// DUMP-LABEL:  FunctionDecl {{.*}} foo
void foo(int start, int end, int step) {
#if 0
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
#endif

  // PRINT: #pragma omp tile sizes(5, 5)
  // DUMP:      OMPTileDirective
  // DUMP-NEXT:   OMPSizesClause
  // DUMP-NEXT:     IntegerLiteral {{.*}} 5
  // DUMP-NEXT:     IntegerLiteral {{.*}} 5
  // DUMP-NEXT:   CapturedStmt
#pragma omp tile sizes(5,5)
  for (int i = 7; i < 17; i+=3)
    for (int j = 7; j < 17; j+=3)
      ;

  // PRINT: #pragma omp for
  // PRINT: #pragma omp tile sizes(5)
  // DUMP:      OMForDirective
  // DUMP:        OMPTileDirective
  // DUMP-NEXT:     OMPSizesClause
  // DUMP-NEXT:       IntegerLiteral {{.*}} 5
  // DUMP-NEXT:       IntegerLiteral {{.*}} 5
  // DUMP-NEXT:     CapturedStmt
#pragma omp for schedule
#pragma omp tile sizes(5,5)
  for (int i = 7; i < 17; i+=3)
    for (int j = 7; j < 17; j+=3)
      ;

#pragma omp for schedule collapse(3)
#pragma omp tile sizes(5,5)
  for (int i = 7; i < 17; i+=3)
    for (int j = 7; j < 17; j+=3)
      ;

#pragma omp for schedule collapse(2)
  for (int i = 7; i < 17; i+=3)
  #pragma omp tile sizes(5)
    for (int j = 7; j < 17; j+=3)
      ;
}

#endif
