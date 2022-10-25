.class public Lcom/vk/media/camera/CameraEffects;
.super Lcom/vk/media/camera/CameraRender;
.source "CameraEffects.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/media/camera/CameraEffects$Stat;,
        Lcom/vk/media/camera/CameraEffects$Reader;,
        Lcom/vk/media/camera/CameraEffects$Status;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCameraId:I

.field private mEffectName:Ljava/lang/String;

.field private mProcessing:Z

.field private mProfile:Landroid/media/CamcorderProfile;

.field private mReader:Lcom/vk/media/camera/CameraEffects$Reader;

.field private mSource:Lcom/vk/media/camera/CameraSource;

.field private mStarted:Z

.field private mStat:Lcom/vk/media/camera/CameraEffects$Stat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/vk/media/camera/CameraEffects;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/media/camera/CameraEffects;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/TextureView$SurfaceTextureListener;Landroid/view/SurfaceView;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Landroid/view/TextureView$SurfaceTextureListener;
    .param p3, "view"    # Landroid/view/SurfaceView;

    .prologue
    const/4 v1, 0x0

    .line 47
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/media/camera/CameraRender;-><init>(Landroid/content/Context;Landroid/view/TextureView$SurfaceTextureListener;Landroid/view/SurfaceView;)V

    .line 28
    const/4 v0, -0x2

    iput v0, p0, Lcom/vk/media/camera/CameraEffects;->mCameraId:I

    .line 30
    iput-boolean v1, p0, Lcom/vk/media/camera/CameraEffects;->mProcessing:Z

    .line 31
    iput-boolean v1, p0, Lcom/vk/media/camera/CameraEffects;->mStarted:Z

    .line 36
    new-instance v0, Lcom/vk/media/camera/CameraEffects$Stat;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vk/media/camera/CameraEffects$Stat;-><init>(Lcom/vk/media/camera/CameraEffects;Lcom/vk/media/camera/CameraEffects$1;)V

    iput-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mStat:Lcom/vk/media/camera/CameraEffects$Stat;

    .line 48
    return-void
.end method

