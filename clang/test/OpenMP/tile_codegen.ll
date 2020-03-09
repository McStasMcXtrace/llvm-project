; ModuleID = 'C:\Users\meinersbur\src\llvm-project\clang\test\OpenMP\tile_codegen.cpp'
source_filename = "C:\\Users\\meinersbur\\src\\llvm-project\\clang\\test\\OpenMP\\tile_codegen.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-unknown"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr global %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr global %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8

; Function Attrs: noinline nounwind optnone
define void @_Z4foo5v() #0 {
entry:
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* @1, i32 0, void (i32*, i32*, ...)* bitcast (void (i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*))
  ret void
}

; Function Attrs: noinline norecurse nounwind optnone
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid.) #1 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %.omp.iv = alloca i32, align 4
  %.floor_0.iv.i = alloca i32, align 4
  %.tile_0.iv.i = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %.floor_0.iv.i1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  store i32 0, i32* %.omp.lb, align 4
  store i32 0, i32* %.omp.ub, align 4
  store i32 1, i32* %.omp.stride, align 4
  store i32 0, i32* %.omp.is_last, align 4
  %0 = load i32*, i32** %.global_tid..addr, align 8
  %1 = load i32, i32* %0, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @0, i32 %1, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1)
  %2 = load i32, i32* %.omp.ub, align 4
  %cmp = icmp sgt i32 %2, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, i32* %.omp.ub, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %3, %cond.false ]
  store i32 %cond, i32* %.omp.ub, align 4
  %4 = load i32, i32* %.omp.lb, align 4
  store i32 %4, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %5 = load i32, i32* %.omp.iv, align 4
  %6 = load i32, i32* %.omp.ub, align 4
  %cmp2 = icmp sle i32 %5, %6
  br i1 %cmp2, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %7 = load i32, i32* %.omp.iv, align 4
  %mul = mul nsw i32 %7, 5
  %add = add nsw i32 0, %mul
  store i32 %add, i32* %.floor_0.iv.i1, align 4
  %8 = load i32, i32* %.floor_0.iv.i1, align 4
  store i32 %8, i32* %.tile_0.iv.i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %omp.inner.for.body
  %9 = load i32, i32* %.tile_0.iv.i, align 4
  %10 = load i32, i32* %.floor_0.iv.i1, align 4
  %add3 = add nsw i32 %10, 5
  %cmp4 = icmp slt i32 4, %add3
  br i1 %cmp4, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %for.cond
  br label %cond.end8

cond.false6:                                      ; preds = %for.cond
  %11 = load i32, i32* %.floor_0.iv.i1, align 4
  %add7 = add nsw i32 %11, 5
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false6, %cond.true5
  %cond9 = phi i32 [ 4, %cond.true5 ], [ %add7, %cond.false6 ]
  %cmp10 = icmp slt i32 %9, %cond9
  br i1 %cmp10, label %for.body, label %for.end

for.body:                                         ; preds = %cond.end8
  store i32 7, i32* %i, align 4
  %12 = load i32, i32* %.tile_0.iv.i, align 4
  store i32 %12, i32* %.tile_0.iv.i, align 4
  %13 = load i32, i32* %.tile_0.iv.i, align 4
  %mul11 = mul nsw i32 %13, 3
  %add12 = add nsw i32 7, %mul11
  store i32 %add12, i32* %i, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %.tile_0.iv.i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %.tile_0.iv.i, align 4
  br label %for.cond

for.end:                                          ; preds = %cond.end8
  br label %omp.body.continue

omp.body.continue:                                ; preds = %for.end
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %15 = load i32, i32* %.omp.iv, align 4
  %add13 = add nsw i32 %15, 1
  store i32 %add13, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  call void @__kmpc_for_static_fini(%struct.ident_t* @0, i32 %1)
  ret void
}

declare void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare void @__kmpc_for_static_fini(%struct.ident_t*, i32)

declare !callback !2 void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...)

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (C:/Users/meinersbur/src/llvm-project/clang 7eeb90152859f254fe4e9182c749ab065d33c89d)"}
!2 = !{!3}
!3 = !{i64 2, i64 -1, i64 -1, i1 true}
