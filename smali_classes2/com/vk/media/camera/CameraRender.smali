.class public Lcom/vk/media/camera/CameraRender;
.super Lcom/vk/media/utils/RenderBase;
.source "CameraRender.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/media/camera/CameraRender$RenderDrawable2D;,
        Lcom/vk/media/camera/CameraRender$RenderDrawableExt;
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private mFrame2D:Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

.field private mFrameExt:Lcom/vk/media/camera/CameraRender$RenderDrawableExt;

.field private mFrameReader:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected mOnRecordCallback:Lcom/vk/media/camera/CameraUtils$Recorder$OnRecordFrame;

.field private mPortrait:Z

.field protected mRecorder:Lcom/vk/media/camera/CameraRecorder;

.field private mRecordingFlip:Lcom/vk/media/utils/RenderDrawable$Flip;

.field private mRendering:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected mSettings:Lcom/vk/media/camera/CameraUtils$Settings;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/vk/media/camera/CameraRender;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/media/camera/CameraRender;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/TextureView$SurfaceTextureListener;Landroid/view/SurfaceView;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Landroid/view/TextureView$SurfaceTextureListener;
    .param p3, "view"    # Landroid/view/SurfaceView;

    .prologue
    const/4 v2, 0x0

    .line 44
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/media/utils/RenderBase;-><init>(Landroid/content/Context;Landroid/view/TextureView$SurfaceTextureListener;Landroid/view/SurfaceView;)V

    .line 31
    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Flip;->NO_FLIP:Lcom/vk/media/utils/RenderDrawable$Flip;

    iput-object v0, p0, Lcom/vk/media/camera/CameraRender;->mRecordingFlip:Lcom/vk/media/utils/RenderDrawable$Flip;

    .line 32
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrameReader:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 33
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/vk/media/camera/CameraRender;->mRendering:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 34
    iput-boolean v2, p0, Lcom/vk/media/camera/CameraRender;->mPortrait:Z

    .line 36
    new-instance v0, Lcom/vk/media/camera/CameraRender$1;

    invoke-direct {v0, p0}, Lcom/vk/media/camera/CameraRender$1;-><init>(Lcom/vk/media/camera/CameraRender;)V

    iput-object v0, p0, Lcom/vk/media/camera/CameraRender;->mOnRecordCallback:Lcom/vk/media/camera/CameraUtils$Recorder$OnRecordFrame;

    .line 45
    return-void
.end method

.method static synthetic access$000(Lcom/vk/media/camera/CameraRender;)Lcom/vk/media/utils/RenderDrawable$Flip;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/camera/CameraRender;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mRecordingFlip:Lcom/vk/media/utils/RenderDrawable$Flip;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/media/camera/CameraRender;Lcom/vk/media/camera/CameraUtils$Frame;Lcom/vk/media/utils/RenderDrawable$Flip;)J
    .locals 2
    .param p0, "x0"    # Lcom/vk/media/camera/CameraRender;
    .param p1, "x1"    # Lcom/vk/media/camera/CameraUtils$Frame;
    .param p2, "x2"    # Lcom/vk/media/utils/RenderDrawable$Flip;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/vk/media/camera/CameraRender;->renderFrame(Lcom/vk/media/camera/CameraUtils$Frame;Lcom/vk/media/utils/RenderDrawable$Flip;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$200(Lcom/vk/media/camera/CameraRender;)Lcom/vk/media/utils/grafika/EglCore;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/camera/CameraRender;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/media/camera/CameraRender;)Lcom/vk/media/utils/RenderHelpers$RenderTexture;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/camera/CameraRender;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    return-object v0
.end method

