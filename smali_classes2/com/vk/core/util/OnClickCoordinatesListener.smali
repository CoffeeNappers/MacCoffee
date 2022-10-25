.class public abstract Lcom/vk/core/util/OnClickCoordinatesListener;
.super Ljava/lang/Object;
.source "OnClickCoordinatesListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private downTime:J

.field private downX:I

.field private downY:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, -0x1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput v0, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downX:I

    .line 9
    iput v0, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downY:I

    .line 10
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downTime:J

    return-void
.end method


# virtual methods
.method public getMotionEventX(Landroid/view/MotionEvent;)I
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 36
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method public getMotionEventY(Landroid/view/MotionEvent;)I
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 40
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method public abstract onClick(Landroid/view/View;II)V
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 10
    .param p1, "v"    # Landroid/view/View;
    .param p2, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const-wide/16 v8, -0x1

    const/4 v7, 0x1

    const/4 v4, 0x5

    const/4 v6, -0x1

    .line 14
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    if-ne v2, v4, :cond_2

    .line 15
    :cond_0
    invoke-virtual {p0, p2}, Lcom/vk/core/util/OnClickCoordinatesListener;->getMotionEventX(Landroid/view/MotionEvent;)I

    move-result v2

    iput v2, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downX:I

    .line 16
    invoke-virtual {p0, p2}, Lcom/vk/core/util/OnClickCoordinatesListener;->getMotionEventY(Landroid/view/MotionEvent;)I

    move-result v2

    iput v2, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downY:I

    .line 17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downTime:J

    .line 32
    :cond_1
    :goto_0
    return v7

    .line 18
    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    if-eq v2, v7, :cond_3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/4 v3, 0x6

    if-ne v2, v3, :cond_1

    .line 19
    :cond_3
    invoke-virtual {p0, p2}, Lcom/vk/core/util/OnClickCoordinatesListener;->getMotionEventX(Landroid/view/MotionEvent;)I

    move-result v0

    .line 20
    .local v0, "upX":I
    invoke-virtual {p0, p2}, Lcom/vk/core/util/OnClickCoordinatesListener;->getMotionEventY(Landroid/view/MotionEvent;)I

    move-result v1

    .line 21
    .local v1, "upY":I
    iget v2, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downX:I

    if-eq v2, v6, :cond_4

    iget v2, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downY:I

    if-eq v2, v6, :cond_4

    iget-wide v2, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downTime:J

    cmp-long v2, v2, v8

    if-eqz v2, :cond_4

    iget v2, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downX:I

    sub-int/2addr v2, v0

    .line 22
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    if-ge v2, v3, :cond_4

    iget v2, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downY:I

    sub-int/2addr v2, v1

    .line 23
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x12c

    cmp-long v2, v2, v4

    if-gez v2, :cond_4

    .line 26
    invoke-virtual {p0, p1, v0, v1}, Lcom/vk/core/util/OnClickCoordinatesListener;->onClick(Landroid/view/View;II)V

    .line 28
    :cond_4
    iput v6, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downX:I

    .line 29
    iput v6, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downY:I

    .line 30
    iput-wide v8, p0, Lcom/vk/core/util/OnClickCoordinatesListener;->downTime:J

    goto :goto_0
.end method
