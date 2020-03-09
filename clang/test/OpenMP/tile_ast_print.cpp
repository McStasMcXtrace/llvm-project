// Check no warnings/errors
// RUN: %clang_cc1 -triple x86_64-unknown-unknown -fopenmp -fopenmp-version=51 -fsyntax-only -verify %s
// expected-no-diagnostics

// Check AST and unparsing
// RUN: %clang_cc1 -triple x86_64-unknown-unknown -fopenmp -fopenmp-version=51 -ast-dump  %s | FileCheck %s --check-prefix=DUMP
// RUN: %clang_cc1 -triple x86_64-unknown-unknown -fopenmp -fopenmp-version=51 -ast-print %s | FileCheck %s --check-prefix=PRINT

// Check same results after serialization round-trip
// RUN: %clang_cc1 -triple x86_64-unknown-unknown -fopenmp -fopenmp-version=51 -emit-pch -o %t %s
// RUN: %clang_cc1 -triple x86_64-unknown-unknown -fopenmp -fopenmp-version=51 -include-pch %t -ast-dump-all %s -fno-validate-pch | FileCheck %s --check-prefix=DUMP
// RUN: %clang_cc1 -triple x86_64-unknown-unknown -fopenmp -fopenmp-version=51 -include-pch %t -ast-print    %s -fno-validate-pch | FileCheck %s --check-prefix=PRINT

#ifndef HEADER
#define HEADER

void body(...);


// PRINT-LABEL: void foo6(
// DUMP-LABEL:  FunctionDecl {{.*}} foo6
template<typename T, T Step>
void foo6(T start, T end) {
#pragma omp tile sizes(5)
  for (int i = start; i < end; i += Step)
    body(i);
}
void tfoo6() {
  foo6<int,3>(0, 42);
}


#endif
