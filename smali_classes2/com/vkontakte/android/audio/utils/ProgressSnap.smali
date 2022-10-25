.class public Lcom/vkontakte/android/audio/utils/ProgressSnap;
.super Ljava/lang/Object;
.source "ProgressSnap.java"


# instance fields
.field private mLastProgress:I

.field private final mSnap:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "snap"    # I

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput p1, p0, Lcom/vkontakte/android/audio/utils/ProgressSnap;->mSnap:I

    .line 10
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/audio/utils/ProgressSnap;->mLastProgress:I

    .line 11
    return-void
.end method


# virtual methods
.method public progress(DD)I
    .locals 5
    .param p1, "count"    # D
    .param p3, "total"    # D

    .prologue
    .line 25
    div-double v0, p1, p3

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    mul-double/2addr v0, v2

    double-to-int v0, v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/utils/ProgressSnap;->progress(I)I

    move-result v0

    return v0
.end method

.method public progress(FF)I
    .locals 4
    .param p1, "count"    # F
    .param p2, "total"    # F

    .prologue
    .line 29
    div-float v0, p1, p2

    float-to-double v0, v0

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    mul-double/2addr v0, v2

    double-to-int v0, v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/utils/ProgressSnap;->progress(I)I

    move-result v0

    return v0
.end method

.method public progress(I)I
    .locals 2
    .param p1, "progress"    # I

    .prologue
    .line 14
    iget v1, p0, Lcom/vkontakte/android/audio/utils/ProgressSnap;->mSnap:I

    div-int v0, p1, v1

    .line 15
    .local v0, "p":I
    iget v1, p0, Lcom/vkontakte/android/audio/utils/ProgressSnap;->mLastProgress:I

    if-le v0, v1, :cond_0

    .line 16
    iput v0, p0, Lcom/vkontakte/android/audio/utils/ProgressSnap;->mLastProgress:I

    .line 18
    iget v1, p0, Lcom/vkontakte/android/audio/utils/ProgressSnap;->mSnap:I

    mul-int/2addr v1, v0

    .line 21
    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public progress(II)I
    .locals 2
    .param p1, "count"    # I
    .param p2, "total"    # I

    .prologue
    .line 37
    int-to-float v0, p1

    int-to-float v1, p2

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/audio/utils/ProgressSnap;->progress(FF)I

    move-result v0

    return v0
.end method

.method public progress(JJ)I
    .locals 5
    .param p1, "count"    # J
    .param p3, "total"    # J

    .prologue
    .line 33
    long-to-double v0, p1

    long-to-double v2, p3

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/vkontakte/android/audio/utils/ProgressSnap;->progress(DD)I

    move-result v0

    return v0
.end method
