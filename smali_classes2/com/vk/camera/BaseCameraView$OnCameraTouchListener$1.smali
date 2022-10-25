.class Lcom/vk/camera/BaseCameraView$OnCameraTouchListener$1;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "BaseCameraView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;


# direct methods
.method constructor <init>(Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;

    .prologue
    .line 198
    iput-object p1, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener$1;->this$1:Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 201
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener$1;->this$1:Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;

    iget-object v0, v0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-static {v0}, Lcom/vk/camera/BaseCameraView;->access$100(Lcom/vk/camera/BaseCameraView;)Lcom/vk/core/util/TimeoutLock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->checkAndMaybeLock()Z

    move-result v0

    if-nez v0, :cond_0

    .line 202
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener$1;->this$1:Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;

    iget-object v0, v0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-virtual {v0}, Lcom/vk/camera/BaseCameraView;->changeCamera()V

    .line 204
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 209
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener$1;->this$1:Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;

    iget-object v0, v0, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;->this$0:Lcom/vk/camera/BaseCameraView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/camera/BaseCameraView;->onSingleTap(II)V

    .line 210
    const/4 v0, 0x1

    return v0
.end method
