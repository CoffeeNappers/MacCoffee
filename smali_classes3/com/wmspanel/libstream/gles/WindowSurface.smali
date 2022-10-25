.class public Lcom/wmspanel/libstream/gles/WindowSurface;
.super Lcom/wmspanel/libstream/gles/EglSurfaceBase;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation


# instance fields
.field private mReleaseSurface:Z

.field private mSurface:Landroid/view/Surface;


# direct methods
.method public constructor <init>(Lcom/wmspanel/libstream/gles/EglCore;Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .param p1, "eglCore"    # Lcom/wmspanel/libstream/gles/EglCore;
    .param p2, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/wmspanel/libstream/gles/EglSurfaceBase;-><init>(Lcom/wmspanel/libstream/gles/EglCore;)V

    .line 54
    invoke-virtual {p0, p2}, Lcom/wmspanel/libstream/gles/WindowSurface;->createWindowSurface(Ljava/lang/Object;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Lcom/wmspanel/libstream/gles/EglCore;Landroid/view/Surface;Z)V
    .locals 0
    .param p1, "eglCore"    # Lcom/wmspanel/libstream/gles/EglCore;
    .param p2, "surface"    # Landroid/view/Surface;
    .param p3, "releaseSurface"    # Z

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/wmspanel/libstream/gles/EglSurfaceBase;-><init>(Lcom/wmspanel/libstream/gles/EglCore;)V

    .line 44
    invoke-virtual {p0, p2}, Lcom/wmspanel/libstream/gles/WindowSurface;->createWindowSurface(Ljava/lang/Object;)V

    .line 45
    iput-object p2, p0, Lcom/wmspanel/libstream/gles/WindowSurface;->mSurface:Landroid/view/Surface;

    .line 46
    iput-boolean p3, p0, Lcom/wmspanel/libstream/gles/WindowSurface;->mReleaseSurface:Z

    .line 47
    return-void
.end method


# virtual methods
.method public recreate(Lcom/wmspanel/libstream/gles/EglCore;)V
    .locals 2
    .param p1, "newEglCore"    # Lcom/wmspanel/libstream/gles/EglCore;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/WindowSurface;->mSurface:Landroid/view/Surface;

    if-nez v0, :cond_0

    .line 88
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "not yet implemented for SurfaceTexture"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_0
    iput-object p1, p0, Lcom/wmspanel/libstream/gles/WindowSurface;->mEglCore:Lcom/wmspanel/libstream/gles/EglCore;

    .line 91
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/WindowSurface;->mSurface:Landroid/view/Surface;

    invoke-virtual {p0, v0}, Lcom/wmspanel/libstream/gles/WindowSurface;->createWindowSurface(Ljava/lang/Object;)V

    .line 92
    return-void
.end method

.method public release()V
    .locals 1

    .prologue
    .line 64
    invoke-virtual {p0}, Lcom/wmspanel/libstream/gles/WindowSurface;->releaseEglSurface()V

    .line 65
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/WindowSurface;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_1

    .line 66
    iget-boolean v0, p0, Lcom/wmspanel/libstream/gles/WindowSurface;->mReleaseSurface:Z

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/WindowSurface;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 69
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/WindowSurface;->mSurface:Landroid/view/Surface;

    .line 71
    :cond_1
    return-void
.end method
