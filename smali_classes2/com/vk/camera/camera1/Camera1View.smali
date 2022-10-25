.class public Lcom/vk/camera/camera1/Camera1View;
.super Lcom/vk/camera/BaseCameraView;
.source "Camera1View.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Lcom/vk/camera/camera1/FocusOverlayManager$Listener;
.implements Landroid/hardware/Camera$AutoFocusCallback;
.implements Lcom/vk/camera/CameraObject$Recorder;
.implements Lcom/vk/camera/CameraObject$Viewer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;
    }
.end annotation


# static fields
.field private static final MIN_RECORDING_DURATION_MS:I = 0x3e8

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

.field private cameraId:I

.field private cameraMode:I

.field private cameraOrientationListener:Lcom/vk/camera/camera1/CameraOrientationListener;

.field private final cameraPreview:Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;

.field private displayOrientation:I

.field private enableRearLensDistortionCorrection:Z

.field private flashMode:I

.field private focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

.field private forcedDisplayRotation:I

.field private final handler:Landroid/os/Handler;

.field private inPreview:Z

.field private lastPictureOrientation:I

.field private final onOrientationChange:Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;

.field private outputOrientation:I

.field private photoReadyCallback:Lcom/vk/camera/CameraObject$OnPhotoResultListener;

.field private pictureCallback:Landroid/hardware/Camera$PictureCallback;

.field private final previewTransformMatrix:Landroid/graphics/Matrix;

.field private recordStart:J

.field private recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

.field private respectDeviceOrientation:Z

.field private final startStopRecordingLock:Lcom/vk/core/util/TimeoutLock;

.field private surfaceExists:Z

.field private final timerUpdateRunnable:Ljava/lang/Runnable;

.field private useFullBleedPreview:Z

