.class public abstract Lcom/vk/camera/CameraRecorder$RecorderBase;
.super Ljava/lang/Object;
.source "CameraRecorder.java"

# interfaces
.implements Lcom/vk/camera/CameraObject$Recorder;
.implements Landroid/media/MediaRecorder$OnInfoListener;
.implements Landroid/media/MediaRecorder$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/CameraRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "RecorderBase"
.end annotation


# instance fields
.field protected camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

.field protected maxRecordingLengthMs:J

.field protected outputFile:Ljava/io/File;

.field protected outputOrientation:I

.field protected profile:Landroid/media/CamcorderProfile;

.field protected recordingCallback:Lcom/vk/camera/CameraObject$OnRecordingCallback;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, -0x1

    iput v0, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->outputOrientation:I

    return-void
.end method


# virtual methods
.method public capture(Landroid/hardware/Camera$PictureCallback;)Z
    .locals 2
    .param p1, "callback"    # Landroid/hardware/Camera$PictureCallback;

    .prologue
    const/4 v1, 0x0

    .line 71
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 72
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v0, v1, v1, v1, p1}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V

    .line 73
    const/4 v0, 0x1

    .line 75
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCallback()Lcom/vk/camera/CameraObject$OnRecordingCallback;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->recordingCallback:Lcom/vk/camera/CameraObject$OnRecordingCallback;

    return-object v0
.end method

.method public getMaxRecordingLengthMs()J
    .locals 2

    .prologue
    .line 42
    iget-wide v0, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->maxRecordingLengthMs:J

    return-wide v0
.end method

.method public getOutputFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->outputFile:Ljava/io/File;

    return-object v0
.end method

.method public onError(Landroid/media/MediaRecorder;II)V
    .locals 1
    .param p1, "mr"    # Landroid/media/MediaRecorder;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    .line 64
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->recordingCallback:Lcom/vk/camera/CameraObject$OnRecordingCallback;

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->recordingCallback:Lcom/vk/camera/CameraObject$OnRecordingCallback;

    invoke-interface {v0, p2, p3}, Lcom/vk/camera/CameraObject$OnRecordingCallback;->onError(II)V

    .line 67
    :cond_0
    return-void
.end method

.method public onInfo(Landroid/media/MediaRecorder;II)V
    .locals 1
    .param p1, "mr"    # Landroid/media/MediaRecorder;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->recordingCallback:Lcom/vk/camera/CameraObject$OnRecordingCallback;

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->recordingCallback:Lcom/vk/camera/CameraObject$OnRecordingCallback;

    invoke-interface {v0, p2, p3}, Lcom/vk/camera/CameraObject$OnRecordingCallback;->onInfo(II)V

    .line 60
    :cond_0
    return-void
.end method

.method public release()V
    .locals 0

    .prologue
    .line 24
    return-void
.end method

.method public setMaxRecordingLengthMs(J)V
    .locals 1
    .param p1, "maxRecordingLengthMs"    # J

    .prologue
    .line 47
    iput-wide p1, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->maxRecordingLengthMs:J

    .line 48
    return-void
.end method

.method public setRecordingCallback(Lcom/vk/camera/CameraObject$OnRecordingCallback;)V
    .locals 0
    .param p1, "recordingCallback"    # Lcom/vk/camera/CameraObject$OnRecordingCallback;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->recordingCallback:Lcom/vk/camera/CameraObject$OnRecordingCallback;

    .line 53
    return-void
.end method

.method public setup(Lcom/vk/camera/camera1/CameraManager$CameraProxy;Landroid/media/CamcorderProfile;I)V
    .locals 0
    .param p1, "camera"    # Lcom/vk/camera/camera1/CameraManager$CameraProxy;
    .param p2, "profile"    # Landroid/media/CamcorderProfile;
    .param p3, "orientationHint"    # I

    .prologue
    .line 31
    iput-object p1, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .line 32
    iput-object p2, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->profile:Landroid/media/CamcorderProfile;

    .line 33
    iput p3, p0, Lcom/vk/camera/CameraRecorder$RecorderBase;->outputOrientation:I

    .line 34
    return-void
.end method
