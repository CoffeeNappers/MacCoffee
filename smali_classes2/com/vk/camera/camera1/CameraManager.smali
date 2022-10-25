.class public Lcom/vk/camera/camera1/CameraManager;
.super Ljava/lang/Object;
.source "CameraManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/camera/camera1/CameraManager$CameraProxy;,
        Lcom/vk/camera/camera1/CameraManager$CameraHandler;
    }
.end annotation


# static fields
.field private static final ADD_CALLBACK_BUFFER:I = 0x9

.field private static final AUTO_FOCUS:I = 0xa

.field private static final CANCEL_AUTO_FOCUS:I = 0xb

.field private static final ENABLE_SHUTTER_SOUND:I = 0x19

.field private static final GET_PARAMETERS:I = 0x14

.field private static final LOCK:I = 0x4

.field private static final RECONNECT:I = 0x2

.field private static final RELEASE:I = 0x1

.field private static final SET_AUTO_FOCUS_MOVE_CALLBACK:I = 0xc

.field private static final SET_DISPLAY_ORIENTATION:I = 0xd

.field private static final SET_ERROR_CALLBACK:I = 0x12

.field private static final SET_FACE_DETECTION_LISTENER:I = 0xf

.field private static final SET_PARAMETERS:I = 0x13

.field private static final SET_PARAMETERS_ASYNC:I = 0x15

.field private static final SET_PREVIEW_CALLBACK:I = 0x18

.field private static final SET_PREVIEW_CALLBACK_WITH_BUFFER:I = 0x8

.field private static final SET_PREVIEW_DISPLAY_ASYNC:I = 0x17

.field private static final SET_PREVIEW_TEXTURE_ASYNC:I = 0x5

.field private static final SET_ZOOM_CHANGE_LISTENER:I = 0xe

.field private static final START_FACE_DETECTION:I = 0x10

.field private static final START_PREVIEW_ASYNC:I = 0x6

.field private static final STOP_FACE_DETECTION:I = 0x11

.field private static final STOP_PREVIEW:I = 0x7

.field private static final TAG:Ljava/lang/String; = "CameraManager"

.field private static final UNLOCK:I = 0x3

.field private static final WAIT_FOR_IDLE:I = 0x16

.field private static sCameraManager:Lcom/vk/camera/camera1/CameraManager;


# instance fields
.field private mCamera:Landroid/hardware/Camera;

.field private mCameraHandler:Landroid/os/Handler;

.field private mCameraProxy:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

.field private mParameters:Landroid/hardware/Camera$Parameters;

.field private mReconnectException:Ljava/lang/Exception;

.field private mSig:Landroid/os/ConditionVariable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    new-instance v0, Lcom/vk/camera/camera1/CameraManager;

    invoke-direct {v0}, Lcom/vk/camera/camera1/CameraManager;-><init>()V

    sput-object v0, Lcom/vk/camera/camera1/CameraManager;->sCameraManager:Lcom/vk/camera/camera1/CameraManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v1, Landroid/os/ConditionVariable;

    invoke-direct {v1}, Landroid/os/ConditionVariable;-><init>()V

    iput-object v1, p0, Lcom/vk/camera/camera1/CameraManager;->mSig:Landroid/os/ConditionVariable;

    .line 63
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "Camera Handler Thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 64
    .local v0, "ht":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 65
    new-instance v1, Lcom/vk/camera/camera1/CameraManager$CameraHandler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vk/camera/camera1/CameraManager$CameraHandler;-><init>(Lcom/vk/camera/camera1/CameraManager;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/vk/camera/camera1/CameraManager;->mCameraHandler:Landroid/os/Handler;

    .line 66
    return-void
.end method

.method static synthetic access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/CameraManager;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager;->mCamera:Landroid/hardware/Camera;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vk/camera/camera1/CameraManager;Landroid/hardware/Camera;)Landroid/hardware/Camera;
    .locals 0
    .param p0, "x0"    # Lcom/vk/camera/camera1/CameraManager;
    .param p1, "x1"    # Landroid/hardware/Camera;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/vk/camera/camera1/CameraManager;->mCamera:Landroid/hardware/Camera;

    return-object p1
