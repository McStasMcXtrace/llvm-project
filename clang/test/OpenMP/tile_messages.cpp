// RUN: %clang_cc1 -triple x86_64-pc-linux-gnu -std=c++17 -fopenmp -fopenmp-version=51 -fsyntax-only -Wuninitialized -verify %s

int f();

#if 1
void syntax_errors() {
#if 1
// expected-error@+1 {{expected '('}}
#pragma omp tile sizes
  ;

// expected-error@+2 {{expected expression}}
// expected-error@+1 {{expected ')'}} expected-note@+1 {{to match this '('}}
#pragma omp tile  sizes(
   ;

// expected-error@+1 {{expected expression}}
#pragma omp tile sizes()
  ;

// expected-error@+1 {{expected ')'}} expected-note@+1 {{to match this '('}}
#pragma omp tile sizes(5
  for (int i = 0; i < 7; ++i) ;

// expected-error@+2 {{expected expression}}
// expected-error@+1 {{expected ')'}} expected-note@+1 {{to match this '('}}
#pragma omp tile sizes(5,
  ;

// expected-error@+1 {{expected expression}}
#pragma omp tile sizes(5,)
  ;

// expected-error@+2 {{expected expression}}
// expected-error@+1 {{expected ')'}} expected-note@+1 {{to match this '('}}
#pragma omp tile sizes(5+
  ;

// expected-error@+1 {{expected expression}}
#pragma omp tile sizes(5+)
  ;

  // expected-error@+1 {{expected expression}}
#pragma omp tile sizes(for)
  ;
#endif


  // expected-error@+4 {{expression is not an integral constant expression}}
  // expected-note@+3 {{read of non-const variable 'a' is not allowed in a constant expression}}
  // expected-note@+1 {{declared here}}
  int a;
#pragma omp tile sizes(a)
  ;

// expected-warning@+2 {{extra tokens at the end of '#pragma omp tile' are ignored}}
// expected-error@+1 {{directive '#pragma omp tile' requires the 'sizes' clause}}
#pragma omp tile foo
  ;



  // expected-error@+1 {{directive '#pragma omp tile' cannot contain more than one 'sizes' clause}}
#pragma omp tile sizes(5) sizes(5)
  for (int i = 0; i < 7; ++i) ;

// expected-error@+1 {{unexpected OpenMP clause 'collapse' in directive '#pragma omp tile'}}
#pragma omp tile sizes(5) collapse(2)
  for (int i = 0; i < 7; ++i) ;

// expected-error@+2 {{expected statement}}
#pragma omp tile sizes(5)
}
#endif

void semantic_errors() {
  // expected-error@+2 {{argument to 'sizes' clause must be a strictly positive integer value}}
#pragma omp tile sizes(0)
  ;


  #if 0
  // expected-warning@+2 {{extra tokens at the end of '#pragma omp tile' are ignored}}
  // expected-error@+1 {{statement after '#pragma omp tile' must be a for loop}}
#pragma omp tile sizes(5)
  ;

#pragma omp tile sizes(5,5)
  for (int i = 0; i < 7; ++i) ;

#pragma omp tile sizes(5)
  {
    for (int i = 0; i < 7; ++i);
  }

#pragma omp tile sizes(5,5)
  for (int i = 0; i < 7; ++i);
  {
    for (int j = 0; j < 7; ++j);
  }



#endif
}

