.class public abstract Lcom/vkontakte/android/media/TextureVideoPlayer;
.super Lcom/vkontakte/android/media/AbsVideoPlayer;
.source "TextureVideoPlayer.java"

# interfaces
.implements Lcom/vkontakte/android/ui/widget/VideoTextureView$OnVideoTextureCallback;
.implements Landroid/view/TextureView$SurfaceTextureListener;


# static fields
.field static final TAG:Ljava/lang/String;


# instance fields
.field private mHasDetachedFromPlayer:Z

.field private mHasDetachedFromWindow:Z

.field private final mLock:Ljava/lang/Object;

.field private mOwnSurfaceTexture:Z

.field public mSurfaceTexture:Landroid/graphics/SurfaceTexture;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lcom/vkontakte/android/media/TextureVideoPlayer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/media/TextureVideoPlayer;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "videoFile"    # Lcom/vkontakte/android/api/VideoFile;
    .param p3, "referrer"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 25
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/media/AbsVideoPlayer;-><init>(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)V

    .line 17
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mLock:Ljava/lang/Object;

    .line 20
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mOwnSurfaceTexture:Z

    .line 21
    iput-boolean v1, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mHasDetachedFromWindow:Z

    .line 22
    iput-boolean v1, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mHasDetachedFromPlayer:Z

    .line 26
    return-void
.end method


# virtual methods
.method public onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 95
    iget-object v1, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 96
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mHasDetachedFromWindow:Z

    .line 97
    monitor-exit v1

    .line 98
    return-void

    .line 97
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 0
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 68
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 2
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 72
    iget-object v1, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 73
    :try_start_0
    iget-boolean v0, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mHasDetachedFromPlayer:Z

    if-eqz v0, :cond_0

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mOwnSurfaceTexture:Z

    .line 76
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mOwnSurfaceTexture:Z

    if-nez v0, :cond_1

    .line 79
    iput-object p1, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 81
    :cond_1
    iget-boolean v0, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mOwnSurfaceTexture:Z

    monitor-exit v1

    return v0

    .line 82
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 87
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 91
    return-void
.end method

.method public final setView(Lcom/vkontakte/android/ui/widget/VideoTextureView;)V
    .locals 3
    .param p1, "view"    # Lcom/vkontakte/android/ui/widget/VideoTextureView;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 41
    iget-object v1, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->renderView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    if-ne p1, v1, :cond_0

    .line 64
    :goto_0
    return-void

    .line 43
    :cond_0
    if-eqz p1, :cond_2

    .line 44
    invoke-virtual {p1, p0}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->setCallback(Lcom/vkontakte/android/ui/widget/VideoTextureView$OnVideoTextureCallback;)V

    .line 45
    invoke-virtual {p1, p0}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 46
    iget-object v2, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 47
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mOwnSurfaceTexture:Z

    .line 48
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    .line 51
    .local v0, "texture":Landroid/graphics/SurfaceTexture;
    if-eqz v0, :cond_1

    .line 52
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getHeight()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/vkontakte/android/media/TextureVideoPlayer;->onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V

    .line 63
    .end local v0    # "texture":Landroid/graphics/SurfaceTexture;
    :cond_1
    :goto_1
    invoke-super {p0, p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->setView(Lcom/vkontakte/android/ui/widget/VideoTextureView;)V

    goto :goto_0

    .line 48
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 55
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->renderView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    if-eqz v1, :cond_1

    .line 56
    iget-object v1, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->renderView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    .line 57
    .restart local v0    # "texture":Landroid/graphics/SurfaceTexture;
    iget-object v1, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->renderView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 58
    if-eqz v0, :cond_1

    .line 59
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/media/TextureVideoPlayer;->onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z

    goto :goto_1
.end method

.method public stopAndRelease()V
    .locals 2

    .prologue
    .line 30
    iget-object v1, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 31
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mHasDetachedFromPlayer:Z

    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mHasDetachedFromWindow:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mOwnSurfaceTexture:Z

    if-nez v0, :cond_0

    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/media/TextureVideoPlayer;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 36
    :cond_0
    monitor-exit v1

    .line 37
    return-void

    .line 36
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