.method static synthetic access$100(Lcom/vk/media/camera/CameraEffects;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/camera/CameraEffects;

    .prologue
    .line 19
    iget-boolean v0, p0, Lcom/vk/media/camera/CameraEffects;->mProcessing:Z

    return v0
.end method

.method static synthetic access$200(Lcom/vk/media/camera/CameraEffects;)Lcom/vk/media/camera/CameraEffects$Stat;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/camera/CameraEffects;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mStat:Lcom/vk/media/camera/CameraEffects$Stat;

    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/vk/media/camera/CameraEffects;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static getVersion()I
    .locals 1

    .prologue
    .line 43
    invoke-static {}, Lcom/vk/medianative/MediaNative;->nativeProcessorGetVersion()I

    move-result v0

    return v0
.end method

.method private isSameEffect(Ljava/lang/String;)Z
    .locals 1
    .param p1, "effect"    # Ljava/lang/String;

    .prologue
    .line 168
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mEffectName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mEffectName:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isSupported()Z
    .locals 1

    .prologue
    .line 39
    invoke-static {}, Lcom/vk/medianative/MediaNative;->isMediaSupported()Z

    move-result v0

    return v0
.end method

.method private start(Landroid/hardware/Camera;IZ)V
    .locals 9
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "cameraId"    # I
    .param p3, "force"    # Z

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 136
    sget-object v0, Lcom/vk/media/camera/CameraEffects;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "start: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/camera/CameraEffects;->mCameraId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " texture="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/media/camera/CameraEffects;->getTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " process="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/vk/media/camera/CameraEffects;->mProcessing:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    iput-boolean v7, p0, Lcom/vk/media/camera/CameraEffects;->mStarted:Z

    .line 139
    if-eqz p2, :cond_7

    move v6, v7

    .line 141
    .local v6, "frontCamera":Z
    :goto_0
    iget-boolean v0, p0, Lcom/vk/media/camera/CameraEffects;->mProcessing:Z

    if-nez v0, :cond_0

    if-eqz p3, :cond_6

    .line 142
    :cond_0
    if-nez p3, :cond_1

    iget v0, p0, Lcom/vk/media/camera/CameraEffects;->mCameraId:I

    if-ne p2, v0, :cond_1

    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mSource:Lcom/vk/media/camera/CameraSource;

    if-nez v0, :cond_4

    .line 143
    :cond_1
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mSource:Lcom/vk/media/camera/CameraSource;

    if-eqz v0, :cond_2

    .line 144
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mSource:Lcom/vk/media/camera/CameraSource;

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraSource;->stop()V

    .line 146
    :cond_2
    new-instance v0, Lcom/vk/media/camera/CameraEffects$Reader;

    invoke-direct {v0, p0}, Lcom/vk/media/camera/CameraEffects$Reader;-><init>(Lcom/vk/media/camera/CameraEffects;)V

    iput-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mReader:Lcom/vk/media/camera/CameraEffects$Reader;

    .line 147
    new-instance v0, Lcom/vk/media/camera/CameraSource;

    iget-object v1, p0, Lcom/vk/media/camera/CameraEffects;->mReader:Lcom/vk/media/camera/CameraEffects$Reader;

    iget v2, p0, Lcom/vk/media/camera/CameraEffects;->mViewWidth:I

    iget v3, p0, Lcom/vk/media/camera/CameraEffects;->mViewHeight:I

    iget-object v4, p0, Lcom/vk/media/camera/CameraEffects;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/vk/media/camera/CameraEffects;->mSettings:Lcom/vk/media/camera/CameraUtils$Settings;

    invoke-virtual {v5}, Lcom/vk/media/camera/CameraUtils$Settings;->getFps()F

    move-result v5

    invoke-direct/range {v0 .. v5}, Lcom/vk/media/camera/CameraSource;-><init>(Lcom/vk/media/camera/CameraUtils$FrameObserver;IILandroid/content/Context;F)V

    iput-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mSource:Lcom/vk/media/camera/CameraSource;

    .line 148
    iget-object v1, p0, Lcom/vk/media/camera/CameraEffects;->mReader:Lcom/vk/media/camera/CameraEffects$Reader;

    iget v0, p0, Lcom/vk/media/camera/CameraEffects;->mCameraId:I

    if-eq p2, v0, :cond_8

    move v0, v7

    :goto_1
    if-nez v6, :cond_3

    move v8, v7

    :cond_3
    invoke-virtual {p0, v1, v0, v8}, Lcom/vk/media/camera/CameraEffects;->setFrameReader(Lcom/vk/media/camera/CameraUtils$FrameReader;ZZ)Z

    .line 151
    :cond_4
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mReader:Lcom/vk/media/camera/CameraEffects$Reader;

    if-eqz v0, :cond_5

    .line 152
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mReader:Lcom/vk/media/camera/CameraEffects$Reader;

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraEffects$Reader;->start()V

    .line 155
    :cond_5
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mSource:Lcom/vk/media/camera/CameraSource;

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraSource;->isReady()Z

    move-result v0

    if-nez v0, :cond_6

    .line 156
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mSource:Lcom/vk/media/camera/CameraSource;

    invoke-virtual {v0, p1, p2}, Lcom/vk/media/camera/CameraSource;->start(Landroid/hardware/Camera;I)Z

    .line 160
    :cond_6
    iput p2, p0, Lcom/vk/media/camera/CameraEffects;->mCameraId:I

    .line 162
    invoke-virtual {p0, v6}, Lcom/vk/media/camera/CameraEffects;->enableRecorderFlip(Z)V

    .line 163
    iget-boolean v0, p0, Lcom/vk/media/camera/CameraEffects;->mProcessing:Z

    invoke-virtual {p0, v0}, Lcom/vk/media/camera/CameraEffects;->enableFrameReader(Z)V

    .line 164
    invoke-virtual {p0, v7}, Lcom/vk/media/camera/CameraEffects;->enableRendering(Z)V

    .line 165
    return-void

    .end local v6    # "frontCamera":Z
    :cond_7
    move v6, v8

    .line 139
    goto :goto_0

    .restart local v6    # "frontCamera":Z
    :cond_8
    move v0, v8

    .line 148
    goto :goto_1
.end method

.method private stopRendering()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 172
    iget v2, p0, Lcom/vk/media/camera/CameraEffects;->mCameraId:I

    if-nez v2, :cond_0

    const/4 v0, 0x1

    .line 173
    .local v0, "backCamera":Z
    :goto_0
    invoke-virtual {p0, v3, v1, v0}, Lcom/vk/media/camera/CameraEffects;->setFrameReader(Lcom/vk/media/camera/CameraUtils$FrameReader;ZZ)Z

    .line 174
    invoke-virtual {p0, v1}, Lcom/vk/media/camera/CameraEffects;->enableRendering(Z)V

    .line 177
    const/4 v1, 0x0

    :try_start_0
    invoke-static {v1, v0}, Lcom/vk/medianative/MediaNative;->nativeProcessorLoad(Ljava/lang/String;Z)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    :goto_1
    return-void

    .end local v0    # "backCamera":Z
    :cond_0
    move v0, v1

    .line 172
    goto :goto_0

    .line 178
    .restart local v0    # "backCamera":Z
    :catch_0
    move-exception v1

    goto :goto_1
.end method


# virtual methods
.method public capture(Landroid/hardware/Camera$PictureCallback;)Z
    .locals 3
    .param p1, "callback"    # Landroid/hardware/Camera$PictureCallback;

    .prologue
    .line 126
    iget-object v1, p0, Lcom/vk/media/camera/CameraEffects;->mReader:Lcom/vk/media/camera/CameraEffects$Reader;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vk/media/camera/CameraEffects;->mProcessing:Z

    if-eqz v1, :cond_0

    .line 127
    new-instance v0, Lcom/vk/media/camera/CameraUtils$Frame;

    invoke-direct {v0}, Lcom/vk/media/camera/CameraUtils$Frame;-><init>()V

    .line 128
    .local v0, "frame":Lcom/vk/media/camera/CameraUtils$Frame;
    iget-object v1, p0, Lcom/vk/media/camera/CameraEffects;->mReader:Lcom/vk/media/camera/CameraEffects$Reader;

    invoke-virtual {v1, v0}, Lcom/vk/media/camera/CameraEffects$Reader;->pull(Lcom/vk/media/camera/CameraUtils$Frame;)V

    .line 129
    invoke-static {v0}, Lcom/vk/media/camera/CameraUtils;->makeJpeg(Lcom/vk/media/camera/CameraUtils$Frame;)[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Landroid/hardware/Camera$PictureCallback;->onPictureTaken([BLandroid/hardware/Camera;)V

    .line 130
    const/4 v1, 0x1

    .line 132
    .end local v0    # "frame":Lcom/vk/media/camera/CameraUtils$Frame;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getVideoProfile(I)Landroid/media/CamcorderProfile;
    .locals 1
    .param p1, "cameraId"    # I

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mEffectName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mSettings:Lcom/vk/media/camera/CameraUtils$Settings;

    invoke-virtual {v0, p1}, Lcom/vk/media/camera/CameraUtils$Settings;->getVideoProfileDefault(I)Landroid/media/CamcorderProfile;

    move-result-object v0

    .line 52
    :goto_0
    return-object v0

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mSettings:Lcom/vk/media/camera/CameraUtils$Settings;

    .line 52
    invoke-virtual {v0, p1}, Lcom/vk/media/camera/CameraUtils$Settings;->getVideoProfile(I)Landroid/media/CamcorderProfile;

    move-result-object v0

    goto :goto_0
.end method

.method public start(Landroid/hardware/Camera;ILjava/lang/String;)Lcom/vk/media/camera/CameraEffects$Status;
    .locals 11
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "cameraId"    # I
    .param p3, "effectName"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 56
    sget-object v5, Lcom/vk/media/camera/CameraEffects$Status;->STATUS_OK:Lcom/vk/media/camera/CameraEffects$Status;

    .line 57
    .local v5, "status":Lcom/vk/media/camera/CameraEffects$Status;
    iget-boolean v8, p0, Lcom/vk/media/camera/CameraEffects;->mStarted:Z

    if-eqz v8, :cond_0

    invoke-direct {p0, p3}, Lcom/vk/media/camera/CameraEffects;->isSameEffect(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    iget v8, p0, Lcom/vk/media/camera/CameraEffects;->mCameraId:I

    if-eq p2, v8, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraEffects;->getTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v8

    if-nez v8, :cond_2

    :cond_1
    move-object v6, v5

    .line 97
    :goto_0
    return-object v6

    .line 61
    :cond_2
    iput-object p3, p0, Lcom/vk/media/camera/CameraEffects;->mEffectName:Ljava/lang/String;

    .line 62
    invoke-virtual {p0, p2}, Lcom/vk/media/camera/CameraEffects;->getVideoProfile(I)Landroid/media/CamcorderProfile;

    move-result-object v4

    .line 64
    .local v4, "profile":Landroid/media/CamcorderProfile;
    if-eqz v4, :cond_3

    iget-object v8, p0, Lcom/vk/media/camera/CameraEffects;->mProfile:Landroid/media/CamcorderProfile;

    invoke-virtual {v4, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    move v1, v6

    .line 65
    .local v1, "force":Z
    :goto_1
    iput-object v4, p0, Lcom/vk/media/camera/CameraEffects;->mProfile:Landroid/media/CamcorderProfile;

    .line 66
    iget-object v8, p0, Lcom/vk/media/camera/CameraEffects;->mProfile:Landroid/media/CamcorderProfile;

    invoke-virtual {p0, v8}, Lcom/vk/media/camera/CameraEffects;->initProfile(Landroid/media/CamcorderProfile;)V

    .line 69
    if-nez p2, :cond_4

    move v0, v6

    .line 70
    .local v0, "backCamera":Z
    :goto_2
    if-eqz p3, :cond_9

    .line 71
    :try_start_0
    iget-object v8, p0, Lcom/vk/media/camera/CameraEffects;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/vk/media/camera/CameraUtilsEffects;->engineDataDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 72
    .local v3, "path":Ljava/lang/String;
    iget v8, p0, Lcom/vk/media/camera/CameraEffects;->mViewWidth:I

    iget v9, p0, Lcom/vk/media/camera/CameraEffects;->mViewHeight:I

    invoke-static {}, Lcom/vk/media/camera/CameraUtils;->useYUVRender()Z

    move-result v10

    if-nez v10, :cond_5

    :goto_3
    invoke-static {v3, v8, v9, v6}, Lcom/vk/medianative/MediaNative;->nativeProcessorInit(Ljava/lang/String;IIZ)Z

    .line 74
    iget-object v6, p0, Lcom/vk/media/camera/CameraEffects;->mContext:Landroid/content/Context;

    invoke-static {v6, p3}, Lcom/vk/media/camera/CameraUtilsEffects;->effectJson(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 75
    .local v2, "mask":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_6

    .line 76
    sget-object v6, Lcom/vk/media/camera/CameraEffects$Status;->STATUS_EFFECT_NOT_EXIST:Lcom/vk/media/camera/CameraEffects$Status;

    goto :goto_0

    .end local v0    # "backCamera":Z
    .end local v1    # "force":Z
    .end local v2    # "mask":Ljava/io/File;
    .end local v3    # "path":Ljava/lang/String;
    :cond_3
    move v1, v7

    .line 64
    goto :goto_1

    .restart local v1    # "force":Z
    :cond_4
    move v0, v7

    .line 69
    goto :goto_2

    .restart local v0    # "backCamera":Z
    .restart local v3    # "path":Ljava/lang/String;
    :cond_5
    move v6, v7

    .line 72
    goto :goto_3

    .line 79
    .restart local v2    # "mask":Ljava/io/File;
    :cond_6
    iget v6, p0, Lcom/vk/media/camera/CameraEffects;->mCameraId:I

    if-eq p2, v6, :cond_7

    .line 80
    invoke-direct {p0}, Lcom/vk/media/camera/CameraEffects;->stopRendering()V

    .line 83
    :cond_7
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v0}, Lcom/vk/medianative/MediaNative;->nativeProcessorLoad(Ljava/lang/String;Z)Z

    move-result v6

    iput-boolean v6, p0, Lcom/vk/media/camera/CameraEffects;->mProcessing:Z

    .line 84
    iget-boolean v6, p0, Lcom/vk/media/camera/CameraEffects;->mProcessing:Z

    if-nez v6, :cond_8

    .line 85
    sget-object v5, Lcom/vk/media/camera/CameraEffects$Status;->STATUS_EFFECT_NOT_LOADED:Lcom/vk/media/camera/CameraEffects$Status;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    .end local v2    # "mask":Ljava/io/File;
    .end local v3    # "path":Ljava/lang/String;
    :cond_8
    :goto_4
    invoke-direct {p0, p1, p2, v1}, Lcom/vk/media/camera/CameraEffects;->start(Landroid/hardware/Camera;IZ)V

    .line 96
    sget-object v6, Lcom/vk/media/camera/CameraEffects;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "start: effect="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/vk/media/camera/CameraEffects;->mEffectName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " status="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-object v6, v5

    .line 97
    goto/16 :goto_0

    .line 88
    :cond_9
    const/4 v6, 0x0

    :try_start_1
    invoke-static {v6, v0}, Lcom/vk/medianative/MediaNative;->nativeProcessorLoad(Ljava/lang/String;Z)Z

    .line 89
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraEffects;->cleanupFrameReader()V

    .line 90
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/vk/media/camera/CameraEffects;->mProcessing:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4

    .line 92
    :catch_0
    move-exception v6

    goto :goto_4
.end method

.method public stop(Z)V
    .locals 5
    .param p1, "release"    # Z

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 101
    sget-object v0, Lcom/vk/media/camera/CameraEffects;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "stop id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/camera/CameraEffects;->mCameraId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " release="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    iput-boolean v3, p0, Lcom/vk/media/camera/CameraEffects;->mStarted:Z

    .line 104
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mSource:Lcom/vk/media/camera/CameraSource;

    if-eqz v0, :cond_0

    .line 105
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mSource:Lcom/vk/media/camera/CameraSource;

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraSource;->stop()V

    .line 108
    :cond_0
    invoke-direct {p0}, Lcom/vk/media/camera/CameraEffects;->stopRendering()V

    .line 110
    if-eqz p1, :cond_2

    .line 111
    iput-boolean v3, p0, Lcom/vk/media/camera/CameraEffects;->mProcessing:Z

    .line 113
    :try_start_0
    invoke-static {}, Lcom/vk/medianative/MediaNative;->nativeProcessorDestroy()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    :goto_0
    iput-object v4, p0, Lcom/vk/media/camera/CameraEffects;->mSource:Lcom/vk/media/camera/CameraSource;

    .line 117
    iput-object v4, p0, Lcom/vk/media/camera/CameraEffects;->mEffectName:Ljava/lang/String;

    .line 123
    :cond_1
    :goto_1
    return-void

    .line 119
    :cond_2
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    if-eqz v0, :cond_1

    .line 120
    iget-object v0, p0, Lcom/vk/media/camera/CameraEffects;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraRecorder;->stop()V

    goto :goto_1

    .line 114
    :catch_0
    move-exception v0

    goto :goto_0
.end method
