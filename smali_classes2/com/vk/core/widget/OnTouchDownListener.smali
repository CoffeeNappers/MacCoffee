.class public Lcom/vk/core/widget/OnTouchDownListener;
.super Ljava/lang/Object;
.source "OnTouchDownListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;
    }
.end annotation


# static fields
.field private static final CLICK_TIME:J = 0xc8L

.field private static final DELAY:J = 0xaL

.field private static final DOWN_MESSAGE:I

.field private static final MAX_DELTA:F


# instance fields
.field private downTime:J

.field private final downUpListener:Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;

.field private downX:F

.field private downY:F

.field private final handler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const/16 v0, 0x18

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    sput v0, Lcom/vk/core/widget/OnTouchDownListener;->MAX_DELTA:F

    return-void
.end method

.method public constructor <init>(Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;)V
    .locals 2
    .param p1, "downUpListener"    # Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Lcom/vk/core/widget/OnTouchDownListener$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vk/core/widget/OnTouchDownListener$1;-><init>(Lcom/vk/core/widget/OnTouchDownListener;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/core/widget/OnTouchDownListener;->handler:Landroid/os/Handler;

    .line 39
    iput-object p1, p0, Lcom/vk/core/widget/OnTouchDownListener;->downUpListener:Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;

    .line 40
    return-void
.end method

.method static synthetic access$000(Lcom/vk/core/widget/OnTouchDownListener;)Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/widget/OnTouchDownListener;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/vk/core/widget/OnTouchDownListener;->downUpListener:Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;

    return-object v0
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 7
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 44
    invoke-static {p2}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    .line 45
    .local v0, "action":I
    if-nez v0, :cond_1

    .line 46
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, p0, Lcom/vk/core/widget/OnTouchDownListener;->downX:F

    .line 47
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iput v1, p0, Lcom/vk/core/widget/OnTouchDownListener;->downY:F

    .line 48
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vk/core/widget/OnTouchDownListener;->downTime:J

    .line 50
    iget-object v1, p0, Lcom/vk/core/widget/OnTouchDownListener;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 51
    iget-object v1, p0, Lcom/vk/core/widget/OnTouchDownListener;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/vk/core/widget/OnTouchDownListener;->handler:Landroid/os/Handler;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v4, v4

    invoke-static {v2, v5, v3, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;III)Landroid/os/Message;

    move-result-object v2

    const-wide/16 v4, 0xa

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 65
    :cond_0
    :goto_0
    return v6

    .line 52
    :cond_1
    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    .line 53
    iget v1, p0, Lcom/vk/core/widget/OnTouchDownListener;->downX:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    sget v2, Lcom/vk/core/widget/OnTouchDownListener;->MAX_DELTA:F

    cmpl-float v1, v1, v2

    if-gtz v1, :cond_2

    iget v1, p0, Lcom/vk/core/widget/OnTouchDownListener;->downY:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    sget v2, Lcom/vk/core/widget/OnTouchDownListener;->MAX_DELTA:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    .line 54
    :cond_2
    iget-object v1, p0, Lcom/vk/core/widget/OnTouchDownListener;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v5}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_0

    .line 56
    :cond_3
    if-eq v6, v0, :cond_4

    const/4 v1, 0x3

    if-ne v1, v0, :cond_0

    .line 57
    :cond_4
    iget-object v1, p0, Lcom/vk/core/widget/OnTouchDownListener;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 58
    iget-object v1, p0, Lcom/vk/core/widget/OnTouchDownListener;->downUpListener:Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;

    if-eqz v1, :cond_0

    .line 59
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/vk/core/widget/OnTouchDownListener;->downTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0xc8

    cmp-long v1, v2, v4

    if-gez v1, :cond_5

    iget v1, p0, Lcom/vk/core/widget/OnTouchDownListener;->downX:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    sget v2, Lcom/vk/core/widget/OnTouchDownListener;->MAX_DELTA:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_5

    iget v1, p0, Lcom/vk/core/widget/OnTouchDownListener;->downY:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    sget v2, Lcom/vk/core/widget/OnTouchDownListener;->MAX_DELTA:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_5

    .line 60
    iget-object v1, p0, Lcom/vk/core/widget/OnTouchDownListener;->downUpListener:Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    invoke-interface {v1, v2, v3}, Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;->onClick(II)V

    .line 62
    :cond_5
    iget-object v1, p0, Lcom/vk/core/widget/OnTouchDownListener;->downUpListener:Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    invoke-interface {v1, v2, v3}, Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;->onUp(II)V

    goto/16 :goto_0
.end method