.method private draw()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 169
    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mRendering:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_0

    .line 186
    :goto_0
    return-void

    .line 173
    :cond_0
    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mFrameReader:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mFrame2D:Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mFrame2D:Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

    invoke-virtual {v1}, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->pull()Lcom/vk/media/camera/CameraUtils$Frame;

    move-result-object v0

    .line 174
    .local v0, "frame":Lcom/vk/media/camera/CameraUtils$Frame;
    :goto_1
    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    if-eqz v1, :cond_1

    .line 175
    iget-boolean v1, p0, Lcom/vk/media/camera/CameraRender;->mPortrait:Z

    if-eqz v1, :cond_3

    .line 176
    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    iget-object v2, p0, Lcom/vk/media/camera/CameraRender;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    iget v3, p0, Lcom/vk/media/camera/CameraRender;->mViewHeight:I

    iget v4, p0, Lcom/vk/media/camera/CameraRender;->mViewWidth:I

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/vk/media/camera/CameraRecorder;->record(Lcom/vk/media/camera/CameraUtils$Frame;Lcom/vk/media/utils/grafika/EglCore;II)V

    .line 182
    :cond_1
    :goto_2
    iget v1, p0, Lcom/vk/media/camera/CameraRender;->mDisplayWidth:I

    iget v2, p0, Lcom/vk/media/camera/CameraRender;->mDisplayHeight:I

    invoke-static {v5, v5, v1, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 183
    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mDisplaySurface:Lcom/vk/media/utils/grafika/WindowSurface;

    invoke-virtual {v1}, Lcom/vk/media/utils/grafika/WindowSurface;->makeCurrent()V

    .line 184
    sget-object v1, Lcom/vk/media/utils/RenderDrawable$Flip;->NO_FLIP:Lcom/vk/media/utils/RenderDrawable$Flip;

    invoke-direct {p0, v0, v1}, Lcom/vk/media/camera/CameraRender;->renderFrame(Lcom/vk/media/camera/CameraUtils$Frame;Lcom/vk/media/utils/RenderDrawable$Flip;)J

    .line 185
    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mDisplaySurface:Lcom/vk/media/utils/grafika/WindowSurface;

    invoke-virtual {v1}, Lcom/vk/media/utils/grafika/WindowSurface;->swapBuffers()Z

    goto :goto_0

    .line 173
    .end local v0    # "frame":Lcom/vk/media/camera/CameraUtils$Frame;
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 178
    .restart local v0    # "frame":Lcom/vk/media/camera/CameraUtils$Frame;
    :cond_3
    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    iget-object v2, p0, Lcom/vk/media/camera/CameraRender;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    iget v3, p0, Lcom/vk/media/camera/CameraRender;->mViewWidth:I

    iget v4, p0, Lcom/vk/media/camera/CameraRender;->mViewHeight:I

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/vk/media/camera/CameraRecorder;->record(Lcom/vk/media/camera/CameraUtils$Frame;Lcom/vk/media/utils/grafika/EglCore;II)V

    goto :goto_2
.end method

.method private renderFrame(Lcom/vk/media/camera/CameraUtils$Frame;Lcom/vk/media/utils/RenderDrawable$Flip;)J
    .locals 3
    .param p1, "frame"    # Lcom/vk/media/camera/CameraUtils$Frame;
    .param p2, "flip"    # Lcom/vk/media/utils/RenderDrawable$Flip;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrameReader:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/vk/media/camera/CameraUtils$Frame;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 190
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrame2D:Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrame2D:Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mSTMatrix:[F

    invoke-virtual {v0, p1, v1, p2}, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->drawFrame(Lcom/vk/media/camera/CameraUtils$Frame;[FLcom/vk/media/utils/RenderDrawable$Flip;)J

    move-result-wide v0

    .line 193
    :goto_0
    return-wide v0

    .line 190
    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0

    .line 192
    :cond_1
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrameExt:Lcom/vk/media/camera/CameraRender$RenderDrawableExt;

    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    invoke-virtual {v1}, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->getTextureId()I

    move-result v1

    iget-object v2, p0, Lcom/vk/media/camera/CameraRender;->mSTMatrix:[F

    invoke-virtual {v0, v1, v2, p2}, Lcom/vk/media/camera/CameraRender$RenderDrawableExt;->drawFrame(I[FLcom/vk/media/utils/RenderDrawable$Flip;)V

    .line 193
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    invoke-virtual {v0}, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->getTimestamp()J

    move-result-wide v0

    goto :goto_0
.end method


# virtual methods
.method protected cleanupFrameReader()V
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrame2D:Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrame2D:Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->clear()V

    .line 68
    :cond_0
    return-void
.end method

.method protected enableFrameReader(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 106
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrameReader:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 107
    return-void
.end method

.method protected enableRecorderFlip(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 61
    if-eqz p1, :cond_0

    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Flip;->VERTICAL:Lcom/vk/media/utils/RenderDrawable$Flip;

    :goto_0
    iput-object v0, p0, Lcom/vk/media/camera/CameraRender;->mRecordingFlip:Lcom/vk/media/utils/RenderDrawable$Flip;

    .line 62
    return-void

    .line 61
    :cond_0
    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Flip;->NO_FLIP:Lcom/vk/media/utils/RenderDrawable$Flip;

    goto :goto_0
.end method

.method protected enableRendering(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 110
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mRendering:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 111
    return-void
.end method

.method public getRecorder()Lcom/vk/media/camera/CameraUtils$Recorder;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    return-object v0
.end method

.method public getTexture()Landroid/graphics/SurfaceTexture;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    invoke-virtual {v0}, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->texture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    return-object v0
.end method

.method public init(IZ)V
    .locals 2
    .param p1, "maxResolution"    # I
    .param p2, "useMediaRecorder"    # Z

    .prologue
    .line 48
    new-instance v0, Lcom/vk/media/camera/CameraUtils$Settings;

    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Lcom/vk/media/camera/CameraUtils$Settings;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/vk/media/camera/CameraRender;->mSettings:Lcom/vk/media/camera/CameraUtils$Settings;

    .line 49
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mOnRecordCallback:Lcom/vk/media/camera/CameraUtils$Recorder$OnRecordFrame;

    invoke-static {v0, v1, p2}, Lcom/vk/media/camera/CameraRecorder;->create(Landroid/content/Context;Lcom/vk/media/camera/CameraUtils$Recorder$OnRecordFrame;Z)Lcom/vk/media/camera/CameraRecorder;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    .line 50
    return-void
.end method

.method protected initProfile(Landroid/media/CamcorderProfile;)V
    .locals 3
    .param p1, "profile"    # Landroid/media/CamcorderProfile;

    .prologue
    .line 71
    if-eqz p1, :cond_0

    .line 72
    iget v0, p1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget v1, p1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {p0, v0, v1}, Lcom/vk/media/camera/CameraRender;->setViewSize(II)V

    .line 75
    :cond_0
    iget v0, p0, Lcom/vk/media/camera/CameraRender;->mDisplayWidth:I

    iget v1, p0, Lcom/vk/media/camera/CameraRender;->mDisplayHeight:I

    if-ge v0, v1, :cond_3

    iget v0, p0, Lcom/vk/media/camera/CameraRender;->mViewHeight:I

    iget v1, p0, Lcom/vk/media/camera/CameraRender;->mViewWidth:I

    if-ge v0, v1, :cond_3

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vk/media/camera/CameraRender;->mPortrait:Z

    .line 77
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    if-eqz v0, :cond_2

    .line 78
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    invoke-virtual {v0, p1}, Lcom/vk/media/camera/CameraRecorder;->setProfile(Landroid/media/CamcorderProfile;)V

    .line 79
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraRecorder;->useExternalRecorder()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 80
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraRecorder;->prepare()Z

    .line 82
    :cond_1
    new-instance v0, Lcom/vk/media/camera/CameraRender$2;

    invoke-direct {v0, p0}, Lcom/vk/media/camera/CameraRender$2;-><init>(Lcom/vk/media/camera/CameraRender;)V

    invoke-virtual {p0, v0}, Lcom/vk/media/camera/CameraRender;->queueEvent(Ljava/lang/Runnable;)V

    .line 91
    :cond_2
    sget-object v0, Lcom/vk/media/camera/CameraRender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "init profile: display="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/camera/CameraRender;->mDisplayWidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/camera/CameraRender;->mDisplayHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", view="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/camera/CameraRender;->mViewWidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/camera/CameraRender;->mViewHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " portrait="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/vk/media/camera/CameraRender;->mPortrait:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    return-void

    .line 75
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onDraw()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 158
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    if-nez v0, :cond_0

    .line 166
    :goto_0
    return-void

    .line 162
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v1, v1, v1, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 163
    const/16 v0, 0x4100

    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 164
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mSTMatrix:[F

    invoke-virtual {v0, v1}, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->update([F)V

    .line 165
    invoke-direct {p0}, Lcom/vk/media/camera/CameraRender;->draw()V

    goto :goto_0
.end method

.method protected onSurfaceChanged(II)V
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 126
    sget-object v0, Lcom/vk/media/camera/CameraRender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onSurfaceChanged: display="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/camera/CameraRender;->mDisplayWidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/camera/CameraRender;->mDisplayHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", view="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/camera/CameraRender;->mViewWidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vk/media/camera/CameraRender;->mViewHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    return-void
.end method

.method protected onSurfaceCreated(Landroid/view/Surface;)V
    .locals 3
    .param p1, "surface"    # Landroid/view/Surface;

    .prologue
    .line 115
    sget-object v0, Lcom/vk/media/camera/CameraRender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onSurfaceCreated: surface="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    invoke-super {p0, p1}, Lcom/vk/media/utils/RenderBase;->onSurfaceCreated(Landroid/view/Surface;)V

    .line 118
    :try_start_0
    new-instance v0, Lcom/vk/media/camera/CameraRender$RenderDrawableExt;

    invoke-direct {v0, p0}, Lcom/vk/media/camera/CameraRender$RenderDrawableExt;-><init>(Lcom/vk/media/camera/CameraRender;)V

    iput-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrameExt:Lcom/vk/media/camera/CameraRender$RenderDrawableExt;

    .line 119
    new-instance v0, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

    invoke-direct {v0, p0}, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;-><init>(Lcom/vk/media/camera/CameraRender;)V

    iput-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrame2D:Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

    .line 120
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    iget-object v1, p0, Lcom/vk/media/camera/CameraRender;->mFrameExt:Lcom/vk/media/camera/CameraRender$RenderDrawableExt;

    invoke-virtual {v1}, Lcom/vk/media/camera/CameraRender$RenderDrawableExt;->createTextureObject()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->create(I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    :goto_0
    return-void

    .line 121
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected onSurfaceDestroyed()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 131
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrameExt:Lcom/vk/media/camera/CameraRender$RenderDrawableExt;

    if-eqz v0, :cond_0

    .line 132
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrameExt:Lcom/vk/media/camera/CameraRender$RenderDrawableExt;

    invoke-virtual {v0, v2}, Lcom/vk/media/camera/CameraRender$RenderDrawableExt;->release(Z)V

    .line 133
    iput-object v1, p0, Lcom/vk/media/camera/CameraRender;->mFrameExt:Lcom/vk/media/camera/CameraRender$RenderDrawableExt;

    .line 135
    :cond_0
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrame2D:Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

    if-eqz v0, :cond_1

    .line 136
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrame2D:Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

    invoke-virtual {v0, v2}, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->release(Z)V

    .line 137
    iput-object v1, p0, Lcom/vk/media/camera/CameraRender;->mFrame2D:Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

    .line 139
    :cond_1
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mDisplaySurface:Lcom/vk/media/utils/grafika/WindowSurface;

    if-eqz v0, :cond_2

    .line 140
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mDisplaySurface:Lcom/vk/media/utils/grafika/WindowSurface;

    invoke-virtual {v0}, Lcom/vk/media/utils/grafika/WindowSurface;->release()V

    .line 141
    iput-object v1, p0, Lcom/vk/media/camera/CameraRender;->mDisplaySurface:Lcom/vk/media/utils/grafika/WindowSurface;

    .line 143
    :cond_2
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    if-eqz v0, :cond_3

    .line 144
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    invoke-virtual {v0}, Lcom/vk/media/utils/grafika/EglCore;->release()V

    .line 145
    iput-object v1, p0, Lcom/vk/media/camera/CameraRender;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    .line 147
    :cond_3
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    if-eqz v0, :cond_4

    .line 148
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    invoke-virtual {v0}, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->release()V

    .line 150
    :cond_4
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    if-eqz v0, :cond_5

    .line 151
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraRecorder;->release()V

    .line 153
    :cond_5
    sget-object v0, Lcom/vk/media/camera/CameraRender;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onSurfaceDestroyed"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    return-void
.end method

.method protected setFrameReader(Lcom/vk/media/camera/CameraUtils$FrameReader;ZZ)Z
    .locals 3
    .param p1, "reader"    # Lcom/vk/media/camera/CameraUtils$FrameReader;
    .param p2, "delayRendering"    # Z
    .param p3, "backCamera"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 97
    if-eqz p1, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vk/media/camera/CameraRender;->enableFrameReader(Z)V

    .line 98
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrame2D:Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

    if-eqz v0, :cond_1

    .line 99
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender;->mFrame2D:Lcom/vk/media/camera/CameraRender$RenderDrawable2D;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vk/media/camera/CameraRender$RenderDrawable2D;->setReader(Lcom/vk/media/camera/CameraUtils$FrameReader;ZZ)V

    .line 102
    :goto_1
    return v1

    :cond_0
    move v0, v2

    .line 97
    goto :goto_0

    :cond_1
    move v1, v2

    .line 102
    goto :goto_1
.end method
