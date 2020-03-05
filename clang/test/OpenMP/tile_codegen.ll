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
define void @_Z4foo4v() #0 {
entry:
  %.omp.iv = alloca i32, align 4
  %.floor_0.iv.i = alloca i32, align 4
  %.tile_0.iv.i = alloca i32, align 4
  %.floor_1.iv.j = alloca i32, align 4
  %.tile_1.iv.j = alloca i32, align 4
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %k = alloca i32, align 4
  %.floor_0.iv.i2 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %0 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @1)
  store i32 0, i32* %.omp.lb, align 4
  store i32 3, i32* %.omp.ub, align 4
  store i32 1, i32* %.omp.stride, align 4
  store i32 0, i32* %.omp.is_last, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @0, i32 %0, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1)
  %1 = load i32, i32* %.omp.ub, align 4
  %cmp = icmp sgt i32 %1, 3
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, i32* %.omp.ub, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 3, %cond.true ], [ %2, %cond.false ]
  store i32 %cond, i32* %.omp.ub, align 4
  %3 = load i32, i32* %.omp.lb, align 4
  store i32 %3, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %4 = load i32, i32* %.omp.iv, align 4
  %5 = load i32, i32* %.omp.ub, align 4
  %cmp3 = icmp sle i32 %4, %5
  br i1 %cmp3, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %6 = load i32, i32* %.omp.iv, align 4
  %div = sdiv i32 %6, 1
  %mul = mul nsw i32 %div, 3
  %add = add nsw i32 7, %mul
  store i32 %add, i32* %k, align 4
  %7 = load i32, i32* %.omp.iv, align 4
  %8 = load i32, i32* %.omp.iv, align 4
  %div4 = sdiv i32 %8, 1
  %mul5 = mul nsw i32 %div4, 1
  %sub = sub nsw i32 %7, %mul5
  %mul6 = mul nsw i32 %sub, 5
  %add7 = add nsw i32 0, %mul6
  store i32 %add7, i32* %.floor_0.iv.i2, align 4
  store i32 0, i32* %.floor_1.iv.j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc36, %omp.inner.for.body
  %9 = load i32, i32* %.floor_1.iv.j, align 4
  %cmp8 = icmp slt i32 %9, 4
  br i1 %cmp8, label %for.body, label %for.end38

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %.floor_0.iv.i2, align 4
  store i32 %10, i32* %.tile_0.iv.i, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc33, %for.body
  %11 = load i32, i32* %.tile_0.iv.i, align 4
  %12 = load i32, i32* %.floor_0.iv.i2, align 4
  %add10 = add nsw i32 %12, 5
  %cmp11 = icmp slt i32 4, %add10
  br i1 %cmp11, label %cond.true12, label %cond.false13

cond.true12:                                      ; preds = %for.cond9
  br label %cond.end15

cond.false13:                                     ; preds = %for.cond9
  %13 = load i32, i32* %.floor_0.iv.i2, align 4
  %add14 = add nsw i32 %13, 5
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false13, %cond.true12
  %cond16 = phi i32 [ 4, %cond.true12 ], [ %add14, %cond.false13 ]
  %cmp17 = icmp slt i32 %11, %cond16
  br i1 %cmp17, label %for.body18, label %for.end35

for.body18:                                       ; preds = %cond.end15
  %14 = load i32, i32* %.floor_1.iv.j, align 4
  store i32 %14, i32* %.tile_1.iv.j, align 4
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc, %for.body18
  %15 = load i32, i32* %.tile_1.iv.j, align 4
  %16 = load i32, i32* %.floor_1.iv.j, align 4
  %add20 = add nsw i32 %16, 5
  %cmp21 = icmp slt i32 4, %add20
  br i1 %cmp21, label %cond.true22, label %cond.false23

cond.true22:                                      ; preds = %for.cond19
  br label %cond.end25

cond.false23:                                     ; preds = %for.cond19
  %17 = load i32, i32* %.floor_1.iv.j, align 4
  %add24 = add nsw i32 %17, 5
  br label %cond.end25

cond.end25:                                       ; preds = %cond.false23, %cond.true22
  %cond26 = phi i32 [ 4, %cond.true22 ], [ %add24, %cond.false23 ]
  %cmp27 = icmp slt i32 %15, %cond26
  br i1 %cmp27, label %for.body28, label %for.end

for.body28:                                       ; preds = %cond.end25
  store i32 7, i32* %i, align 4
  %18 = load i32, i32* %.tile_0.iv.i, align 4
  store i32 %18, i32* %.tile_0.iv.i, align 4
  %19 = load i32, i32* %.tile_0.iv.i, align 4
  %mul29 = mul nsw i32 %19, 3
  %add30 = add nsw i32 7, %mul29
  store i32 %add30, i32* %i, align 4
  store i32 7, i32* %j, align 4
  %20 = load i32, i32* %.tile_1.iv.j, align 4
  store i32 %20, i32* %.tile_1.iv.j, align 4
  %21 = load i32, i32* %.tile_1.iv.j, align 4
  %mul31 = mul nsw i32 %21, 3
  %add32 = add nsw i32 7, %mul31
  store i32 %add32, i32* %j, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body28
  %22 = load i32, i32* %.tile_1.iv.j, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %.tile_1.iv.j, align 4
  br label %for.cond19

for.end:                                          ; preds = %cond.end25
  br label %for.inc33

for.inc33:                                        ; preds = %for.end
  %23 = load i32, i32* %.tile_0.iv.i, align 4
  %inc34 = add nsw i32 %23, 1
  store i32 %inc34, i32* %.tile_0.iv.i, align 4
  br label %for.cond9

for.end35:                                        ; preds = %cond.end15
  br label %for.inc36

for.inc36:                                        ; preds = %for.end35
  %24 = load i32, i32* %.floor_1.iv.j, align 4
  %add37 = add nsw i32 %24, 5
  store i32 %add37, i32* %.floor_1.iv.j, align 4
  br label %for.cond

for.end38:                                        ; preds = %for.cond
  br label %omp.body.continue

omp.body.continue:                                ; preds = %for.end38
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %25 = load i32, i32* %.omp.iv, align 4
  %add39 = add nsw i32 %25, 1
  store i32 %add39, i32* %.omp.iv, align 4
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
