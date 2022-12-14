.class Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;
.super Ljava/lang/Object;
.source "GLTextureView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/imageeditor/GLTextureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GLThreadManager"
.end annotation


# static fields
.field private static TAG:Ljava/lang/String; = null

.field private static final kGLES_20:I = 0x20000

.field private static final kMSM7K_RENDERER_PREFIX:Ljava/lang/String; = "Q3Dimension MSM7500 "


# instance fields
.field private mEglOwner:Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;

.field private mGLESDriverCheckComplete:Z

.field private mGLESVersion:I

.field private mGLESVersionCheckComplete:Z

.field private mLimitedGLESContexts:Z

.field private mMultipleGLESContextsAllowed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1616
    const-string/jumbo v0, "GLThreadManager"

    sput-object v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 1615
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/attachpicker/imageeditor/GLTextureView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/attachpicker/imageeditor/GLTextureView$1;

    .prologue
    .line 1615
    invoke-direct {p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;-><init>()V

    return-void
.end method

.method private checkGLESVersion()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 1699
    iget-boolean v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mGLESVersionCheckComplete:Z

    if-nez v0, :cond_0

    .line 1704
    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    .line 1710
    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mGLESVersionCheckComplete:Z

    .line 1712
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized checkGLDriver(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 5
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1680
    monitor-enter p0

    :try_start_0
    iget-boolean v3, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mGLESDriverCheckComplete:Z

    if-nez v3, :cond_1

    .line 1681
    invoke-direct {p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->checkGLESVersion()V

    .line 1682
    const/16 v3, 0x1f01

    invoke-interface {p1, v3}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    move-result-object v0

    .line 1683
    .local v0, "renderer":Ljava/lang/String;
    iget v3, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mGLESVersion:I

    const/high16 v4, 0x20000

    if-ge v3, v4, :cond_0

    .line 1684
    const-string/jumbo v3, "Q3Dimension MSM7500 "

    .line 1685
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    move v3, v1

    :goto_0
    iput-boolean v3, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    .line 1686
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 1688
    :cond_0
    iget-boolean v3, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    if-nez v3, :cond_3

    :goto_1
    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mLimitedGLESContexts:Z

    .line 1694
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mGLESDriverCheckComplete:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1696
    .end local v0    # "renderer":Ljava/lang/String;
    :cond_1
    monitor-exit p0

    return-void

    .restart local v0    # "renderer":Ljava/lang/String;
    :cond_2
    move v3, v2

    .line 1685
    goto :goto_0

    :cond_3
    move v1, v2

    .line 1688
    goto :goto_1

    .line 1680
    .end local v0    # "renderer":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public releaseEglContextLocked(Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;)V
    .locals 1
    .param p1, "thread"    # Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;

    .prologue
    .line 1661
    iget-object v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mEglOwner:Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;

    if-ne v0, p1, :cond_0

    .line 1662
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mEglOwner:Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;

    .line 1664
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 1665
    return-void
.end method

.method public declared-synchronized shouldReleaseEGLContextWhenPausing()Z
    .locals 1

    .prologue
    .line 1671
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mLimitedGLESContexts:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized shouldTerminateEGLWhenPausing()Z
    .locals 1

    .prologue
    .line 1675
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->checkGLESVersion()V

    .line 1676
    iget-boolean v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mMultipleGLESContextsAllowed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 1675
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized threadExiting(Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;)V
    .locals 1
    .param p1, "thread"    # Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;

    .prologue
    .line 1622
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    invoke-static {p1, v0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->access$1102(Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;Z)Z

    .line 1623
    iget-object v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mEglOwner:Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;

    if-ne v0, p1, :cond_0

    .line 1624
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mEglOwner:Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;

    .line 1626
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1627
    monitor-exit p0

    return-void

    .line 1622
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public tryAcquireEglContextLocked(Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;)Z
    .locals 2
    .param p1, "thread"    # Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;

    .prologue
    const/4 v0, 0x1

    .line 1637
    iget-object v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mEglOwner:Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;

    if-eq v1, p1, :cond_0

    iget-object v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mEglOwner:Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;

    if-nez v1, :cond_2

    .line 1638
    :cond_0
    iput-object p1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mEglOwner:Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;

    .line 1639
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 1653
    :cond_1
    :goto_0
    return v0

    .line 1642
    :cond_2
    invoke-direct {p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->checkGLESVersion()V

    .line 1643
    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    if-nez v1, :cond_1

    .line 1650
    iget-object v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mEglOwner:Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;

    if-eqz v0, :cond_3

    .line 1651
    iget-object v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->mEglOwner:Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;

    invoke-virtual {v0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->requestReleaseEglContextLocked()V

    .line 1653
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method
