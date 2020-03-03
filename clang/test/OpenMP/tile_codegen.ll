; ModuleID = 'C:\Users\meinersbur\src\llvm-project\clang\test\OpenMP\tile_codegen.cpp'
source_filename = "C:\\Users\\meinersbur\\src\\llvm-project\\clang\\test\\OpenMP\\tile_codegen.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-unknown"

; Function Attrs: noinline nounwind optnone
define void @_Z4foo1iii(i32 %start, i32 %end, i32 %step) #0 {
entry:
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %step.addr = alloca i32, align 4
  %.floor_0.iv.i = alloca i32, align 4
  %.tile_0.iv.i = alloca i32, align 4
  %.floor_1.iv.j = alloca i32, align 4
  %.tile_1.iv.j = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i32 %step, i32* %step.addr, align 4
  store i32 0, i32* %.floor_0.iv.i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc28, %entry
  %0 = load i32, i32* %.floor_0.iv.i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end30

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %.floor_1.iv.j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc25, %for.body
  %1 = load i32, i32* %.floor_1.iv.j, align 4
  %cmp2 = icmp slt i32 %1, 4
  br i1 %cmp2, label %for.body3, label %for.end27

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %.floor_0.iv.i, align 4
  store i32 %2, i32* %.tile_0.iv.i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc22, %for.body3
  %3 = load i32, i32* %.tile_0.iv.i, align 4
  %4 = load i32, i32* %.floor_0.iv.i, align 4
  %add = add nsw i32 %4, 5
  %cmp5 = icmp slt i32 4, %add
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.cond4
  br label %cond.end

cond.false:                                       ; preds = %for.cond4
  %5 = load i32, i32* %.floor_0.iv.i, align 4
  %add6 = add nsw i32 %5, 5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 4, %cond.true ], [ %add6, %cond.false ]
  %cmp7 = icmp slt i32 %3, %cond
  br i1 %cmp7, label %for.body8, label %for.end24

for.body8:                                        ; preds = %cond.end
  %6 = load i32, i32* %.floor_1.iv.j, align 4
  store i32 %6, i32* %.tile_1.iv.j, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body8
  %7 = load i32, i32* %.tile_1.iv.j, align 4
  %8 = load i32, i32* %.floor_1.iv.j, align 4
  %add10 = add nsw i32 %8, 5
  %cmp11 = icmp slt i32 4, %add10
  br i1 %cmp11, label %cond.true12, label %cond.false13

cond.true12:                                      ; preds = %for.cond9
  br label %cond.end15

cond.false13:                                     ; preds = %for.cond9
  %9 = load i32, i32* %.floor_1.iv.j, align 4
  %add14 = add nsw i32 %9, 5
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false13, %cond.true12
  %cond16 = phi i32 [ 4, %cond.true12 ], [ %add14, %cond.false13 ]
  %cmp17 = icmp slt i32 %7, %cond16
  br i1 %cmp17, label %for.body18, label %for.end

for.body18:                                       ; preds = %cond.end15
  store i32 7, i32* %i, align 4
  %10 = load i32, i32* %.tile_0.iv.i, align 4
  store i32 %10, i32* %.tile_0.iv.i, align 4
  %11 = load i32, i32* %.tile_0.iv.i, align 4
  %mul = mul nsw i32 %11, 3
  %add19 = add nsw i32 7, %mul
  store i32 %add19, i32* %i, align 4
  store i32 7, i32* %j, align 4
  %12 = load i32, i32* %.tile_1.iv.j, align 4
  store i32 %12, i32* %.tile_1.iv.j, align 4
  %13 = load i32, i32* %.tile_1.iv.j, align 4
  %mul20 = mul nsw i32 %13, 3
  %add21 = add nsw i32 7, %mul20
  store i32 %add21, i32* %j, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body18
  %14 = load i32, i32* %.tile_1.iv.j, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %.tile_1.iv.j, align 4
  br label %for.cond9

for.end:                                          ; preds = %cond.end15
  br label %for.inc22

for.inc22:                                        ; preds = %for.end
  %15 = load i32, i32* %.tile_0.iv.i, align 4
  %inc23 = add nsw i32 %15, 1
  store i32 %inc23, i32* %.tile_0.iv.i, align 4
  br label %for.cond4

for.end24:                                        ; preds = %cond.end
  br label %for.inc25

for.inc25:                                        ; preds = %for.end24
  %16 = load i32, i32* %.floor_1.iv.j, align 4
  %add26 = add nsw i32 %16, 5
  store i32 %add26, i32* %.floor_1.iv.j, align 4
  br label %for.cond1

for.end27:                                        ; preds = %for.cond1
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %17 = load i32, i32* %.floor_0.iv.i, align 4
  %add29 = add nsw i32 %17, 5
  store i32 %add29, i32* %.floor_0.iv.i, align 4
  br label %for.cond

for.end30:                                        ; preds = %for.cond
  ret void
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (C:/Users/meinersbur/src/llvm-project/clang 108279948de31eba4f212b2a4715030b9d471c9e)"}