.end method

.method static synthetic access$102(Lcom/vk/camera/camera1/CameraManager;Lcom/vk/camera/camera1/CameraManager$CameraProxy;)Lcom/vk/camera/camera1/CameraManager$CameraProxy;
    .locals 0
    .param p0, "x0"    # Lcom/vk/camera/camera1/CameraManager;
    .param p1, "x1"    # Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/vk/camera/camera1/CameraManager;->mCameraProxy:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vk/camera/camera1/CameraManager;)Ljava/lang/Exception;
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/CameraManager;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager;->mReconnectException:Ljava/lang/Exception;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vk/camera/camera1/CameraManager;Ljava/lang/Exception;)Ljava/lang/Exception;
    .locals 0
    .param p0, "x0"    # Lcom/vk/camera/camera1/CameraManager;
    .param p1, "x1"    # Ljava/lang/Exception;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/vk/camera/camera1/CameraManager;->mReconnectException:Ljava/lang/Exception;

    return-object p1
.end method

.method static synthetic access$300(Lcom/vk/camera/camera1/CameraManager;Landroid/hardware/Camera;Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/camera/camera1/CameraManager;
    .param p1, "x1"    # Landroid/hardware/Camera;
    .param p2, "x2"    # Ljava/lang/Object;

    .prologue
    .line 18
    invoke-direct {p0, p1, p2}, Lcom/vk/camera/camera1/CameraManager;->setAutoFocusMoveCallback(Landroid/hardware/Camera;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera$Parameters;
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/CameraManager;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager;->mParameters:Landroid/hardware/Camera$Parameters;

    return-object v0
.end method

.method static synthetic access$402(Lcom/vk/camera/camera1/CameraManager;Landroid/hardware/Camera$Parameters;)Landroid/hardware/Camera$Parameters;
    .locals 0
    .param p0, "x0"    # Lcom/vk/camera/camera1/CameraManager;
    .param p1, "x1"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/vk/camera/camera1/CameraManager;->mParameters:Landroid/hardware/Camera$Parameters;

    return-object p1
.end method

.method static synthetic access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/CameraManager;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager;->mSig:Landroid/os/ConditionVariable;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/vk/camera/camera1/CameraManager;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager;->mCameraHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public static instance()Lcom/vk/camera/camera1/CameraManager;
    .locals 1

    .prologue
    .line 59
    sget-object v0, Lcom/vk/camera/camera1/CameraManager;->sCameraManager:Lcom/vk/camera/camera1/CameraManager;

    return-object v0
.end method

.method private setAutoFocusMoveCallback(Landroid/hardware/Camera;Ljava/lang/Object;)V
    .locals 0
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "cb"    # Ljava/lang/Object;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 289
    check-cast p2, Landroid/hardware/Camera$AutoFocusMoveCallback;

    .end local p2    # "cb":Ljava/lang/Object;
    invoke-virtual {p1, p2}, Landroid/hardware/Camera;->setAutoFocusMoveCallback(Landroid/hardware/Camera$AutoFocusMoveCallback;)V

    .line 290
    return-void
.end method


# virtual methods
.method cameraOpen(I)Lcom/vk/camera/camera1/CameraManager$CameraProxy;
    .locals 2
    .param p1, "cameraId"    # I

    .prologue
    const/4 v0, 0x0

    .line 301
    invoke-static {p1}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/camera/camera1/CameraManager;->mCamera:Landroid/hardware/Camera;

    .line 302
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraManager;->mCamera:Landroid/hardware/Camera;

    if-eqz v1, :cond_0

    .line 303
    new-instance v1, Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-direct {v1, p0, v0}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;-><init>(Lcom/vk/camera/camera1/CameraManager;Lcom/vk/camera/camera1/CameraManager$1;)V

    iput-object v1, p0, Lcom/vk/camera/camera1/CameraManager;->mCameraProxy:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .line 304
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager;->mCameraProxy:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .line 306
    :cond_0
    return-object v0
.end method
