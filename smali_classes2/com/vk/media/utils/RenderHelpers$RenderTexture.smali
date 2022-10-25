.class public Lcom/vk/media/utils/RenderHelpers$RenderTexture;
.super Ljava/lang/Object;
.source "RenderHelpers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/utils/RenderHelpers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RenderTexture"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "RenderTexture"


# instance fields
.field private mRenderer:Lcom/vk/media/utils/RenderHelpers$Renderer;

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private mTextureId:I

.field private mUpdateSurface:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 190
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mUpdateSurface:Z

    return-void
.end method

.method static synthetic access$402(Lcom/vk/media/utils/RenderHelpers$RenderTexture;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/media/utils/RenderHelpers$RenderTexture;
    .param p1, "x1"    # Z

    .prologue
    .line 186
    iput-boolean p1, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mUpdateSurface:Z

    return p1
.end method

.method static synthetic access$500(Lcom/vk/media/utils/RenderHelpers$RenderTexture;)Lcom/vk/media/utils/RenderHelpers$Renderer;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    .prologue
    .line 186
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mRenderer:Lcom/vk/media/utils/RenderHelpers$Renderer;

    return-object v0
.end method


# virtual methods
.method public create(I)V
    .locals 3
    .param p1, "textureId"    # I

    .prologue
    .line 199
    const-string/jumbo v0, "RenderTexture"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "create "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    iput p1, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mTextureId:I

    .line 201
    new-instance v0, Landroid/graphics/SurfaceTexture;

    invoke-direct {v0, p1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    iput-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 202
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    new-instance v1, Lcom/vk/media/utils/RenderHelpers$RenderTexture$1;

    invoke-direct {v1, p0}, Lcom/vk/media/utils/RenderHelpers$RenderTexture$1;-><init>(Lcom/vk/media/utils/RenderHelpers$RenderTexture;)V

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 213
    return-void
.end method

.method public getTextureId()I
    .locals 1

    .prologue
    .line 228
    iget v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mTextureId:I

    return v0
.end method

.method public getTimestamp()J
    .locals 2

    .prologue
    .line 232
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public release()V
    .locals 2

    .prologue
    .line 236
    monitor-enter p0

    .line 237
    :try_start_0
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_0

    .line 238
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 239
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 241
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mUpdateSurface:Z

    .line 242
    const-string/jumbo v0, "RenderTexture"

    const-string/jumbo v1, "texture released!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    monitor-exit p0

    .line 244
    return-void

    .line 243
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setRenderer(Lcom/vk/media/utils/RenderHelpers$Renderer;)V
    .locals 0
    .param p1, "renderer"    # Lcom/vk/media/utils/RenderHelpers$Renderer;

    .prologue
    .line 195
    iput-object p1, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mRenderer:Lcom/vk/media/utils/RenderHelpers$Renderer;

    .line 196
    return-void
.end method

.method public texture()Landroid/graphics/SurfaceTexture;
    .locals 2

    .prologue
    .line 247
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-nez v0, :cond_0

    .line 248
    const-string/jumbo v0, "RenderTexture"

    const-string/jumbo v1, "Warning! request empty texture!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :cond_0
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object v0
.end method

.method public update([F)V
    .locals 1
    .param p1, "transformMatrix"    # [F

    .prologue
    .line 216
    monitor-enter p0

    .line 217
    :try_start_0
    iget-boolean v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mUpdateSurface:Z

    if-eqz v0, :cond_1

    .line 218
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 219
    if-eqz p1, :cond_0

    .line 220
    iget-object v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, p1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 222
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->mUpdateSurface:Z

    .line 224
    :cond_1
    monitor-exit p0

    .line 225
    return-void

    .line 224
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
