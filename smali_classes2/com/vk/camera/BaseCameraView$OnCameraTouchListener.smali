.class Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;
.super Ljava/lang/Object;
.source "BaseCameraView.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/BaseCameraView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OnCameraTouchListener"
.end annotation


# instance fields
.field private final gestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

.field private final scaleGestureDetector:Landroid/view/ScaleGestureDetector;

.field private final simpleOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

.field final synthetic this$0:Lcom/vk/camera/BaseCameraView;


# direct methods
.method public constructor <init>(Lcom/vk/camera/BaseCameraView;Landroid/content/Context;)V
    .locals 2
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    new-instance v0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener$1;

    invoke-direct {v0, p0}, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener$1;-><init>(Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->simpleOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 183
    new-instance v0, Landroid/support/v4/view/GestureDetectorCompat;

    iget-object v1, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->simpleOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    invoke-direct {v0, p2, v1}, Landroid/support/v4/view/GestureDetectorCompat;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->gestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    .line 184
    new-instance v0, Landroid/view/ScaleGestureDetector;

    invoke-direct {v0, p2, p0}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    .line 185
    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 4
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 216
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->this$0:Lcom/vk/camera/BaseCameraView;

    iget-object v1, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-virtual {v1}, Lcom/vk/camera/BaseCameraView;->getZoomLevel()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float/2addr v2, v3

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/vk/camera/BaseCameraView;->setZoomLevel(F)V

    .line 217
    const/4 v0, 0x1

    return v0
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 1
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 222
    const/4 v0, 0x1

    return v0
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 228
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->gestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    invoke-virtual {v0, p2}, Landroid/support/v4/view/GestureDetectorCompat;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 190
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->scaleGestureDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p2}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 191
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-static {v0}, Lcom/vk/camera/BaseCameraView;->access$000(Lcom/vk/camera/BaseCameraView;)Landroid/view/View$OnTouchListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-static {v0}, Lcom/vk/camera/BaseCameraView;->access$000(Lcom/vk/camera/BaseCameraView;)Landroid/view/View$OnTouchListener;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/view/View$OnTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 194
    :cond_0
    const/4 v0, 0x1

    return v0
.end method
