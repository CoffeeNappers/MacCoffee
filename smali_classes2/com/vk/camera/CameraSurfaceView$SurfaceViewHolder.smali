.class public Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;
.super Ljava/lang/Object;
.source "CameraSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/CameraSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SurfaceViewHolder"
.end annotation


# instance fields
.field private cameraPreview:Landroid/view/SurfaceView;

.field private previewHolder:Landroid/view/SurfaceHolder;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/SurfaceHolder$Callback;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callback"    # Landroid/view/SurfaceHolder$Callback;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Landroid/view/SurfaceView;

    invoke-direct {v0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->cameraPreview:Landroid/view/SurfaceView;

    .line 46
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->cameraPreview:Landroid/view/SurfaceView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 47
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->cameraPreview:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->previewHolder:Landroid/view/SurfaceHolder;

    .line 48
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->previewHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 49
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->previewHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p2}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 50
    return-void
.end method


# virtual methods
.method public getRecorder()Lcom/vk/camera/CameraRecorder$RecorderBase;
    .locals 1

    .prologue
    .line 84
    new-instance v0, Lcom/vk/camera/CameraRecorder$Recorder;

    invoke-direct {v0}, Lcom/vk/camera/CameraRecorder$Recorder;-><init>()V

    return-object v0
.end method

.method public getSurfaceView()Landroid/view/SurfaceView;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->cameraPreview:Landroid/view/SurfaceView;

    return-object v0
.end method

.method public getVideoProfile(I)Landroid/media/CamcorderProfile;
    .locals 1
    .param p1, "cameraId"    # I

    .prologue
    .line 61
    const/4 v0, 0x0

    return-object v0
.end method

.method public requestLayout()V
    .locals 1

    .prologue
    .line 65
    invoke-virtual {p0}, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->view()Landroid/view/View;

    move-result-object v0

    .line 66
    .local v0, "v":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 69
    :cond_0
    return-void
.end method

.method public setEffect(Ljava/lang/String;)Lcom/vk/camera/CameraSurfaceView$Status;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 88
    sget-object v0, Lcom/vk/camera/CameraSurfaceView$Status;->STATUS_OK:Lcom/vk/camera/CameraSurfaceView$Status;

    return-object v0
.end method

.method public startPreview(Lcom/vk/camera/camera1/CameraManager$CameraProxy;I)Z
    .locals 1
    .param p1, "camera"    # Lcom/vk/camera/camera1/CameraManager$CameraProxy;
    .param p2, "cameraId"    # I

    .prologue
    .line 72
    if-eqz p1, :cond_0

    .line 73
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->previewHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {p1, v0}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->setPreviewDisplayAsync(Landroid/view/SurfaceHolder;)V

    .line 74
    invoke-virtual {p1}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->startPreviewAsync()V

    .line 75
    const/4 v0, 0x1

    .line 77
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public stopPreview(Z)V
    .locals 0
    .param p1, "keep"    # Z

    .prologue
    .line 81
    return-void
.end method

.method public view()Landroid/view/View;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->cameraPreview:Landroid/view/SurfaceView;

    return-object v0
.end method
