.class public final Lcom/vk/stories/view/StoriesGestureDetectorCompat;
.super Ljava/lang/Object;
.source "StoriesGestureDetectorCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplJellybeanMr2;,
        Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;,
        Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;
    }
.end annotation


# instance fields
.field private final mImpl:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Landroid/view/GestureDetector$OnGestureListener;

    .prologue
    .line 491
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vk/stories/view/StoriesGestureDetectorCompat;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V

    .line 492
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Landroid/view/GestureDetector$OnGestureListener;
    .param p3, "handler"    # Landroid/os/Handler;

    .prologue
    .line 504
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 505
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-le v0, v1, :cond_0

    .line 506
    new-instance v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplJellybeanMr2;

    invoke-direct {v0, p1, p2, p3}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplJellybeanMr2;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat;->mImpl:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;

    .line 510
    :goto_0
    return-void

    .line 508
    :cond_0
    new-instance v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;

    invoke-direct {v0, p1, p2, p3}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplBase;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat;->mImpl:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;

    goto :goto_0
.end method


# virtual methods
.method public isLongpressEnabled()Z
    .locals 1

    .prologue
    .line 516
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat;->mImpl:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;

    invoke-interface {v0}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;->isLongpressEnabled()Z

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 528
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat;->mImpl:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;

    invoke-interface {v0, p1}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public setIsLongpressEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 541
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat;->mImpl:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;

    invoke-interface {v0, p1}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;->setIsLongpressEnabled(Z)V

    .line 542
    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/view/GestureDetector$OnDoubleTapListener;

    .prologue
    .line 552
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat;->mImpl:Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;

    invoke-interface {v0, p1}, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 553
    return-void
.end method
