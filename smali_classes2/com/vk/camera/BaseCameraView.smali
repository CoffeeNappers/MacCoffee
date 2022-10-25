.class public abstract Lcom/vk/camera/BaseCameraView;
.super Landroid/widget/FrameLayout;
.source "BaseCameraView.java"

# interfaces
.implements Lcom/vk/camera/CameraObject$Viewer;
.implements Lcom/vk/camera/camera1/FocusViewCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/camera/BaseCameraView$CameraContainer;,
        Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;
    }
.end annotation


# instance fields
.field private final changeCameraLock:Lcom/vk/core/util/TimeoutLock;

.field private final clearRunnable:Ljava/lang/Runnable;

.field protected currentCameraMode:Lcom/vk/camera/CameraMode;

.field private externalTouchListener:Landroid/view/View$OnTouchListener;

.field private focusView:Landroid/view/View;

.field private focusX:I

.field private focusY:I

.field private mainLayout:Landroid/widget/FrameLayout;

.field protected final uiHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 33
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->uiHandler:Landroid/os/Handler;

    .line 34
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x1f4

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->changeCameraLock:Lcom/vk/core/util/TimeoutLock;

    .line 42
    invoke-static {}, Lcom/vk/camera/BaseCameraView;->frontCameraByDefault()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vk/camera/CameraMode;->FRONT:Lcom/vk/camera/CameraMode;

    :goto_0
    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->currentCameraMode:Lcom/vk/camera/CameraMode;

    .line 139
    new-instance v0, Lcom/vk/camera/BaseCameraView$2;

    invoke-direct {v0, p0}, Lcom/vk/camera/BaseCameraView$2;-><init>(Lcom/vk/camera/BaseCameraView;)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->clearRunnable:Ljava/lang/Runnable;

    .line 48
    invoke-direct {p0}, Lcom/vk/camera/BaseCameraView;->init()V

    .line 49
    return-void

    .line 42
    :cond_0
    sget-object v0, Lcom/vk/camera/CameraMode;->BACK:Lcom/vk/camera/CameraMode;

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->uiHandler:Landroid/os/Handler;

    .line 34
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x1f4

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->changeCameraLock:Lcom/vk/core/util/TimeoutLock;

    .line 42
    invoke-static {}, Lcom/vk/camera/BaseCameraView;->frontCameraByDefault()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vk/camera/CameraMode;->FRONT:Lcom/vk/camera/CameraMode;

    :goto_0
    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->currentCameraMode:Lcom/vk/camera/CameraMode;

    .line 139
    new-instance v0, Lcom/vk/camera/BaseCameraView$2;

    invoke-direct {v0, p0}, Lcom/vk/camera/BaseCameraView$2;-><init>(Lcom/vk/camera/BaseCameraView;)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->clearRunnable:Ljava/lang/Runnable;

    .line 53
    invoke-direct {p0}, Lcom/vk/camera/BaseCameraView;->init()V

    .line 54
    return-void

    .line 42
    :cond_0
    sget-object v0, Lcom/vk/camera/CameraMode;->BACK:Lcom/vk/camera/CameraMode;

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 57
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 33
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->uiHandler:Landroid/os/Handler;

    .line 34
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x1f4

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->changeCameraLock:Lcom/vk/core/util/TimeoutLock;

    .line 42
    invoke-static {}, Lcom/vk/camera/BaseCameraView;->frontCameraByDefault()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vk/camera/CameraMode;->FRONT:Lcom/vk/camera/CameraMode;

    :goto_0
    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->currentCameraMode:Lcom/vk/camera/CameraMode;

    .line 139
    new-instance v0, Lcom/vk/camera/BaseCameraView$2;

    invoke-direct {v0, p0}, Lcom/vk/camera/BaseCameraView$2;-><init>(Lcom/vk/camera/BaseCameraView;)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->clearRunnable:Ljava/lang/Runnable;

    .line 58
    invoke-direct {p0}, Lcom/vk/camera/BaseCameraView;->init()V

    .line 59
    return-void

    .line 42
    :cond_0
    sget-object v0, Lcom/vk/camera/CameraMode;->BACK:Lcom/vk/camera/CameraMode;

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/vk/camera/BaseCameraView;)Landroid/view/View$OnTouchListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/BaseCameraView;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->externalTouchListener:Landroid/view/View$OnTouchListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/camera/BaseCameraView;)Lcom/vk/core/util/TimeoutLock;
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/BaseCameraView;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->changeCameraLock:Lcom/vk/core/util/TimeoutLock;

    return-object v0
.end method

.method private clearDelayed()V
    .locals 4

    .prologue
    .line 136
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->uiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/camera/BaseCameraView;->clearRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 137
    return-void
.end method

