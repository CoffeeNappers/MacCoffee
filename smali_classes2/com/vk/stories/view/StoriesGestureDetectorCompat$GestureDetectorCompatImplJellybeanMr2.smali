.class Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplJellybeanMr2;
.super Ljava/lang/Object;
.source "StoriesGestureDetectorCompat.java"

# interfaces
.implements Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/view/StoriesGestureDetectorCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GestureDetectorCompatImplJellybeanMr2"
.end annotation


# instance fields
.field private final mDetector:Landroid/view/GestureDetector;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Landroid/view/GestureDetector$OnGestureListener;
    .param p3, "handler"    # Landroid/os/Handler;

    .prologue
    .line 454
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 455
    new-instance v0, Landroid/view/GestureDetector;

    invoke-direct {v0, p1, p2, p3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplJellybeanMr2;->mDetector:Landroid/view/GestureDetector;

    .line 456
    return-void
.end method


# virtual methods
.method public isLongpressEnabled()Z
    .locals 1

    .prologue
    .line 460
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplJellybeanMr2;->mDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0}, Landroid/view/GestureDetector;->isLongpressEnabled()Z

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 465
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplJellybeanMr2;->mDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public setIsLongpressEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 470
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplJellybeanMr2;->mDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    .line 471
    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/view/GestureDetector$OnDoubleTapListener;

    .prologue
    .line 475
    iget-object v0, p0, Lcom/vk/stories/view/StoriesGestureDetectorCompat$GestureDetectorCompatImplJellybeanMr2;->mDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 476
    return-void
.end method