.field private zoomLevel:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const-class v0, Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/camera/camera1/Camera1View;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, -0x1

    const/4 v4, 0x0

    .line 78
    invoke-direct {p0, p1}, Lcom/vk/camera/BaseCameraView;-><init>(Landroid/content/Context;)V

    .line 40
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x3e8

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->startStopRecordingLock:Lcom/vk/core/util/TimeoutLock;

    .line 46
    const/4 v0, 0x2

    iput v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraMode:I

    .line 48
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->handler:Landroid/os/Handler;

    .line 49
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .line 51
    iput-boolean v4, p0, Lcom/vk/camera/camera1/Camera1View;->inPreview:Z

    .line 52
    invoke-static {}, Lcom/vk/camera/camera1/Camera1View;->frontCameraByDefault()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/camera/camera1/CameraHolder;->getFrontCameraId()I

    move-result v0

    :goto_0
    iput v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View;->useFullBleedPreview:Z

    .line 55
    iput v5, p0, Lcom/vk/camera/camera1/Camera1View;->displayOrientation:I

    .line 56
    iput v5, p0, Lcom/vk/camera/camera1/Camera1View;->outputOrientation:I

    .line 57
    iput v5, p0, Lcom/vk/camera/camera1/Camera1View;->lastPictureOrientation:I

    .line 58
    iput-boolean v4, p0, Lcom/vk/camera/camera1/Camera1View;->respectDeviceOrientation:Z

    .line 59
    iput v4, p0, Lcom/vk/camera/camera1/Camera1View;->forcedDisplayRotation:I

    .line 60
    iput-boolean v4, p0, Lcom/vk/camera/camera1/Camera1View;->enableRearLensDistortionCorrection:Z

    .line 70
    new-instance v0, Lcom/vk/camera/camera1/Camera1View$1;

    invoke-direct {v0, p0}, Lcom/vk/camera/camera1/Camera1View$1;-><init>(Lcom/vk/camera/camera1/Camera1View;)V

    iput-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->pictureCallback:Landroid/hardware/Camera$PictureCallback;

    .line 227
    iput v4, p0, Lcom/vk/camera/camera1/Camera1View;->flashMode:I

    .line 464
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->previewTransformMatrix:Landroid/graphics/Matrix;

    .line 748
    new-instance v0, Lcom/vk/camera/camera1/Camera1View$3;

    invoke-direct {v0, p0}, Lcom/vk/camera/camera1/Camera1View$3;-><init>(Lcom/vk/camera/camera1/Camera1View;)V

    iput-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->timerUpdateRunnable:Ljava/lang/Runnable;

    .line 79
    new-instance v0, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;-><init>(Lcom/vk/camera/camera1/Camera1View;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->onOrientationChange:Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;

    .line 80
    invoke-static {p1}, Lcom/vkontakte/android/ViewUtils;->getDeviceDegreesInPortraitMode(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/vk/camera/camera1/Camera1View;->forcedDisplayRotation:I

    .line 82
    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/vk/camera/CameraSurfaceView;->create(Landroid/content/Context;Landroid/view/SurfaceHolder$Callback;)Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraPreview:Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;

    .line 83
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraPreview:Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;

    invoke-virtual {v0}, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->getRecorder()Lcom/vk/camera/CameraRecorder$RecorderBase;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    .line 85
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraPreview:Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;

    invoke-virtual {v0}, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->view()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/camera/camera1/Camera1View;->addCameraView(Landroid/view/View;)V

    .line 86
    return-void

    .line 53
    :cond_0
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/camera/camera1/CameraHolder;->getBackCameraId()I

    move-result v0

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/vk/camera/camera1/Camera1View;[B)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;
    .param p1, "x1"    # [B

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/vk/camera/camera1/Camera1View;->processJpeg([B)V

    return-void
.end method

.method static synthetic access$100(Lcom/vk/camera/camera1/Camera1View;)Lcom/vk/camera/CameraObject$OnPhotoResultListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->photoReadyCallback:Lcom/vk/camera/CameraObject$OnPhotoResultListener;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vk/camera/camera1/Camera1View;)J
    .locals 2
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 32
    iget-wide v0, p0, Lcom/vk/camera/camera1/Camera1View;->recordStart:J

    return-wide v0
.end method

.method static synthetic access$1100(Lcom/vk/camera/camera1/Camera1View;)Lcom/vk/camera/CameraRecorder$RecorderBase;
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vk/camera/camera1/Camera1View;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->timerUpdateRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vk/camera/camera1/Camera1View;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->uiHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vk/camera/camera1/Camera1View;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->stopTimer()V

    return-void
.end method

.method static synthetic access$200(Lcom/vk/camera/camera1/Camera1View;)Lcom/vk/camera/camera1/CameraManager$CameraProxy;
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/camera/camera1/Camera1View;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 32
    iget-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View;->respectDeviceOrientation:Z

    return v0
.end method

.method static synthetic access$400(Lcom/vk/camera/camera1/Camera1View;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 32
    iget v0, p0, Lcom/vk/camera/camera1/Camera1View;->forcedDisplayRotation:I

    return v0
.end method

.method static synthetic access$500(Lcom/vk/camera/camera1/Camera1View;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 32
    iget v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    return v0
.end method

.method static synthetic access$600(Lcom/vk/camera/camera1/Camera1View;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 32
    iget v0, p0, Lcom/vk/camera/camera1/Camera1View;->outputOrientation:I

    return v0
.end method

.method static synthetic access$700(Lcom/vk/camera/camera1/Camera1View;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;
    .param p1, "x1"    # I

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/vk/camera/camera1/Camera1View;->setOutputOrientation(I)V

    return-void
.end method

.method static synthetic access$800(Lcom/vk/camera/camera1/Camera1View;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->updateParameters()V

    return-void
.end method

.method static synthetic access$902(Lcom/vk/camera/camera1/Camera1View;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/camera/camera1/Camera1View;
    .param p1, "x1"    # I

    .prologue
    .line 32
    iput p1, p0, Lcom/vk/camera/camera1/Camera1View;->lastPictureOrientation:I

    return p1
.end method

.method private doStopRecording()V
    .locals 2

    .prologue
    .line 345
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->stopTimer()V

    .line 347
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    invoke-virtual {v0}, Lcom/vk/camera/CameraRecorder$RecorderBase;->stopRecording()V

    .line 348
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    invoke-virtual {v0}, Lcom/vk/camera/CameraRecorder$RecorderBase;->release()V

    .line 350
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/camera/Utils;->keepScreenOn(Landroid/app/Activity;Z)V

    .line 351
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->setupParameters()V

    .line 352
    return-void
.end method

.method static enableAntibanding(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 780
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedAntibanding()Ljava/util/List;

    move-result-object v0

    .line 781
    .local v0, "supportedAntibanding":Ljava/util/List;
    if-eqz v0, :cond_0

    const-string/jumbo v1, "auto"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 782
    const-string/jumbo v1, "auto"

    invoke-virtual {p0, v1}, Landroid/hardware/Camera$Parameters;->setAntibanding(Ljava/lang/String;)V

    .line 784
    :cond_0
    return-void
.end method

.method static enableAutoPhotoMode(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 794
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedSceneModes()Ljava/util/List;

    move-result-object v0

    .line 795
    .local v0, "supportedSceneModes":Ljava/util/List;
    if-eqz v0, :cond_0

    const-string/jumbo v1, "auto"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 796
    const-string/jumbo v1, "auto"

    invoke-virtual {p0, v1}, Landroid/hardware/Camera$Parameters;->setSceneMode(Ljava/lang/String;)V

    .line 798
    :cond_0
    return-void
.end method

.method static enableVideoStabilization(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 801
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->isVideoStabilizationSupported()Z

    move-result v0

    if-nez v0, :cond_1

    .line 807
    :cond_0
    :goto_0
    return-void

    .line 804
    :cond_1
    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    const-string/jumbo v1, "volantis"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-eq v0, v1, :cond_0

    .line 805
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setVideoStabilization(Z)V

    goto :goto_0
.end method

.method static enableWhiteBalance(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 787
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedWhiteBalance()Ljava/util/List;

    move-result-object v0

    .line 788
    .local v0, "supportedWhiteBalance":Ljava/util/List;
    if-eqz v0, :cond_0

    const-string/jumbo v1, "auto"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 789
    const-string/jumbo v1, "auto"

    invoke-virtual {p0, v1}, Landroid/hardware/Camera$Parameters;->setWhiteBalance(Ljava/lang/String;)V

    .line 791
    :cond_0
    return-void
.end method

.method private getActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 519
    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method private getPreviewFpsRange(Landroid/hardware/Camera$Parameters;)[I
    .locals 10
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    const/4 v9, 0x0

    .line 706
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    move-result-object v5

    .line 707
    .local v5, "supportedPreviewFpsRange":Ljava/util/List;, "Ljava/util/List<[I>;"
    const/4 v2, 0x0

    .line 708
    .local v2, "iArr2":[I
    const v0, 0x7fffffff

    .line 709
    .local v0, "i":I
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    .line 712
    .local v3, "iArr3":[I
    const/4 v7, 0x1

    aget v7, v3, v7

    const/16 v8, 0x7530

    if-lt v7, v8, :cond_0

    aget v7, v3, v9

    if-lt v7, v0, :cond_1

    .line 713
    :cond_0
    move v1, v0

    .line 714
    .local v1, "i2":I
    move-object v4, v2

    .line 719
    .local v4, "iArr4":[I
    :goto_1
    move-object v2, v4

    .line 720
    move v0, v1

    .line 721
    goto :goto_0

    .line 716
    .end local v1    # "i2":I
    .end local v4    # "iArr4":[I
    :cond_1
    move-object v4, v3

    .line 717
    .restart local v4    # "iArr4":[I
    aget v1, v3, v9

    .restart local v1    # "i2":I
    goto :goto_1

    .line 722
    .end local v1    # "i2":I
    .end local v3    # "iArr3":[I
    .end local v4    # "iArr4":[I
    :cond_2
    if-nez v2, :cond_3

    .line 723
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [I

    .line 725
    :goto_2
    return-object v6

    :cond_3
    move-object v6, v2

    goto :goto_2
.end method

.method private getPreviewSize()Landroid/hardware/Camera$Size;
    .locals 3

    .prologue
    .line 214
    const/4 v1, 0x0

    .line 215
    .local v1, "previewSize":Landroid/hardware/Camera$Size;
    iget-object v2, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v2, :cond_0

    .line 216
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/camera/camera1/CameraHolder;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 217
    .local v0, "cameraParameters":Landroid/hardware/Camera$Parameters;
    if-eqz v0, :cond_0

    .line 218
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v1

    .line 221
    .end local v0    # "cameraParameters":Landroid/hardware/Camera$Parameters;
    :cond_0
    return-object v1
.end method

.method private getVideoProfile()Landroid/media/CamcorderProfile;
    .locals 5

    .prologue
    const/4 v4, 0x5

    const/4 v3, 0x4

    .line 730
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->cameraPreview:Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;

    iget v2, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    invoke-virtual {v1, v2}, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->getVideoProfile(I)Landroid/media/CamcorderProfile;

    move-result-object v0

    .line 731
    .local v0, "profile":Landroid/media/CamcorderProfile;
    if-eqz v0, :cond_0

    .line 741
    .end local v0    # "profile":Landroid/media/CamcorderProfile;
    :goto_0
    return-object v0

    .line 735
    .restart local v0    # "profile":Landroid/media/CamcorderProfile;
    :cond_0
    const-string/jumbo v1, "Meizu"

    sget-object v2, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    iget v1, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    .line 736
    invoke-static {v1, v4}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 737
    iget v1, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    invoke-static {v1, v4}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v0

    goto :goto_0

    .line 738
    :cond_1
    iget v1, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    invoke-static {v1, v3}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 739
    iget v1, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    invoke-static {v1, v3}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v0

    goto :goto_0

    .line 741
    :cond_2
    iget v1, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v0

    goto :goto_0
.end method

.method private processJpeg([B)V
    .locals 2
    .param p1, "jpegData"    # [B

    .prologue
    .line 633
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->uiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/vk/camera/camera1/Camera1View$2;

    invoke-direct {v1, p0, p1}, Lcom/vk/camera/camera1/Camera1View$2;-><init>(Lcom/vk/camera/camera1/Camera1View;[B)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 641
    return-void
.end method

.method private setCameraDisplayOrientation()V
    .locals 3

    .prologue
    .line 523
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/camera/camera1/CameraUtils;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v0

    .line 524
    .local v0, "displayRotation":I
    iget v1, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    invoke-static {v0, v1}, Lcom/vk/camera/camera1/CameraUtils;->getDisplayOrientation(II)I

    move-result v1

    iput v1, p0, Lcom/vk/camera/camera1/Camera1View;->displayOrientation:I

    .line 525
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v1, :cond_0

    .line 526
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    iget v2, p0, Lcom/vk/camera/camera1/Camera1View;->displayOrientation:I

    invoke-virtual {v1, v2}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->setDisplayOrientation(I)V

    .line 528
    :cond_0
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    if-eqz v1, :cond_1

    .line 529
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    add-int/lit8 v2, v0, 0x5a

    invoke-virtual {v1, v2}, Lcom/vk/camera/camera1/FocusOverlayManager;->setDisplayOrientation(I)V

    .line 531
    :cond_1
    return-void
.end method

.method private setCameraPictureOrientation(Landroid/hardware/Camera$Parameters;)V
    .locals 3
    .param p1, "params"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 534
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 536
    .local v0, "info":Landroid/hardware/Camera$CameraInfo;
    iget v1, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    invoke-static {v1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 538
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 540
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    .line 541
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 542
    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v1

    iget v2, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    .line 540
    invoke-static {v1, v2}, Lcom/vk/camera/camera1/CameraUtils;->getCameraPictureRotation(II)I

    move-result v1

    .line 539
    invoke-direct {p0, v1}, Lcom/vk/camera/camera1/Camera1View;->setOutputOrientation(I)V

    .line 549
    :goto_0
    iget v1, p0, Lcom/vk/camera/camera1/Camera1View;->lastPictureOrientation:I

    iget v2, p0, Lcom/vk/camera/camera1/Camera1View;->outputOrientation:I

    if-eq v1, v2, :cond_0

    .line 550
    iget v1, p0, Lcom/vk/camera/camera1/Camera1View;->outputOrientation:I

    invoke-virtual {p1, v1}, Landroid/hardware/Camera$Parameters;->setRotation(I)V

    .line 551
    iget v1, p0, Lcom/vk/camera/camera1/Camera1View;->outputOrientation:I

    iput v1, p0, Lcom/vk/camera/camera1/Camera1View;->lastPictureOrientation:I

    .line 553
    :cond_0
    return-void

    .line 543
    :cond_1
    iget v1, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 544
    iget v1, p0, Lcom/vk/camera/camera1/Camera1View;->displayOrientation:I

    rsub-int v1, v1, 0x168

    rem-int/lit16 v1, v1, 0x168

    invoke-direct {p0, v1}, Lcom/vk/camera/camera1/Camera1View;->setOutputOrientation(I)V

    goto :goto_0

    .line 546
    :cond_2
    iget v1, p0, Lcom/vk/camera/camera1/Camera1View;->displayOrientation:I

    invoke-direct {p0, v1}, Lcom/vk/camera/camera1/Camera1View;->setOutputOrientation(I)V

    goto :goto_0
.end method

.method private setOutputOrientation(I)V
    .locals 3
    .param p1, "newOutputOrientation"    # I

    .prologue
    .line 644
    iput p1, p0, Lcom/vk/camera/camera1/Camera1View;->outputOrientation:I

    .line 645
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraOrientationListener:Lcom/vk/camera/camera1/CameraOrientationListener;

    if-eqz v0, :cond_0

    .line 646
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->cameraOrientationListener:Lcom/vk/camera/camera1/CameraOrientationListener;

    iget v0, p0, Lcom/vk/camera/camera1/Camera1View;->outputOrientation:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/vk/camera/camera1/Camera1View;->outputOrientation:I

    :goto_0
    invoke-interface {v1, v0}, Lcom/vk/camera/camera1/CameraOrientationListener;->onOrientationChange(I)V

    .line 648
    :cond_0
    return-void

    .line 646
    :cond_1
    const/16 v0, 0x5a

    goto :goto_0
.end method

.method static setRearLensDistortionCorrection(Landroid/hardware/Camera$Parameters;Z)V
    .locals 2
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "on"    # Z

    .prologue
    .line 811
    :try_start_0
    const-string/jumbo v1, "rear-lens-distortion-correction"

    if-eqz p1, :cond_0

    const-string/jumbo v0, "on"

    :goto_0
    invoke-virtual {p0, v1, v0}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 815
    :goto_1
    return-void

    .line 811
    :cond_0
    const-string/jumbo v0, "off"
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 812
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method private setupParameters()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 556
    iget-object v5, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v5, :cond_0

    .line 557
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vk/camera/camera1/CameraHolder;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 558
    .local v0, "cameraParameters":Landroid/hardware/Camera$Parameters;
    if-nez v0, :cond_1

    .line 630
    .end local v0    # "cameraParameters":Landroid/hardware/Camera$Parameters;
    :cond_0
    :goto_0
    return-void

    .line 562
    .restart local v0    # "cameraParameters":Landroid/hardware/Camera$Parameters;
    :cond_1
    invoke-static {v0}, Lcom/vk/camera/camera1/Camera1View;->enableAutoPhotoMode(Landroid/hardware/Camera$Parameters;)V

    .line 564
    invoke-direct {p0, v0}, Lcom/vk/camera/camera1/Camera1View;->setCameraPictureOrientation(Landroid/hardware/Camera$Parameters;)V

    .line 565
    const/16 v5, 0x100

    invoke-virtual {v0, v5}, Landroid/hardware/Camera$Parameters;->setPictureFormat(I)V

    .line 568
    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View;->isFrontCamera()Z

    move-result v5

    if-nez v5, :cond_2

    iget v5, p0, Lcom/vk/camera/camera1/Camera1View;->flashMode:I

    if-nez v5, :cond_8

    .line 569
    :cond_2
    const-string/jumbo v5, "off"

    invoke-virtual {v0, v5}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 581
    :cond_3
    :goto_1
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 582
    iget v5, p0, Lcom/vk/camera/camera1/Camera1View;->zoomLevel:F

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v0, v5}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 585
    :cond_4
    invoke-static {v0}, Lcom/vk/camera/camera1/Camera1View;->enableAntibanding(Landroid/hardware/Camera$Parameters;)V

    .line 586
    invoke-static {v0}, Lcom/vk/camera/camera1/Camera1View;->enableWhiteBalance(Landroid/hardware/Camera$Parameters;)V

    .line 587
    iget-boolean v5, p0, Lcom/vk/camera/camera1/Camera1View;->enableRearLensDistortionCorrection:Z

    invoke-static {v0, v5}, Lcom/vk/camera/camera1/Camera1View;->setRearLensDistortionCorrection(Landroid/hardware/Camera$Parameters;Z)V

    .line 589
    iget v5, p0, Lcom/vk/camera/camera1/Camera1View;->cameraMode:I

    if-nez v5, :cond_b

    .line 591
    invoke-static {v0}, Lcom/vk/camera/camera1/CameraUtils;->getOptimalPhotoPreviewSize(Landroid/hardware/Camera$Parameters;)Landroid/hardware/Camera$Size;

    move-result-object v2

    .line 592
    .local v2, "newSize":Landroid/hardware/Camera$Size;
    if-eqz v2, :cond_5

    .line 593
    iget v5, v2, Landroid/hardware/Camera$Size;->width:I

    iget v6, v2, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, v5, v6}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 597
    :cond_5
    const/4 v5, 0x4

    const/4 v6, 0x3

    invoke-static {v0, v5, v6}, Lcom/vk/camera/camera1/CameraUtils;->getOptimalPhotoPictureSize(Landroid/hardware/Camera$Parameters;II)Landroid/hardware/Camera$Size;

    move-result-object v3

    .line 598
    .local v3, "pictureSize":Landroid/hardware/Camera$Size;
    if-eqz v3, :cond_6

    .line 599
    iget v5, v3, Landroid/hardware/Camera$Size;->width:I

    iget v6, v3, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, v5, v6}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 623
    :cond_6
    :goto_2
    invoke-direct {p0, v0}, Lcom/vk/camera/camera1/Camera1View;->getPreviewFpsRange(Landroid/hardware/Camera$Parameters;)[I

    move-result-object v1

    .line 624
    .local v1, "fpsRanges":[I
    if-eqz v1, :cond_7

    .line 625
    const/4 v5, 0x0

    aget v5, v1, v5

    aget v6, v1, v7

    invoke-virtual {v0, v5, v6}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 628
    :cond_7
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->updateParameters()V

    goto :goto_0

    .line 570
    .end local v1    # "fpsRanges":[I
    .end local v2    # "newSize":Landroid/hardware/Camera$Size;
    .end local v3    # "pictureSize":Landroid/hardware/Camera$Size;
    :cond_8
    iget v5, p0, Lcom/vk/camera/camera1/Camera1View;->flashMode:I

    if-ne v5, v7, :cond_9

    .line 571
    const-string/jumbo v5, "auto"

    invoke-virtual {v0, v5}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    goto :goto_1

    .line 572
    :cond_9
    iget v5, p0, Lcom/vk/camera/camera1/Camera1View;->flashMode:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_3

    .line 573
    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View;->isRecording()Z

    move-result v5

    if-eqz v5, :cond_a

    .line 574
    const-string/jumbo v5, "torch"

    invoke-virtual {v0, v5}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    goto :goto_1

    .line 576
    :cond_a
    const-string/jumbo v5, "on"

    invoke-virtual {v0, v5}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    goto :goto_1

    .line 605
    :cond_b
    invoke-static {v0}, Lcom/vk/camera/camera1/Camera1View;->enableVideoStabilization(Landroid/hardware/Camera$Parameters;)V

    .line 608
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->getVideoProfile()Landroid/media/CamcorderProfile;

    move-result-object v4

    .line 610
    .local v4, "profile":Landroid/media/CamcorderProfile;
    iget v5, v4, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget v6, v4, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-static {v0, v5, v6}, Lcom/vk/camera/camera1/CameraUtils;->getOptimalVideoPreviewSize(Landroid/hardware/Camera$Parameters;II)Landroid/hardware/Camera$Size;

    move-result-object v2

    .line 611
    .restart local v2    # "newSize":Landroid/hardware/Camera$Size;
    if-eqz v2, :cond_c

    .line 612
    iget v5, v2, Landroid/hardware/Camera$Size;->width:I

    iget v6, v2, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, v5, v6}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 616
    :cond_c
    iget v5, v4, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget v6, v4, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-static {v0, v5, v6}, Lcom/vk/camera/camera1/CameraUtils;->getOptimalPhotoPictureSize(Landroid/hardware/Camera$Parameters;II)Landroid/hardware/Camera$Size;

    move-result-object v3

    .line 617
    .restart local v3    # "pictureSize":Landroid/hardware/Camera$Size;
    if-eqz v3, :cond_6

    .line 618
    iget v5, v3, Landroid/hardware/Camera$Size;->width:I

    iget v6, v3, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v0, v5, v6}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    goto :goto_2
.end method

.method private startCameraPreview()V
    .locals 4

    .prologue
    .line 115
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-nez v1, :cond_0

    .line 116
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v1

    iget v2, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    invoke-virtual {v1, v2}, Lcom/vk/camera/camera1/CameraHolder;->tryOpen(I)Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .line 117
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-nez v1, :cond_1

    .line 143
    :cond_0
    :goto_0
    return-void

    .line 121
    :cond_1
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 122
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->onOrientationChange:Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;

    invoke-virtual {v1}, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->enable()V

    .line 126
    :cond_2
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->setupParameters()V

    .line 129
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/camera/camera1/CameraHolder;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 130
    .local v0, "cameraParameters":Landroid/hardware/Camera$Parameters;
    if-eqz v0, :cond_3

    .line 131
    new-instance v1, Lcom/vk/camera/camera1/FocusOverlayManager;

    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View;->isFrontCamera()Z

    move-result v2

    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v1, v0, p0, v2, v3}, Lcom/vk/camera/camera1/FocusOverlayManager;-><init>(Landroid/hardware/Camera$Parameters;Lcom/vk/camera/camera1/FocusOverlayManager$Listener;ZLandroid/os/Looper;)V

    iput-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    .line 132
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v2

    iget v2, v2, Landroid/hardware/Camera$Size;->width:I

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v3

    iget v3, v3, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v1, v2, v3}, Lcom/vk/camera/camera1/FocusOverlayManager;->setPreviewSize(II)V

    .line 133
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    invoke-virtual {v1, p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->setFocusView(Lcom/vk/camera/camera1/FocusViewCallback;)V

    .line 135
    :cond_3
    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View;->setFocusParameters()V

    .line 138
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->setCameraDisplayOrientation()V

    .line 140
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->startPreview()V

    goto :goto_0
.end method

.method private startPreview()V
    .locals 3

    .prologue
    .line 504
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraPreview:Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;

    invoke-virtual {v0}, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->requestLayout()V

    .line 505
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraPreview:Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;

    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    iget v2, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    invoke-virtual {v0, v1, v2}, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->startPreview(Lcom/vk/camera/camera1/CameraManager$CameraProxy;I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View;->inPreview:Z

    .line 506
    return-void
.end method

.method private stopPreview(Z)V
    .locals 1
    .param p1, "keep"    # Z

    .prologue
    .line 510
    :try_start_0
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraPreview:Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;

    invoke-virtual {v0, p1}, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->stopPreview(Z)V

    .line 511
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View;->inPreview:Z

    .line 512
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v0}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->stopPreview()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 516
    :goto_0
    return-void

    .line 513
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private stopTimer()V
    .locals 2

    .prologue
    .line 774
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->uiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->timerUpdateRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 775
    return-void
.end method

.method private updateParameters()V
    .locals 4

    .prologue
    .line 494
    :try_start_0
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/camera/camera1/CameraHolder;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 495
    .local v0, "cameraParameters":Landroid/hardware/Camera$Parameters;
    if-eqz v0, :cond_0

    .line 496
    iget-object v2, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v2, v0}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 501
    .end local v0    # "cameraParameters":Landroid/hardware/Camera$Parameters;
    :cond_0
    :goto_0
    return-void

    .line 498
    :catch_0
    move-exception v1

    .line 499
    .local v1, "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "Camera"

    const-string/jumbo v3, ""

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method public autoFocus()V
    .locals 1

    .prologue
    .line 415
    iget-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View;->inPreview:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v0, :cond_0

    .line 416
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v0, p0}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 418
    :cond_0
    return-void
.end method

.method public cancelAutoFocus()V
    .locals 1

    .prologue
    .line 422
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v0, :cond_0

    .line 423
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v0}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->cancelAutoFocus()V

    .line 425
    :cond_0
    return-void
.end method

.method public capture()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v3, 0x0

    .line 429
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->pictureCallback:Landroid/hardware/Camera$PictureCallback;

    invoke-virtual {p0, v1}, Lcom/vk/camera/camera1/Camera1View;->capture(Landroid/hardware/Camera$PictureCallback;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 437
    :goto_0
    return v0

    .line 433
    :cond_0
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v1, :cond_1

    .line 434
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    iget-object v2, p0, Lcom/vk/camera/camera1/Camera1View;->pictureCallback:Landroid/hardware/Camera$PictureCallback;

    invoke-virtual {v1, v3, v3, v3, v2}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V

    goto :goto_0

    .line 437
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public capture(Landroid/hardware/Camera$PictureCallback;)Z
    .locals 1
    .param p1, "callback"    # Landroid/hardware/Camera$PictureCallback;

    .prologue
    .line 442
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    invoke-virtual {v0, p1}, Lcom/vk/camera/CameraRecorder$RecorderBase;->capture(Landroid/hardware/Camera$PictureCallback;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public changeCamera()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 203
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/camera/camera1/CameraHolder;->getNumberOfCameras()I

    move-result v1

    if-le v1, v0, :cond_0

    .line 204
    invoke-static {}, Lcom/vk/camera/CameraPrefs;->instance()Lcom/vk/camera/CameraPrefs;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View;->getCurrentMode()Lcom/vk/camera/CameraMode;

    move-result-object v2

    sget-object v3, Lcom/vk/camera/CameraMode;->BACK:Lcom/vk/camera/CameraMode;

    if-ne v2, v3, :cond_1

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vk/camera/CameraPrefs;->useFrontCamera(Z)V

    .line 205
    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View;->getCurrentMode()Lcom/vk/camera/CameraMode;

    move-result-object v0

    sget-object v1, Lcom/vk/camera/CameraMode;->BACK:Lcom/vk/camera/CameraMode;

    if-ne v0, v1, :cond_2

    .line 206
    sget-object v0, Lcom/vk/camera/CameraMode;->FRONT:Lcom/vk/camera/CameraMode;

    invoke-virtual {p0, v0}, Lcom/vk/camera/camera1/Camera1View;->start(Lcom/vk/camera/CameraMode;)V

    .line 211
    :cond_0
    :goto_1
    return-void

    .line 204
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 208
    :cond_2
    sget-object v0, Lcom/vk/camera/CameraMode;->BACK:Lcom/vk/camera/CameraMode;

    invoke-virtual {p0, v0}, Lcom/vk/camera/camera1/Camera1View;->start(Lcom/vk/camera/CameraMode;)V

    goto :goto_1
.end method

.method destroyPreview(Z)V
    .locals 1
    .param p1, "keep"    # Z

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v0, :cond_2

    .line 147
    iget-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View;->inPreview:Z

    if-eqz v0, :cond_0

    .line 148
    invoke-direct {p0, p1}, Lcom/vk/camera/camera1/Camera1View;->stopPreview(Z)V

    .line 150
    :cond_0
    if-eqz p1, :cond_1

    .line 151
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/camera/camera1/CameraHolder;->keep()V

    .line 153
    :cond_1
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/camera/camera1/CameraHolder;->release()V

    .line 154
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .line 156
    :cond_2
    return-void
.end method

.method protected getCameraPreviewHeight()I
    .locals 2

    .prologue
    .line 187
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v0

    .line 188
    .local v0, "size":Landroid/hardware/Camera$Size;
    if-eqz v0, :cond_0

    .line 189
    iget v1, v0, Landroid/hardware/Camera$Size;->height:I

    .line 191
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected getCameraPreviewWidth()I
    .locals 2

    .prologue
    .line 178
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v0

    .line 179
    .local v0, "size":Landroid/hardware/Camera$Size;
    if-eqz v0, :cond_0

    .line 180
    iget v1, v0, Landroid/hardware/Camera$Size;->width:I

    .line 182
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getCurrentMode()Lcom/vk/camera/CameraMode;
    .locals 1

    .prologue
    .line 266
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->currentCameraMode:Lcom/vk/camera/CameraMode;

    return-object v0
.end method

.method protected getDisplayOrientation()I
    .locals 1

    .prologue
    .line 163
    iget v0, p0, Lcom/vk/camera/camera1/Camera1View;->displayOrientation:I

    return v0
.end method

.method public getFlashMode()I
    .locals 1

    .prologue
    .line 304
    iget v0, p0, Lcom/vk/camera/camera1/Camera1View;->flashMode:I

    return v0
.end method

.method public getMaxRecordingLengthMs()J
    .locals 2

    .prologue
    .line 402
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    invoke-virtual {v0}, Lcom/vk/camera/CameraRecorder$RecorderBase;->getMaxRecordingLengthMs()J

    move-result-wide v0

    return-wide v0
.end method

.method public getZoomLevel()F
    .locals 1

    .prologue
    .line 289
    iget v0, p0, Lcom/vk/camera/camera1/Camera1View;->zoomLevel:F

    return v0
.end method

.method public isBackCamera()Z
    .locals 2

    .prologue
    .line 294
    iget v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/camera/camera1/CameraHolder;->getBackCameraId()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isCameraPreviewAvailable()Z
    .locals 1

    .prologue
    .line 173
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFrontCamera()Z
    .locals 2

    .prologue
    .line 299
    iget v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/camera/camera1/CameraHolder;->getFrontCameraId()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRecording()Z
    .locals 1

    .prologue
    .line 392
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    invoke-virtual {v0}, Lcom/vk/camera/CameraRecorder$RecorderBase;->isRecording()Z

    move-result v0

    return v0
.end method

.method synthetic lambda$stopRecording$0(I)V
    .locals 0
    .param p1, "currentFlashMode"    # I

    .prologue
    .line 383
    if-eqz p1, :cond_0

    .line 384
    invoke-virtual {p0, p1}, Lcom/vk/camera/camera1/Camera1View;->setFlashMode(I)V

    .line 386
    :cond_0
    return-void
.end method

.method public onAutoFocus(ZLandroid/hardware/Camera;)V
    .locals 2
    .param p1, "success"    # Z
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 486
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/vk/camera/camera1/FocusOverlayManager;->onAutoFocus(ZZ)V

    .line 487
    return-void
.end method

.method protected onSingleTap(II)V
    .locals 1
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 196
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    if-eqz v0, :cond_0

    .line 197
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    invoke-virtual {v0, p1, p2}, Lcom/vk/camera/camera1/FocusOverlayManager;->onSingleTapUp(II)V

    .line 199
    :cond_0
    return-void
.end method

.method public setCameraOrientationListener(Lcom/vk/camera/camera1/CameraOrientationListener;)V
    .locals 3
    .param p1, "listener"    # Lcom/vk/camera/camera1/CameraOrientationListener;

    .prologue
    .line 316
    iput-object p1, p0, Lcom/vk/camera/camera1/Camera1View;->cameraOrientationListener:Lcom/vk/camera/camera1/CameraOrientationListener;

    .line 317
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraOrientationListener:Lcom/vk/camera/camera1/CameraOrientationListener;

    if-eqz v0, :cond_0

    .line 318
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->cameraOrientationListener:Lcom/vk/camera/camera1/CameraOrientationListener;

    iget v0, p0, Lcom/vk/camera/camera1/Camera1View;->outputOrientation:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/vk/camera/camera1/Camera1View;->outputOrientation:I

    :goto_0
    invoke-interface {v1, v0}, Lcom/vk/camera/camera1/CameraOrientationListener;->onOrientationChange(I)V

    .line 320
    :cond_0
    return-void

    .line 318
    :cond_1
    const/16 v0, 0x5a

    goto :goto_0
.end method

.method public setEffect(Ljava/lang/String;)Lcom/vk/camera/CameraSurfaceView$Status;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraPreview:Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;

    invoke-virtual {v0, p1}, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->setEffect(Ljava/lang/String;)Lcom/vk/camera/CameraSurfaceView$Status;

    move-result-object v0

    return-object v0
.end method

.method public setFlashMode(I)V
    .locals 0
    .param p1, "mode"    # I

    .prologue
    .line 309
    iput p1, p0, Lcom/vk/camera/camera1/Camera1View;->flashMode:I

    .line 310
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->setupParameters()V

    .line 312
    return-void
.end method

.method public setFocusParameters()V
    .locals 2

    .prologue
    .line 447
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v1, :cond_2

    .line 448
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/camera/camera1/CameraHolder;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 449
    .local v0, "cameraParameters":Landroid/hardware/Camera$Parameters;
    if-eqz v0, :cond_1

    .line 450
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    invoke-virtual {v1}, Lcom/vk/camera/camera1/FocusOverlayManager;->getFocusMode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 452
    invoke-static {v0}, Lcom/vk/camera/camera1/CameraUtils;->isFocusAreaSupported(Landroid/hardware/Camera$Parameters;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 453
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    invoke-virtual {v1}, Lcom/vk/camera/camera1/FocusOverlayManager;->getFocusAreas()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusAreas(Ljava/util/List;)V

    .line 456
    :cond_0
    invoke-static {v0}, Lcom/vk/camera/camera1/CameraUtils;->isMeteringAreaSupported(Landroid/hardware/Camera$Parameters;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 457
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    invoke-virtual {v1}, Lcom/vk/camera/camera1/FocusOverlayManager;->getMeteringAreas()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setMeteringAreas(Ljava/util/List;)V

    .line 460
    :cond_1
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->updateParameters()V

    .line 462
    .end local v0    # "cameraParameters":Landroid/hardware/Camera$Parameters;
    :cond_2
    return-void
.end method

.method public setMaxRecordingLengthMs(J)V
    .locals 1
    .param p1, "maxRecordingLengthMs"    # J

    .prologue
    .line 407
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    invoke-virtual {v0, p1, p2}, Lcom/vk/camera/CameraRecorder$RecorderBase;->setMaxRecordingLengthMs(J)V

    .line 408
    return-void
.end method

.method public setOnCameraResultListener(Lcom/vk/camera/CameraObject$OnPhotoResultListener;)V
    .locals 0
    .param p1, "photoFileReadyCallback"    # Lcom/vk/camera/CameraObject$OnPhotoResultListener;

    .prologue
    .line 278
    iput-object p1, p0, Lcom/vk/camera/camera1/Camera1View;->photoReadyCallback:Lcom/vk/camera/CameraObject$OnPhotoResultListener;

    .line 279
    return-void
.end method

.method public setRecordingCallback(Lcom/vk/camera/CameraObject$OnRecordingCallback;)V
    .locals 1
    .param p1, "recordingCallback"    # Lcom/vk/camera/CameraObject$OnRecordingCallback;

    .prologue
    .line 397
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    invoke-virtual {v0, p1}, Lcom/vk/camera/CameraRecorder$RecorderBase;->setRecordingCallback(Lcom/vk/camera/CameraObject$OnRecordingCallback;)V

    .line 398
    return-void
.end method

.method public setUseFullBleedPreview(Z)V
    .locals 0
    .param p1, "useFullBleedPreview"    # Z

    .prologue
    .line 324
    iput-boolean p1, p0, Lcom/vk/camera/camera1/Camera1View;->useFullBleedPreview:Z

    .line 325
    return-void
.end method

.method public setZoomLevel(F)V
    .locals 2
    .param p1, "zoomLevel"    # F

    .prologue
    .line 283
    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/vk/camera/camera1/Camera1View;->zoomLevel:F

    .line 284
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->setupParameters()V

    .line 285
    return-void
.end method

.method public start()V
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->currentCameraMode:Lcom/vk/camera/CameraMode;

    invoke-virtual {p0, v0}, Lcom/vk/camera/camera1/Camera1View;->start(Lcom/vk/camera/CameraMode;)V

    .line 232
    return-void
.end method

.method public start(Lcom/vk/camera/CameraMode;)V
    .locals 1
    .param p1, "mode"    # Lcom/vk/camera/CameraMode;

    .prologue
    .line 236
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View;->getCurrentMode()Lcom/vk/camera/CameraMode;

    move-result-object v0

    if-eq p1, v0, :cond_0

    .line 237
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/camera/camera1/Camera1View;->stop(Z)V

    .line 240
    :cond_0
    sget-object v0, Lcom/vk/camera/CameraMode;->BACK:Lcom/vk/camera/CameraMode;

    if-ne p1, v0, :cond_2

    .line 241
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/camera/camera1/CameraHolder;->getBackCameraId()I

    move-result v0

    iput v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    .line 245
    :goto_0
    iput-object p1, p0, Lcom/vk/camera/camera1/Camera1View;->currentCameraMode:Lcom/vk/camera/CameraMode;

    .line 247
    iget-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View;->surfaceExists:Z

    if-eqz v0, :cond_1

    .line 248
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->startCameraPreview()V

    .line 250
    :cond_1
    return-void

    .line 243
    :cond_2
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/camera/camera1/CameraHolder;->getFrontCameraId()I

    move-result v0

    iput v0, p0, Lcom/vk/camera/camera1/Camera1View;->cameraId:I

    goto :goto_0
.end method

.method public startRecording()Z
    .locals 6

    .prologue
    .line 329
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->startStopRecordingLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v1}, Lcom/vk/core/util/TimeoutLock;->checkAndMaybeLock()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 330
    const/4 v0, 0x0

    .line 341
    :cond_0
    :goto_0
    return v0

    .line 333
    :cond_1
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    iget-object v2, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->getVideoProfile()Landroid/media/CamcorderProfile;

    move-result-object v3

    iget v4, p0, Lcom/vk/camera/camera1/Camera1View;->outputOrientation:I

    invoke-virtual {v1, v2, v3, v4}, Lcom/vk/camera/CameraRecorder$RecorderBase;->setup(Lcom/vk/camera/camera1/CameraManager$CameraProxy;Landroid/media/CamcorderProfile;I)V

    .line 334
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    invoke-virtual {v1}, Lcom/vk/camera/CameraRecorder$RecorderBase;->startRecording()Z

    move-result v0

    .line 336
    .local v0, "status":Z
    if-eqz v0, :cond_0

    .line 337
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/vk/camera/Utils;->keepScreenOn(Landroid/app/Activity;Z)V

    .line 338
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->uiHandler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vk/camera/camera1/Camera1View$$Lambda$1;->lambdaFactory$(Lcom/vk/camera/camera1/Camera1View;)Ljava/lang/Runnable;

    move-result-object v2

    const-wide/16 v4, 0x258

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 339
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->setupParameters()V

    goto :goto_0
.end method

.method public startTimer()V
    .locals 6

    .prologue
    .line 765
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    invoke-virtual {v1}, Lcom/vk/camera/CameraRecorder$RecorderBase;->getCallback()Lcom/vk/camera/CameraObject$OnRecordingCallback;

    move-result-object v0

    .line 766
    .local v0, "cb":Lcom/vk/camera/CameraObject$OnRecordingCallback;
    if-eqz v0, :cond_0

    .line 767
    invoke-interface {v0}, Lcom/vk/camera/CameraObject$OnRecordingCallback;->onStart()V

    .line 769
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vk/camera/camera1/Camera1View;->recordStart:J

    .line 770
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View;->uiHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/vk/camera/camera1/Camera1View;->timerUpdateRunnable:Ljava/lang/Runnable;

    const-wide/16 v4, 0x20

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 771
    return-void
.end method

.method public stop(Z)V
    .locals 2
    .param p1, "keep"    # Z

    .prologue
    .line 254
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->handler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 255
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->doStopRecording()V

    .line 256
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v0, :cond_0

    .line 257
    invoke-virtual {p0, p1}, Lcom/vk/camera/camera1/Camera1View;->destroyPreview(Z)V

    .line 260
    :cond_0
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->onOrientationChange:Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;

    invoke-virtual {v0}, Lcom/vk/camera/camera1/Camera1View$OnOrientationChange;->disable()V

    .line 261
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/camera/camera1/Camera1View;->lastPictureOrientation:I

    .line 262
    return-void
.end method

.method public stopRecording()V
    .locals 10

    .prologue
    const-wide/16 v8, 0x3e8

    .line 356
    iget-object v3, p0, Lcom/vk/camera/camera1/Camera1View;->startStopRecordingLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v3}, Lcom/vk/core/util/TimeoutLock;->checkAndMaybeLock()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 388
    :cond_0
    :goto_0
    return-void

    .line 360
    :cond_1
    iget-wide v4, p0, Lcom/vk/camera/camera1/Camera1View;->recordStart:J

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-lez v3, :cond_0

    .line 361
    iget-object v3, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    invoke-virtual {v3}, Lcom/vk/camera/CameraRecorder$RecorderBase;->getCallback()Lcom/vk/camera/CameraObject$OnRecordingCallback;

    move-result-object v0

    .line 363
    .local v0, "cb":Lcom/vk/camera/CameraObject$OnRecordingCallback;
    iget-object v3, p0, Lcom/vk/camera/camera1/Camera1View;->recorder:Lcom/vk/camera/CameraRecorder$RecorderBase;

    invoke-virtual {v3}, Lcom/vk/camera/CameraRecorder$RecorderBase;->getOutputFile()Ljava/io/File;

    move-result-object v2

    .line 364
    .local v2, "outputFile":Ljava/io/File;
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->doStopRecording()V

    .line 366
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/vk/camera/camera1/Camera1View;->recordStart:J

    sub-long/2addr v4, v6

    cmp-long v3, v4, v8

    if-gez v3, :cond_4

    .line 367
    if-eqz v2, :cond_2

    .line 368
    invoke-static {v2}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    .line 370
    :cond_2
    if-eqz v0, :cond_3

    .line 371
    invoke-interface {v0}, Lcom/vk/camera/CameraObject$OnRecordingCallback;->onCancel()V

    .line 379
    :cond_3
    :goto_1
    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View;->getFlashMode()I

    move-result v1

    .line 380
    .local v1, "currentFlashMode":I
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/vk/camera/camera1/Camera1View;->setFlashMode(I)V

    .line 382
    iget-object v3, p0, Lcom/vk/camera/camera1/Camera1View;->handler:Landroid/os/Handler;

    invoke-static {p0, v1}, Lcom/vk/camera/camera1/Camera1View$$Lambda$2;->lambdaFactory$(Lcom/vk/camera/camera1/Camera1View;I)Ljava/lang/Runnable;

    move-result-object v4

    invoke-virtual {v3, v4, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 374
    .end local v1    # "currentFlashMode":I
    :cond_4
    if-eqz v0, :cond_3

    .line 375
    invoke-interface {v0, v2}, Lcom/vk/camera/CameraObject$OnRecordingCallback;->onFinish(Ljava/io/File;)V

    goto :goto_1
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 105
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 97
    sget-object v0, Lcom/vk/camera/camera1/Camera1View;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "surfaceCreated"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View;->surfaceExists:Z

    .line 99
    invoke-direct {p0}, Lcom/vk/camera/camera1/Camera1View;->startCameraPreview()V

    .line 100
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 109
    sget-object v0, Lcom/vk/camera/camera1/Camera1View;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "surfaceDestroyed"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View;->surfaceExists:Z

    .line 111
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/camera/camera1/Camera1View;->destroyPreview(Z)V

    .line 112
    return-void
.end method

.method public takePicture()V
    .locals 1

    .prologue
    .line 271
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    if-eqz v0, :cond_0

    .line 272
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    invoke-virtual {v0}, Lcom/vk/camera/camera1/FocusOverlayManager;->doSnap()V

    .line 274
    :cond_0
    return-void
.end method

.method public transformToPreviewCoordinates(II)Landroid/graphics/Point;
    .locals 9
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 468
    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vk/camera/camera1/CameraHolder;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 469
    .local v0, "cameraParameters":Landroid/hardware/Camera$Parameters;
    iget-object v4, p0, Lcom/vk/camera/camera1/Camera1View;->focusOverlayManager:Lcom/vk/camera/camera1/FocusOverlayManager;

    if-eqz v4, :cond_0

    if-eqz v0, :cond_0

    .line 470
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v4

    iget v4, v4, Landroid/hardware/Camera$Size;->width:I

    int-to-float v3, v4

    .line 471
    .local v3, "previewWidth":F
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v4

    iget v4, v4, Landroid/hardware/Camera$Size;->height:I

    int-to-float v2, v4

    .line 473
    .local v2, "previewHeight":F
    iget-object v4, p0, Lcom/vk/camera/camera1/Camera1View;->previewTransformMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4}, Landroid/graphics/Matrix;->reset()V

    .line 474
    iget-object v4, p0, Lcom/vk/camera/camera1/Camera1View;->previewTransformMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float v5, v3, v5

    invoke-virtual {p0}, Lcom/vk/camera/camera1/Camera1View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float v6, v2, v6

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 476
    const/4 v4, 0x2

    new-array v1, v4, [F

    int-to-float v4, p1

    aput v4, v1, v7

    int-to-float v4, p2

    aput v4, v1, v8

    .line 477
    .local v1, "point":[F
    iget-object v4, p0, Lcom/vk/camera/camera1/Camera1View;->previewTransformMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 478
    new-instance v4, Landroid/graphics/Point;

    aget v5, v1, v7

    float-to-int v5, v5

    aget v6, v1, v8

    float-to-int v6, v6

    invoke-direct {v4, v5, v6}, Landroid/graphics/Point;-><init>(II)V

    .line 480
    .end local v1    # "point":[F
    .end local v2    # "previewHeight":F
    .end local v3    # "previewWidth":F
    :goto_0
    return-object v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method protected useFullBleedPreview()Z
    .locals 1

    .prologue
    .line 168
    iget-boolean v0, p0, Lcom/vk/camera/camera1/Camera1View;->useFullBleedPreview:Z

    return v0
.end method
