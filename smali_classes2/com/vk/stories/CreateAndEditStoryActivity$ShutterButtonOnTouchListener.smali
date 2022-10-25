.class Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ShutterButtonOnTouchListener"
.end annotation


# instance fields
.field confirmedLongTap:Z

.field private downY:F

.field private enabled:Z

.field private final fullZoomDistance:F

.field private prevY:F

.field final storiesGestureDetectorCompat:Lcom/vk/stories/view/StoriesGestureDetectorCompat;

.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

.field private final zoomThreshold:F


# direct methods
.method public constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 2427
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 2418
    const/16 v0, 0x96

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->fullZoomDistance:F

    .line 2419
    const/16 v0, 0x20

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->zoomThreshold:F

    .line 2423
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->enabled:Z

    .line 2428
    new-instance v0, Lcom/vk/stories/view/StoriesGestureDetectorCompat;

    invoke-direct {v0, p2, p0}, Lcom/vk/stories/view/StoriesGestureDetectorCompat;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->storiesGestureDetectorCompat:Lcom/vk/stories/view/StoriesGestureDetectorCompat;

    .line 2429
    return-void
.end method


# virtual methods
.method public isConfirmedLongTap()Z
    .locals 1

    .prologue
    .line 2477
    iget-boolean v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->confirmedLongTap:Z

    return v0
.end method

.method public isEnabled()Z
    .locals 1

    .prologue
    .line 2534
    iget-boolean v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->enabled:Z

    return v0
.end method

.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 2492
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$100(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    move-result-object v0

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-ne v0, v1, :cond_0

    .line 2493
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$300(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2495
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 2482
    const/4 v0, 0x1

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 1
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 2530
    const/4 v0, 0x0

    return v0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 2519
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->confirmedLongTap:Z

    .line 2521
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$100(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    move-result-object v0

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-ne v0, v1, :cond_1

    .line 2522
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$300(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2526
    :cond_0
    :goto_0
    return-void

    .line 2523
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$100(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    move-result-object v0

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->EDITOR:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-ne v0, v1, :cond_0

    .line 2524
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9400(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    goto :goto_0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 1
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    .line 2514
    const/4 v0, 0x0

    return v0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 2488
    return-void
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 2500
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$100(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    move-result-object v0

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-ne v0, v1, :cond_2

    .line 2501
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/camera/camera1/Camera1View;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2502
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9200(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2509
    :cond_0
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 2503
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2504
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9300(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    goto :goto_0

    .line 2507
    :cond_2
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9400(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    goto :goto_0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x3

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 2433
    iget-boolean v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->enabled:Z

    if-nez v4, :cond_0

    .line 2473
    :goto_0
    return v2

    .line 2437
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    and-int/lit16 v0, v4, 0xff

    .line 2440
    .local v0, "action":I
    if-nez v0, :cond_1

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/ShutterButton;

    move-result-object v4

    invoke-virtual {v4, p2}, Lcom/vk/stories/view/ShutterButton;->canHandleTouch(Landroid/view/MotionEvent;)Z

    move-result v4

    if-nez v4, :cond_1

    move v2, v3

    .line 2441
    goto :goto_0

    .line 2445
    :cond_1
    if-nez v0, :cond_8

    .line 2446
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    iput v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->downY:F

    .line 2447
    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2000(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2448
    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/ShutterButton;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/vk/stories/view/ShutterButton;->setPressed(Z)V

    .line 2454
    :cond_2
    :goto_1
    iget-boolean v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->confirmedLongTap:Z

    if-eqz v4, :cond_4

    if-eq v0, v5, :cond_3

    if-ne v0, v2, :cond_4

    :cond_3
    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    .line 2456
    invoke-static {v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v4

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vk/camera/camera1/Camera1View;->isRecording()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 2457
    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9200(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2459
    :cond_4
    if-eq v0, v5, :cond_5

    if-ne v0, v2, :cond_6

    .line 2460
    :cond_5
    iput-boolean v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->confirmedLongTap:Z

    .line 2464
    :cond_6
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->storiesGestureDetectorCompat:Lcom/vk/stories/view/StoriesGestureDetectorCompat;

    invoke-virtual {v3, p2}, Lcom/vk/stories/view/StoriesGestureDetectorCompat;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2467
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v3

    if-eqz v3, :cond_7

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/camera/camera1/Camera1View;->isRecording()Z

    move-result v3

    if-eqz v3, :cond_7

    iget v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->downY:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    sub-float/2addr v3, v4

    iget v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->zoomThreshold:F

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_7

    .line 2468
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->prevY:F

    sub-float/2addr v3, v4

    neg-float v3, v3

    iget v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->fullZoomDistance:F

    div-float v1, v3, v4

    .line 2469
    .local v1, "zoomDelta":F
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v3

    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vk/camera/camera1/Camera1View;->getZoomLevel()F

    move-result v4

    add-float/2addr v4, v1

    invoke-virtual {v3, v4}, Lcom/vk/camera/camera1/Camera1View;->setZoomLevel(F)V

    .line 2471
    .end local v1    # "zoomDelta":F
    :cond_7
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iput v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->prevY:F

    goto/16 :goto_0

    .line 2449
    :cond_8
    if-eq v0, v2, :cond_9

    if-ne v0, v5, :cond_2

    .line 2450
    :cond_9
    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/ShutterButton;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/vk/stories/view/ShutterButton;->setPressed(Z)V

    goto/16 :goto_1
.end method

.method public setEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 2538
    iput-boolean p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$ShutterButtonOnTouchListener;->enabled:Z

    .line 2539
    return-void
.end method
