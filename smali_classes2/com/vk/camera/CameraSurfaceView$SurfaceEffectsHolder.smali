.class public Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;
.super Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;
.source "CameraSurfaceView.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/CameraSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SurfaceEffectsHolder"
.end annotation


# instance fields
.field private camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

.field private cameraId:I

.field private lastEffect:Ljava/lang/String;

.field private processor:Lcom/vk/media/camera/CameraEffects;

.field private startDelayed:Z

.field private started:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/SurfaceHolder$Callback;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callback"    # Landroid/view/SurfaceHolder$Callback;

    .prologue
    const/4 v4, 0x0

    .line 104
    invoke-direct {p0, p1, p2}, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;-><init>(Landroid/content/Context;Landroid/view/SurfaceHolder$Callback;)V

    .line 99
    iput-boolean v4, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->started:Z

    .line 100
    iput-boolean v4, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->startDelayed:Z

    .line 106
    invoke-static {}, Lcom/vk/camera/CameraSurfaceView;->access$000()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "version: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Lcom/vk/media/camera/CameraEffects;->getVersion()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/google/android/exoplayer2/util/Util;->getPhysicalDisplaySize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v1

    .line 108
    .local v1, "maxViewportSize":Landroid/graphics/Point;
    iget v4, v1, Landroid/graphics/Point;->x:I

    iget v5, v1, Landroid/graphics/Point;->y:I

    mul-int v2, v4, v5

    .line 110
    .local v2, "resolution":I
    const/4 v3, 0x1

    .line 111
    .local v3, "useMediaRecorder":Z
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getVideoConfig()Lcom/vkontakte/android/auth/configs/VideoConfig;

    move-result-object v0

    .line 112
    .local v0, "config":Lcom/vkontakte/android/auth/configs/VideoConfig;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/configs/VideoConfig;->isMediaCodecRecorder()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 113
    const/4 v3, 0x0

    .line 115
    :cond_0
    new-instance v4, Lcom/vk/media/camera/CameraEffects;

    invoke-virtual {p0}, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->getSurfaceView()Landroid/view/SurfaceView;

    move-result-object v5

    invoke-direct {v4, p1, p0, v5}, Lcom/vk/media/camera/CameraEffects;-><init>(Landroid/content/Context;Landroid/view/TextureView$SurfaceTextureListener;Landroid/view/SurfaceView;)V

    iput-object v4, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->processor:Lcom/vk/media/camera/CameraEffects;

    .line 116
    iget-object v4, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->processor:Lcom/vk/media/camera/CameraEffects;

    invoke-virtual {v4, v2, v3}, Lcom/vk/media/camera/CameraEffects;->init(IZ)V

    .line 117
    return-void
.end method

.method private startPreview()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 198
    invoke-static {}, Lcom/vk/camera/CameraSurfaceView;->access$000()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "startPreview "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->started:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->lastEffect:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    iget-object v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->started:Z

    if-nez v1, :cond_0

    .line 200
    iget-object v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->processor:Lcom/vk/media/camera/CameraEffects;

    invoke-virtual {v1}, Lcom/vk/media/camera/CameraEffects;->getTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    .line 201
    .local v0, "texture":Landroid/graphics/SurfaceTexture;
    if-eqz v0, :cond_1

    .line 202
    iget-object v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->processor:Lcom/vk/media/camera/CameraEffects;

    iget-object v2, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v2}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->getCamera()Landroid/hardware/Camera;

    move-result-object v2

    iget v3, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->cameraId:I

    iget-object v4, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->lastEffect:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Lcom/vk/media/camera/CameraEffects;->start(Landroid/hardware/Camera;ILjava/lang/String;)Lcom/vk/media/camera/CameraEffects$Status;

    .line 203
    iget-object v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v1, v0}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->setPreviewTextureAsync(Landroid/graphics/SurfaceTexture;)V

    .line 204
    iget-object v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v1}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->startPreviewAsync()V

    .line 205
    iput-boolean v5, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->started:Z

    .line 210
    .end local v0    # "texture":Landroid/graphics/SurfaceTexture;
    :cond_0
    :goto_0
    return-void

    .line 207
    .restart local v0    # "texture":Landroid/graphics/SurfaceTexture;
    :cond_1
    iput-boolean v5, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->startDelayed:Z

    goto :goto_0
.end method


# virtual methods
.method public getRecorder()Lcom/vk/camera/CameraRecorder$RecorderBase;
    .locals 2

    .prologue
    .line 148
    new-instance v0, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;

    iget-object v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->processor:Lcom/vk/media/camera/CameraEffects;

    invoke-direct {v0, v1}, Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;-><init>(Lcom/vk/media/camera/CameraEffects;)V

    return-object v0
.end method

