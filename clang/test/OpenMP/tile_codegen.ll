; ModuleID = 'C:\Users\meinersbur\src\llvm-project\clang\test\OpenMP\tile_codegen.cpp'
source_filename = "C:\\Users\\meinersbur\\src\\llvm-project\\clang\\test\\OpenMP\\tile_codegen.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-unknown"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr global %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr global %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@2 = private unnamed_addr global %struct.ident_t { i32 0, i32 66, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8

; Function Attrs: noinline nounwind optnone
define void @_Z4foo3v() #0 {
entry:
  %.omp.iv = alloca i32, align 4
  %.floor_0.iv.i = alloca i32, align 4
  %.tile_0.iv.i = alloca i32, align 4
  %.floor_1.iv.j = alloca i32, align 4
  %.tile_1.iv.j = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %.floor_0.iv.i1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %0 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @1)
  store i32 0, i32* %.omp.lb, align 4
  store i32 0, i32* %.omp.ub, align 4
  store i32 1, i32* %.omp.stride, align 4
  store i32 0, i32* %.omp.is_last, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @0, i32 %0, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1)
  %1 = load i32, i32* %.omp.ub, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, i32* %.omp.ub, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %2, %cond.false ]
  store i32 %cond, i32* %.omp.ub, align 4
  %3 = load i32, i32* %.omp.lb, align 4
  store i32 %3, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %4 = load i32, i32* %.omp.iv, align 4
  %5 = load i32, i32* %.omp.ub, align 4
  %cmp2 = icmp sle i32 %4, %5
  br i1 %cmp2, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %6 = load i32, i32* %.omp.iv, align 4
  %mul = mul nsw i32 %6, 5
  %add = add nsw i32 0, %mul
  store i32 %add, i32* %.floor_0.iv.i1, align 4
  store i32 0, i32* %.floor_1.iv.j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc31, %omp.inner.for.body
  %7 = load i32, i32* %.floor_1.iv.j, align 4
  %cmp3 = icmp slt i32 %7, 4
  br i1 %cmp3, label %for.body, label %for.end33

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %.floor_0.iv.i1, align 4
  store i32 %8, i32* %.tile_0.iv.i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc28, %for.body
  %9 = load i32, i32* %.tile_0.iv.i, align 4
  %10 = load i32, i32* %.floor_0.iv.i1, align 4
  %add5 = add nsw i32 %10, 5
  %cmp6 = icmp slt i32 4, %add5
  br i1 %cmp6, label %cond.true7, label %cond.false8

cond.true7:                                       ; preds = %for.cond4
  br label %cond.end10

cond.false8:                                      ; preds = %for.cond4
  %11 = load i32, i32* %.floor_0.iv.i1, align 4
  %add9 = add nsw i32 %11, 5
  br label %cond.end10

cond.end10:                                       ; preds = %cond.false8, %cond.true7
  %cond11 = phi i32 [ 4, %cond.true7 ], [ %add9, %cond.false8 ]
  %cmp12 = icmp slt i32 %9, %cond11
  br i1 %cmp12, label %for.body13, label %for.end30

for.body13:                                       ; preds = %cond.end10
  %12 = load i32, i32* %.floor_1.iv.j, align 4
  store i32 %12, i32* %.tile_1.iv.j, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc, %for.body13
  %13 = load i32, i32* %.tile_1.iv.j, align 4
  %14 = load i32, i32* %.floor_1.iv.j, align 4
  %add15 = add nsw i32 %14, 5
  %cmp16 = icmp slt i32 4, %add15
  br i1 %cmp16, label %cond.true17, label %cond.false18

cond.true17:                                      ; preds = %for.cond14
  br label %cond.end20

cond.false18:                                     ; preds = %for.cond14
  %15 = load i32, i32* %.floor_1.iv.j, align 4
  %add19 = add nsw i32 %15, 5
  br label %cond.end20

cond.end20:                                       ; preds = %cond.false18, %cond.true17
  %cond21 = phi i32 [ 4, %cond.true17 ], [ %add19, %cond.false18 ]
  %cmp22 = icmp slt i32 %13, %cond21
  br i1 %cmp22, label %for.body23, label %for.end

for.body23:                                       ; preds = %cond.end20
  store i32 7, i32* %i, align 4
  %16 = load i32, i32* %.tile_0.iv.i, align 4
  store i32 %16, i32* %.tile_0.iv.i, align 4
  %17 = load i32, i32* %.tile_0.iv.i, align 4
  %mul24 = mul nsw i32 %17, 3
  %add25 = add nsw i32 7, %mul24
  store i32 %add25, i32* %i, align 4
  store i32 7, i32* %j, align 4
  %18 = load i32, i32* %.tile_1.iv.j, align 4
  store i32 %18, i32* %.tile_1.iv.j, align 4
  %19 = load i32, i32* %.tile_1.iv.j, align 4
  %mul26 = mul nsw i32 %19, 3
  %add27 = add nsw i32 7, %mul26
  store i32 %add27, i32* %j, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body23
  %20 = load i32, i32* %.tile_1.iv.j, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %.tile_1.iv.j, align 4
  br label %for.cond14

for.end:                                          ; preds = %cond.end20
  br label %for.inc28

for.inc28:                                        ; preds = %for.end
  %21 = load i32, i32* %.tile_0.iv.i, align 4
  %inc29 = add nsw i32 %21, 1
  store i32 %inc29, i32* %.tile_0.iv.i, align 4
  br label %for.cond4

for.end30:                                        ; preds = %cond.end10
  br label %for.inc31

for.inc31:                                        ; preds = %for.end30
  %22 = load i32, i32* %.floor_1.iv.j, align 4
  %add32 = add nsw i32 %22, 5
  store i32 %add32, i32* %.floor_1.iv.j, align 4
  br label %for.cond

for.end33:                                        ; preds = %for.cond
  br label %omp.body.continue

omp.body.continue:                                ; preds = %for.end33
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %23 = load i32, i32* %.omp.iv, align 4
  %add34 = add nsw i32 %23, 1
  store i32 %add34, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  call void @__kmpc_for_static_fini(%struct.ident_t* @0, i32 %0)
  call void @__kmpc_barrier(%struct.ident_t* @2, i32 %0)
  ret void
}

declare i32 @__kmpc_global_thread_num(%struct.ident_t*)

declare void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare void @__kmpc_for_static_fini(%struct.ident_t*, i32)

declare void @__kmpc_barrier(%struct.ident_t*, i32)

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (C:/Users/meinersbur/src/llvm-project/clang 108279948de31eba4f212b2a4715030b9d471c9e)"}
