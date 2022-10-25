.class abstract Lcom/wmspanel/libstream/VideoListener21Base;
.super Lcom/wmspanel/libstream/VideoListener;
.source "SourceFile"


# instance fields
.field protected mCamera2:Landroid/hardware/camera2/CameraDevice;

.field protected mCameraHandler:Landroid/os/Handler;

.field protected mCameraStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

.field protected mCameraThread:Landroid/os/HandlerThread;

.field protected mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

.field protected mPreviewSurface:Landroid/view/Surface;

.field protected mSessionStateCallback:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;


# direct methods
.method public constructor <init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V
    .locals 0
    .param p1, "streamBuffer"    # Lcom/wmspanel/libstream/StreamBuffer;
    .param p2, "listener"    # Lcom/wmspanel/libstream/Streamer$Listener;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/wmspanel/libstream/VideoListener;-><init>(Lcom/wmspanel/libstream/StreamBuffer;Lcom/wmspanel/libstream/Streamer$Listener;)V

    .line 23
    return-void
.end method
