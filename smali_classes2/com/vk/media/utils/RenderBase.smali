.class public Lcom/vk/media/utils/RenderBase;
.super Ljava/lang/Object;
.source "RenderBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/media/utils/RenderBase$CustomRenderer;,
        Lcom/vk/media/utils/RenderBase$GLRenderer;
    }
.end annotation


# instance fields
.field private mChanged:Ljava/lang/Runnable;

.field protected mContext:Landroid/content/Context;

.field private mCreated:Ljava/lang/Runnable;

.field private mDestroyed:Ljava/lang/Runnable;

.field protected mDisplayHeight:I

.field protected mDisplaySurface:Lcom/vk/media/utils/grafika/WindowSurface;

.field protected mDisplayWidth:I

.field protected mEglCore:Lcom/vk/media/utils/grafika/EglCore;

.field private mListener:Landroid/view/TextureView$SurfaceTextureListener;

.field private mRenderer:Lcom/vk/media/utils/RenderHelpers$Renderer;

.field protected mSTMatrix:[F

.field protected mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

.field private mView:Landroid/view/View;

.field protected mViewHeight:I

.field protected mViewWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/TextureView$SurfaceTextureListener;Landroid/view/SurfaceView;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Landroid/view/TextureView$SurfaceTextureListener;
    .param p3, "view"    # Landroid/view/SurfaceView;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v1, Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    invoke-direct {v1}, Lcom/vk/media/utils/RenderHelpers$RenderTexture;-><init>()V

    iput-object v1, p0, Lcom/vk/media/utils/RenderBase;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    .line 22
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vk/media/utils/RenderBase;->mContext:Landroid/content/Context;

    .line 26
    const/16 v1, 0x10

    new-array v1, v1, [F

    iput-object v1, p0, Lcom/vk/media/utils/RenderBase;->mSTMatrix:[F

    .line 37
    new-instance v1, Lcom/vk/media/utils/RenderBase$1;

    invoke-direct {v1, p0}, Lcom/vk/media/utils/RenderBase$1;-><init>(Lcom/vk/media/utils/RenderBase;)V

    iput-object v1, p0, Lcom/vk/media/utils/RenderBase;->mCreated:Ljava/lang/Runnable;

    .line 46
    new-instance v1, Lcom/vk/media/utils/RenderBase$2;

    invoke-direct {v1, p0}, Lcom/vk/media/utils/RenderBase$2;-><init>(Lcom/vk/media/utils/RenderBase;)V

    iput-object v1, p0, Lcom/vk/media/utils/RenderBase;->mChanged:Ljava/lang/Runnable;

    .line 55
    new-instance v1, Lcom/vk/media/utils/RenderBase$3;

    invoke-direct {v1, p0}, Lcom/vk/media/utils/RenderBase$3;-><init>(Lcom/vk/media/utils/RenderBase;)V

    iput-object v1, p0, Lcom/vk/media/utils/RenderBase;->mDestroyed:Ljava/lang/Runnable;

    .line 65
    iput-object p1, p0, Lcom/vk/media/utils/RenderBase;->mContext:Landroid/content/Context;

    .line 66
    iput-object p2, p0, Lcom/vk/media/utils/RenderBase;->mListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 68
    if-nez p3, :cond_0

    .line 69
    new-instance v0, Lcom/vk/media/utils/RenderBase$GLRenderer;

    invoke-direct {v0, p0, p1}, Lcom/vk/media/utils/RenderBase$GLRenderer;-><init>(Lcom/vk/media/utils/RenderBase;Landroid/content/Context;)V

    .line 70
    .local v0, "r":Lcom/vk/media/utils/RenderBase$GLRenderer;
    iput-object v0, p0, Lcom/vk/media/utils/RenderBase;->mRenderer:Lcom/vk/media/utils/RenderHelpers$Renderer;

    .line 71
    invoke-virtual {v0}, Lcom/vk/media/utils/RenderBase$GLRenderer;->getView()Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/media/utils/RenderBase;->mView:Landroid/view/View;

    .line 76
    .end local v0    # "r":Lcom/vk/media/utils/RenderBase$GLRenderer;
    :goto_0
    iget-object v1, p0, Lcom/vk/media/utils/RenderBase;->mTexture:Lcom/vk/media/utils/RenderHelpers$RenderTexture;

    iget-object v2, p0, Lcom/vk/media/utils/RenderBase;->mRenderer:Lcom/vk/media/utils/RenderHelpers$Renderer;

    invoke-virtual {v1, v2}, Lcom/vk/media/utils/RenderHelpers$RenderTexture;->setRenderer(Lcom/vk/media/utils/RenderHelpers$Renderer;)V

    .line 77
    iget-object v1, p0, Lcom/vk/media/utils/RenderBase;->mSTMatrix:[F

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 78
    return-void

    .line 73
    :cond_0
    new-instance v1, Lcom/vk/media/utils/RenderBase$CustomRenderer;

    invoke-direct {v1, p0, p3}, Lcom/vk/media/utils/RenderBase$CustomRenderer;-><init>(Lcom/vk/media/utils/RenderBase;Landroid/view/SurfaceView;)V

    iput-object v1, p0, Lcom/vk/media/utils/RenderBase;->mRenderer:Lcom/vk/media/utils/RenderHelpers$Renderer;

    .line 74
    iput-object p3, p0, Lcom/vk/media/utils/RenderBase;->mView:Landroid/view/View;

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/vk/media/utils/RenderBase;)Landroid/view/TextureView$SurfaceTextureListener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/utils/RenderBase;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase;->mListener:Landroid/view/TextureView$SurfaceTextureListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/media/utils/RenderBase;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/utils/RenderBase;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase;->mCreated:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vk/media/utils/RenderBase;Ljava/lang/Runnable;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/media/utils/RenderBase;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/vk/media/utils/RenderBase;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vk/media/utils/RenderBase;II)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/media/utils/RenderBase;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Lcom/vk/media/utils/RenderBase;->updateDisplaySize(II)V

    return-void
.end method

.method static synthetic access$400(Lcom/vk/media/utils/RenderBase;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/utils/RenderBase;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase;->mChanged:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/media/utils/RenderBase;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/utils/RenderBase;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase;->mDestroyed:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vk/media/utils/RenderBase;)Lcom/vk/media/utils/RenderHelpers$Renderer;
    .locals 1
    .param p0, "x0"    # Lcom/vk/media/utils/RenderBase;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase;->mRenderer:Lcom/vk/media/utils/RenderHelpers$Renderer;

    return-object v0
.end method

.method private runOnUiThread(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 114
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase;->mView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase;->mView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 117
    :cond_0
    return-void
.end method

.method private updateDisplaySize(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 120
    iput p1, p0, Lcom/vk/media/utils/RenderBase;->mDisplayWidth:I

    .line 121
    iput p2, p0, Lcom/vk/media/utils/RenderBase;->mDisplayHeight:I

    .line 122
    return-void
.end method


# virtual methods
.method public getView()Landroid/view/View;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase;->mView:Landroid/view/View;

    return-object v0
.end method

.method protected onDraw()V
    .locals 0

    .prologue
    .line 94
    return-void
.end method

.method protected onSurfaceChanged(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 108
    return-void
.end method

.method protected onSurfaceCreated(Landroid/view/Surface;)V
    .locals 4
    .param p1, "surface"    # Landroid/view/Surface;

    .prologue
    const/4 v3, 0x0

    .line 97
    new-instance v0, Lcom/vk/media/utils/grafika/EglCore;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/vk/media/utils/grafika/EglCore;-><init>(Landroid/opengl/EGLContext;I)V

    iput-object v0, p0, Lcom/vk/media/utils/RenderBase;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    .line 98
    if-eqz p1, :cond_0

    .line 99
    invoke-virtual {p1}, Landroid/view/Surface;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    new-instance v0, Lcom/vk/media/utils/grafika/WindowSurface;

    iget-object v1, p0, Lcom/vk/media/utils/RenderBase;->mEglCore:Lcom/vk/media/utils/grafika/EglCore;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, v2}, Lcom/vk/media/utils/grafika/WindowSurface;-><init>(Lcom/vk/media/utils/grafika/EglCore;Landroid/view/Surface;Z)V

    iput-object v0, p0, Lcom/vk/media/utils/RenderBase;->mDisplaySurface:Lcom/vk/media/utils/grafika/WindowSurface;

    .line 101
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase;->mDisplaySurface:Lcom/vk/media/utils/grafika/WindowSurface;

    invoke-virtual {v0}, Lcom/vk/media/utils/grafika/WindowSurface;->makeCurrent()V

    .line 104
    :cond_0
    invoke-static {v3, v3, v3, v3}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 105
    return-void
.end method

.method protected onSurfaceDestroyed()V
    .locals 0

    .prologue
    .line 111
    return-void
.end method

.method protected queueEvent(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/vk/media/utils/RenderBase;->mRenderer:Lcom/vk/media/utils/RenderHelpers$Renderer;

    invoke-interface {v0, p1}, Lcom/vk/media/utils/RenderHelpers$Renderer;->queueEvent(Ljava/lang/Runnable;)V

    .line 91
    return-void
.end method

.method protected setViewSize(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 85
    iput p1, p0, Lcom/vk/media/utils/RenderBase;->mViewWidth:I

    .line 86
    iput p2, p0, Lcom/vk/media/utils/RenderBase;->mViewHeight:I

    .line 87
    return-void
.end method
