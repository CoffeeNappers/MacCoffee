.class public Lcom/vk/media/utils/grafika/WindowSurface;
.super Lcom/vk/media/utils/grafika/EglSurfaceBase;
.source "WindowSurface.java"


# instance fields
.field private mReleaseSurface:Z

.field private mSurface:Landroid/view/Surface;


# direct methods
.method public constructor <init>(Lcom/vk/media/utils/grafika/EglCore;Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .param p1, "eglCore"    # Lcom/vk/media/utils/grafika/EglCore;
    .param p2, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/vk/media/utils/grafika/EglSurfaceBase;-><init>(Lcom/vk/media/utils/grafika/EglCore;)V

    .line 51
    invoke-virtual {p0, p2}, Lcom/vk/media/utils/grafika/WindowSurface;->createWindowSurface(Ljava/lang/Object;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Lcom/vk/media/utils/grafika/EglCore;Landroid/view/Surface;Z)V
    .locals 0
    .param p1, "eglCore"    # Lcom/vk/media/utils/grafika/EglCore;
    .param p2, "surface"    # Landroid/view/Surface;
    .param p3, "releaseSurface"    # Z

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/vk/media/utils/grafika/EglSurfaceBase;-><init>(Lcom/vk/media/utils/grafika/EglCore;)V

    .line 41
    invoke-virtual {p0, p2}, Lcom/vk/media/utils/grafika/WindowSurface;->createWindowSurface(Ljava/lang/Object;)V

    .line 42
    iput-object p2, p0, Lcom/vk/media/utils/grafika/WindowSurface;->mSurface:Landroid/view/Surface;

    .line 43
    iput-boolean p3, p0, Lcom/vk/media/utils/grafika/WindowSurface;->mReleaseSurface:Z

    .line 44
    return-void
.end method


# virtual methods
.method public recreate(Lcom/vk/media/utils/grafika/EglCore;)V
    .locals 2
    .param p1, "newEglCore"    # Lcom/vk/media/utils/grafika/EglCore;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/vk/media/utils/grafika/WindowSurface;->mSurface:Landroid/view/Surface;

    if-nez v0, :cond_0

    .line 85
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "not yet implemented for SurfaceTexture"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_0
    iput-object p1, p0, Lcom/vk/media/utils/grafika/WindowSurface;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    .line 88
    iget-object v0, p0, Lcom/vk/media/utils/grafika/WindowSurface;->mSurface:Landroid/view/Surface;

    invoke-virtual {p0, v0}, Lcom/vk/media/utils/grafika/WindowSurface;->createWindowSurface(Ljava/lang/Object;)V

    .line 89
    return-void
.end method

.method public release()V
    .locals 1

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/vk/media/utils/grafika/WindowSurface;->releaseEglSurface()V

    .line 62
    iget-object v0, p0, Lcom/vk/media/utils/grafika/WindowSurface;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_1

    .line 63
    iget-boolean v0, p0, Lcom/vk/media/utils/grafika/WindowSurface;->mReleaseSurface:Z

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/vk/media/utils/grafika/WindowSurface;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 66
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/media/utils/grafika/WindowSurface;->mSurface:Landroid/view/Surface;

    .line 68
    :cond_1
    return-void
.end method
