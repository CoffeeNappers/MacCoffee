.class public Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;
.super Lcom/vk/camera/CameraRecorder$RecorderBase;
.source "CameraSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/CameraSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SurfaceRecorder"
.end annotation


# instance fields
.field private processor:Lcom/vk/media/camera/CameraEffects;

.field private recorder:Lcom/vk/media/camera/CameraUtils$Recorder;


# direct methods
.method public constructor <init>(Lcom/vk/media/camera/CameraEffects;)V
    .locals 0
    .param p1, "processor"    # Lcom/vk/media/camera/CameraEffects;

    .prologue
    .line 217
    invoke-direct {p0}, Lcom/vk/camera/CameraRecorder$RecorderBase;-><init>()V

    .line 218
    iput-object p1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->processor:Lcom/vk/media/camera/CameraEffects;

    .line 219
    return-void
.end method


# virtual methods
.method public capture(Landroid/hardware/Camera$PictureCallback;)Z
    .locals 1
    .param p1, "callback"    # Landroid/hardware/Camera$PictureCallback;

    .prologue
    .line 256
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->processor:Lcom/vk/media/camera/CameraEffects;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->processor:Lcom/vk/media/camera/CameraEffects;

    invoke-virtual {v0, p1}, Lcom/vk/media/camera/CameraEffects;->capture(Landroid/hardware/Camera$PictureCallback;)Z

    move-result v0

    if-eqz v0, :cond_0

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
    .line 244
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    invoke-interface {v0}, Lcom/vk/media/camera/CameraUtils$Recorder;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public startRecording()Z
    .locals 4

    .prologue
    .line 223
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getVideoFile()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->outputFile:Ljava/io/File;

    .line 224
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    if-nez v0, :cond_0

    .line 225
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->processor:Lcom/vk/media/camera/CameraEffects;

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraEffects;->getRecorder()Lcom/vk/media/camera/CameraUtils$Recorder;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    .line 226
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    if-nez v0, :cond_0

    .line 227
    invoke-static {}, Lcom/vk/camera/CameraSurfaceView;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "can\'t create camera recorder"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    const/4 v0, 0x0

    .line 239
    :goto_0
    return v0

    .line 231
    :cond_0
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    iget-object v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->outputFile:Ljava/io/File;

    invoke-interface {v0, v1}, Lcom/vk/media/camera/CameraUtils$Recorder;->setOutputFile(Ljava/io/File;)V

    .line 232
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    iget v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->outputOrientation:I

    invoke-interface {v0, v1}, Lcom/vk/media/camera/CameraUtils$Recorder;->setOrientationHint(I)V

    .line 233
    iget-wide v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->maxRecordingLengthMs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 234
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    iget-wide v2, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->maxRecordingLengthMs:J

    long-to-int v1, v2

    invoke-interface {v0, v1}, Lcom/vk/media/camera/CameraUtils$Recorder;->setMaxDuration(I)V

    .line 236
    :cond_1
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    invoke-interface {v0, p0}, Lcom/vk/media/camera/CameraUtils$Recorder;->setOnInfoListener(Landroid/media/MediaRecorder$OnInfoListener;)V

    .line 237
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    invoke-interface {v0, p0}, Lcom/vk/media/camera/CameraUtils$Recorder;->setOnErrorListener(Landroid/media/MediaRecorder$OnErrorListener;)V

    .line 238
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    invoke-interface {v0}, Lcom/vk/media/camera/CameraUtils$Recorder;->prepare()Z

    .line 239
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    invoke-interface {v0}, Lcom/vk/media/camera/CameraUtils$Recorder;->start()Z

    move-result v0

    goto :goto_0
.end method

.method public stopRecording()V
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    if-eqz v0, :cond_0

    .line 250
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;->recorder:Lcom/vk/media/camera/CameraUtils$Recorder;

    invoke-interface {v0}, Lcom/vk/media/camera/CameraUtils$Recorder;->stop()V

    .line 252
    :cond_0
    return-void
.end method
