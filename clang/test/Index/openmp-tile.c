// RUN: c-index-test -test-load-source local %s -fopenmp | FileCheck %s

void test() {
#pragma omp tile sizes(5,5)
  for (int i = 0; i < 65; i += 1)
    ;
}

// CHECK: openmp-tile.c:7:15: TransformExecutableDirective= Extent=[7:15 - 7:44]
// CHECK: openmp-tile.c:7:40: BinaryOperator= Extent=[7:40 - 7:43]
// CHECK: openmp-tile.c:7:40: IntegerLiteral= Extent=[7:40 - 7:41]
// CHECK: openmp-tile.c:7:42: IntegerLiteral= Extent=[7:42 - 7:43]