.method public getVideoProfile(I)Landroid/media/CamcorderProfile;
    .locals 1
    .param p1, "cameraId"    # I

    .prologue
    .line 126
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->processor:Lcom/vk/media/camera/CameraEffects;

    invoke-virtual {v0, p1}, Lcom/vk/media/camera/CameraEffects;->getVideoProfile(I)Landroid/media/CamcorderProfile;

    move-result-object v0

    return-object v0
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 3
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 171
    invoke-static {}, Lcom/vk/camera/CameraSurfaceView;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onSurfaceTextureAvailable "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    iget-boolean v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->startDelayed:Z

    if-eqz v0, :cond_0

    .line 173
    invoke-direct {p0}, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->startPreview()V

    .line 175
    :cond_0
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 4
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;

    .prologue
    const/4 v3, 0x0

    .line 184
    invoke-static {}, Lcom/vk/camera/CameraSurfaceView;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onSurfaceTextureDestroyed "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->processor:Lcom/vk/media/camera/CameraEffects;

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->processor:Lcom/vk/media/camera/CameraEffects;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/media/camera/CameraEffects;->stop(Z)V

    .line 188
    :cond_0
    iput-boolean v3, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->startDelayed:Z

    .line 189
    iput-boolean v3, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->started:Z

    .line 190
    return v3
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 3
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 179
    invoke-static {}, Lcom/vk/camera/CameraSurfaceView;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onSurfaceTextureSizeChanged "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 195
    return-void
.end method

.method public setEffect(Ljava/lang/String;)Lcom/vk/camera/CameraSurfaceView$Status;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 153
    iget-object v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->processor:Lcom/vk/media/camera/CameraEffects;

    if-nez v1, :cond_1

    .line 154
    :cond_0
    sget-object v1, Lcom/vk/camera/CameraSurfaceView$Status;->STATUS_EMPTY_CAMERA:Lcom/vk/camera/CameraSurfaceView$Status;

    .line 166
    :goto_0
    return-object v1

    .line 156
    :cond_1
    iget-object v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->processor:Lcom/vk/media/camera/CameraEffects;

    iget-object v2, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    invoke-virtual {v2}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->getCamera()Landroid/hardware/Camera;

    move-result-object v2

    iget v3, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->cameraId:I

    invoke-virtual {v1, v2, v3, p1}, Lcom/vk/media/camera/CameraEffects;->start(Landroid/hardware/Camera;ILjava/lang/String;)Lcom/vk/media/camera/CameraEffects$Status;

    move-result-object v0

    .line 157
    .local v0, "st":Lcom/vk/media/camera/CameraEffects$Status;
    sget-object v1, Lcom/vk/media/camera/CameraEffects$Status;->STATUS_OK:Lcom/vk/media/camera/CameraEffects$Status;

    if-ne v0, v1, :cond_2

    .line 158
    iput-object p1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->lastEffect:Ljava/lang/String;

    .line 159
    sget-object v1, Lcom/vk/camera/CameraSurfaceView$Status;->STATUS_OK:Lcom/vk/camera/CameraSurfaceView$Status;

    goto :goto_0

    .line 162
    :cond_2
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->lastEffect:Ljava/lang/String;

    .line 163
    sget-object v1, Lcom/vk/media/camera/CameraEffects$Status;->STATUS_EFFECT_NOT_EXIST:Lcom/vk/media/camera/CameraEffects$Status;

    if-ne v0, v1, :cond_3

    .line 164
    sget-object v1, Lcom/vk/camera/CameraSurfaceView$Status;->STATUS_NOT_EXIST:Lcom/vk/camera/CameraSurfaceView$Status;

    goto :goto_0

    .line 166
    :cond_3
    sget-object v1, Lcom/vk/camera/CameraSurfaceView$Status;->STATUS_NOT_LOADED:Lcom/vk/camera/CameraSurfaceView$Status;

    goto :goto_0
.end method

.method public startPreview(Lcom/vk/camera/camera1/CameraManager$CameraProxy;I)Z
    .locals 1
    .param p1, "camera"    # Lcom/vk/camera/camera1/CameraManager$CameraProxy;
    .param p2, "cameraId"    # I

    .prologue
    .line 131
    iput-object p1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->camera:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .line 132
    iput p2, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->cameraId:I

    .line 133
    invoke-direct {p0}, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->startPreview()V

    .line 135
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->lastEffect:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->lastEffect:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->setEffect(Ljava/lang/String;)Lcom/vk/camera/CameraSurfaceView$Status;

    .line 138
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public stopPreview(Z)V
    .locals 3
    .param p1, "keep"    # Z

    .prologue
    const/4 v1, 0x0

    .line 143
    iget-object v2, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->processor:Lcom/vk/media/camera/CameraEffects;

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v0}, Lcom/vk/media/camera/CameraEffects;->stop(Z)V

    .line 144
    iput-boolean v1, p0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;->started:Z

    .line 145
    return-void

    :cond_0
    move v0, v1

    .line 143
    goto :goto_0
.end method

.method public view()Landroid/view/View;
    .locals 1

    .prologue
    .line 121
    invoke-super {p0}, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;->view()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