.method public static frontCameraByDefault()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 30
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/camera/camera1/CameraHolder;->getNumberOfCameras()I

    move-result v1

    if-le v1, v0, :cond_0

    invoke-static {}, Lcom/vk/camera/CameraPrefs;->instance()Lcom/vk/camera/CameraPrefs;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/camera/CameraPrefs;->useFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private init()V
    .locals 2

    .prologue
    .line 62
    new-instance v0, Landroid/view/View;

    invoke-virtual {p0}, Lcom/vk/camera/BaseCameraView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->focusView:Landroid/view/View;

    .line 63
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->focusView:Landroid/view/View;

    const v1, 0x7f020136

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 65
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/vk/camera/BaseCameraView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/camera/BaseCameraView;->mainLayout:Landroid/widget/FrameLayout;

    .line 66
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->mainLayout:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v0}, Lcom/vk/camera/BaseCameraView;->addView(Landroid/view/View;)V

    .line 69
    new-instance v0, Lcom/vk/camera/BaseCameraView$1;

    invoke-virtual {p0}, Lcom/vk/camera/BaseCameraView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vk/camera/BaseCameraView$1;-><init>(Lcom/vk/camera/BaseCameraView;Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/vk/camera/BaseCameraView;->addView(Landroid/view/View;)V

    .line 94
    return-void
.end method


# virtual methods
.method public addCameraView(Landroid/view/View;)V
    .locals 4
    .param p1, "cameraView"    # Landroid/view/View;

    .prologue
    const/4 v3, -0x1

    .line 147
    iget-object v1, p0, Lcom/vk/camera/BaseCameraView;->mainLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 149
    new-instance v0, Lcom/vk/camera/BaseCameraView$CameraContainer;

    invoke-direct {v0, p0, p1}, Lcom/vk/camera/BaseCameraView$CameraContainer;-><init>(Lcom/vk/camera/BaseCameraView;Landroid/view/View;)V

    .line 150
    .local v0, "cameraContainer":Lcom/vk/camera/BaseCameraView$CameraContainer;
    new-instance v1, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;

    invoke-virtual {p0}, Lcom/vk/camera/BaseCameraView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vk/camera/BaseCameraView$OnCameraTouchListener;-><init>(Lcom/vk/camera/BaseCameraView;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vk/camera/BaseCameraView$CameraContainer;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 152
    iget-object v1, p0, Lcom/vk/camera/BaseCameraView;->mainLayout:Landroid/widget/FrameLayout;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 153
    return-void
.end method

.method public abstract changeCamera()V
.end method

.method public clear()V
    .locals 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->uiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/camera/BaseCameraView;->clearRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 109
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->mainLayout:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vk/camera/BaseCameraView;->focusView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 110
    return-void
.end method

.method protected abstract getCameraPreviewHeight()I
.end method

.method protected abstract getCameraPreviewWidth()I
.end method

.method protected abstract getDisplayOrientation()I
.end method

.method protected abstract isCameraPreviewAvailable()Z
.end method

.method protected abstract onSingleTap(II)V
.end method

.method public removeCameraView()V
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->mainLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 157
    return-void
.end method

.method public setExternalTouchListener(Landroid/view/View$OnTouchListener;)V
    .locals 0
    .param p1, "externalTouchListener"    # Landroid/view/View$OnTouchListener;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/vk/camera/BaseCameraView;->externalTouchListener:Landroid/view/View$OnTouchListener;

    .line 98
    return-void
.end method

.method public setFocus(II)V
    .locals 0
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 102
    iput p1, p0, Lcom/vk/camera/BaseCameraView;->focusX:I

    .line 103
    iput p2, p0, Lcom/vk/camera/BaseCameraView;->focusY:I

    .line 104
    return-void
.end method

.method public showFail(Z)V
    .locals 0
    .param p1, "timeout"    # Z

    .prologue
    .line 132
    invoke-direct {p0}, Lcom/vk/camera/BaseCameraView;->clearDelayed()V

    .line 133
    return-void
.end method

.method public showStart()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    .line 114
    invoke-virtual {p0}, Lcom/vk/camera/BaseCameraView;->clear()V

    .line 116
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->mainLayout:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vk/camera/BaseCameraView;->focusView:Landroid/view/View;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    sget v3, Lcom/vk/camera/camera1/FocusViewCallback;->FOCUS_SIZE:I

    sget v4, Lcom/vk/camera/camera1/FocusViewCallback;->FOCUS_SIZE:I

    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 117
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->focusView:Landroid/view/View;

    iget v1, p0, Lcom/vk/camera/BaseCameraView;->focusX:I

    sget v2, Lcom/vk/camera/camera1/FocusViewCallback;->FOCUS_SIZE:I

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/vk/camera/BaseCameraView;->getWidth()I

    move-result v2

    sget v3, Lcom/vk/camera/camera1/FocusViewCallback;->FOCUS_SIZE:I

    sub-int/2addr v2, v3

    invoke-static {v1, v7, v2}, Lcom/vk/camera/camera1/CameraUtils;->clamp(III)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 118
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->focusView:Landroid/view/View;

    iget v1, p0, Lcom/vk/camera/BaseCameraView;->focusY:I

    sget v2, Lcom/vk/camera/camera1/FocusViewCallback;->FOCUS_SIZE:I

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/vk/camera/BaseCameraView;->getHeight()I

    move-result v2

    sget v3, Lcom/vk/camera/camera1/FocusViewCallback;->FOCUS_SIZE:I

    sub-int/2addr v2, v3

    invoke-static {v1, v7, v2}, Lcom/vk/camera/camera1/CameraUtils;->clamp(III)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 120
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->focusView:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setScaleX(F)V

    .line 121
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->focusView:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setScaleY(F)V

    .line 122
    iget-object v0, p0, Lcom/vk/camera/BaseCameraView;->focusView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 123
    return-void
.end method

.method public showSuccess(Z)V
    .locals 0
    .param p1, "timeout"    # Z

    .prologue
    .line 127
    invoke-direct {p0}, Lcom/vk/camera/BaseCameraView;->clearDelayed()V

    .line 128
    return-void
.end method

.method protected abstract useFullBleedPreview()Z
.end method
