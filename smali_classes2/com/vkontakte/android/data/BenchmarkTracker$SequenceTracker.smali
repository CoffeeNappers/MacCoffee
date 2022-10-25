.class public Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;
.super Ljava/lang/Object;
.source "BenchmarkTracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/BenchmarkTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SequenceTracker"
.end annotation


# instance fields
.field private average:F

.field private observationsCount:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 444
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAverage()I
    .locals 1

    .prologue
    .line 449
    iget v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->average:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method public reportObserviation(I)V
    .locals 3
    .param p1, "observationValue"    # I

    .prologue
    .line 453
    iget v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->observationsCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->observationsCount:I

    .line 454
    iget v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->average:F

    int-to-float v1, p1

    iget v2, p0, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->average:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->observationsCount:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->average:F

    .line 455
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 458
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->observationsCount:I

    .line 459
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/data/BenchmarkTracker$SequenceTracker;->average:F

    .line 460
    return-void
.end method
