.class public Lcom/vk/camera/CameraRecorder$Recorder;
.super Lcom/vk/camera/CameraRecorder$RecorderBase;
.source "CameraRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/CameraRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Recorder"
.end annotation


# instance fields
.field private recorder:Landroid/media/MediaRecorder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/vk/camera/CameraRecorder$RecorderBase;-><init>()V

    .line 80
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    return-void
.end method


# virtual methods
.method public isRecording()Z
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    if-eqz v0, :cond_0

    .line 86
    :try_start_0
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 90
    :goto_0
    :try_start_1
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 94
    :cond_0
    :goto_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    .line 95
    return-void

    .line 91
    :catch_0
    move-exception v0

    goto :goto_1

    .line 87
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public startRecording()Z
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 100
    :try_start_0
    iget-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v1}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->unlock()V

    .line 102
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getVideoFile()Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->outputFile:Ljava/io/File;

    .line 104
    new-instance v1, Landroid/media/MediaRecorder;

    invoke-direct {v1}, Landroid/media/MediaRecorder;-><init>()V

    iput-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    .line 105
    iget-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    iget-object v2, p0, Lcom/vk/camera/CameraRecorder$Recorder;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v2}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->getCamera()Landroid/hardware/Camera;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setCamera(Landroid/hardware/Camera;)V

    .line 106
    iget-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 107
    iget-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setVideoSource(I)V

    .line 108
    iget-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    iget-object v2, p0, Lcom/vk/camera/CameraRecorder$Recorder;->profile:Landroid/media/CamcorderProfile;

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setProfile(Landroid/media/CamcorderProfile;)V

    .line 109
    iget-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    iget-object v2, p0, Lcom/vk/camera/CameraRecorder$Recorder;->outputFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    .line 110
    iget-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    iget v2, p0, Lcom/vk/camera/CameraRecorder$Recorder;->outputOrientation:I

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setOrientationHint(I)V

    .line 111
    iget-wide v2, p0, Lcom/vk/camera/CameraRecorder$Recorder;->maxRecordingLengthMs:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 112
    iget-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    iget-wide v2, p0, Lcom/vk/camera/CameraRecorder$Recorder;->maxRecordingLengthMs:J

    long-to-int v2, v2

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setMaxDuration(I)V

    .line 114
    :cond_0
    iget-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1, p0}, Landroid/media/MediaRecorder;->setOnInfoListener(Landroid/media/MediaRecorder$OnInfoListener;)V

    .line 115
    iget-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1, p0}, Landroid/media/MediaRecorder;->setOnErrorListener(Landroid/media/MediaRecorder$OnErrorListener;)V

    .line 117
    iget-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->prepare()V

    .line 118
    iget-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    :goto_0
    return v6

    .line 119
    :catch_0
    move-exception v0

    .line 120
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/vk/camera/CameraRecorder$Recorder;->release()V

    .line 122
    :try_start_1
    iget-object v1, p0, Lcom/vk/camera/CameraRecorder$Recorder;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v1}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->lock()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 123
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method public stopRecording()V
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    if-eqz v0, :cond_0

    .line 138
    :try_start_0
    iget-object v0, p0, Lcom/vk/camera/CameraRecorder$Recorder;->recorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    :cond_0
    :goto_0
    return-void

    .line 139
    :catch_0
    move-exception v0

    goto :goto_0
.end method
