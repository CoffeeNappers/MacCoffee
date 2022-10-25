.class public Lcom/wmspanel/libstream/gles/FullFrameRect;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation


# instance fields
.field protected mProgram:Lcom/wmspanel/libstream/gles/Texture2dProgram;

.field protected final mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;


# direct methods
.method public constructor <init>(Lcom/wmspanel/libstream/gles/Texture2dProgram;)V
    .locals 2
    .param p1, "program"    # Lcom/wmspanel/libstream/gles/Texture2dProgram;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Lcom/wmspanel/libstream/gles/Drawable2d;

    sget-object v1, Lcom/wmspanel/libstream/gles/Drawable2d$Prefab;->FULL_RECTANGLE:Lcom/wmspanel/libstream/gles/Drawable2d$Prefab;

    invoke-direct {v0, v1}, Lcom/wmspanel/libstream/gles/Drawable2d;-><init>(Lcom/wmspanel/libstream/gles/Drawable2d$Prefab;)V

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;

    .line 39
    iput-object p1, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mProgram:Lcom/wmspanel/libstream/gles/Texture2dProgram;

    .line 40
    return-void
.end method


# virtual methods
.method public changeProgram(Lcom/wmspanel/libstream/gles/Texture2dProgram;)V
    .locals 1
    .param p1, "program"    # Lcom/wmspanel/libstream/gles/Texture2dProgram;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mProgram:Lcom/wmspanel/libstream/gles/Texture2dProgram;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/Texture2dProgram;->release()V

    .line 73
    iput-object p1, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mProgram:Lcom/wmspanel/libstream/gles/Texture2dProgram;

    .line 74
    return-void
.end method

.method public createTextureObject()I
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mProgram:Lcom/wmspanel/libstream/gles/Texture2dProgram;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/Texture2dProgram;->createTextureObject()I

    move-result v0

    return v0
.end method

.method public drawFrame(I[F)V
    .locals 11
    .param p1, "textureId"    # I
    .param p2, "texMatrix"    # [F

    .prologue
    .line 88
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mProgram:Lcom/wmspanel/libstream/gles/Texture2dProgram;

    sget-object v1, Lcom/wmspanel/libstream/gles/GlUtil;->IDENTITY_MATRIX:[F

    iget-object v2, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;

    invoke-virtual {v2}, Lcom/wmspanel/libstream/gles/Drawable2d;->getVertexArray()Ljava/nio/FloatBuffer;

    move-result-object v2

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;

    .line 89
    invoke-virtual {v4}, Lcom/wmspanel/libstream/gles/Drawable2d;->getVertexCount()I

    move-result v4

    iget-object v5, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;

    invoke-virtual {v5}, Lcom/wmspanel/libstream/gles/Drawable2d;->getCoordsPerVertex()I

    move-result v5

    iget-object v6, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;

    .line 90
    invoke-virtual {v6}, Lcom/wmspanel/libstream/gles/Drawable2d;->getVertexStride()I

    move-result v6

    iget-object v7, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;

    .line 91
    invoke-virtual {v7}, Lcom/wmspanel/libstream/gles/Drawable2d;->getTexCoordArray()Ljava/nio/FloatBuffer;

    move-result-object v8

    iget-object v7, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;

    .line 92
    invoke-virtual {v7}, Lcom/wmspanel/libstream/gles/Drawable2d;->getTexCoordStride()I

    move-result v10

    move-object v7, p2

    move v9, p1

    .line 88
    invoke-virtual/range {v0 .. v10}, Lcom/wmspanel/libstream/gles/Texture2dProgram;->draw([FLjava/nio/FloatBuffer;IIII[FLjava/nio/FloatBuffer;II)V

    .line 93
    return-void
.end method

.method public getProgram()Lcom/wmspanel/libstream/gles/Texture2dProgram;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mProgram:Lcom/wmspanel/libstream/gles/Texture2dProgram;

    return-object v0
.end method

.method public release(Z)V
    .locals 1
    .param p1, "doEglCleanup"    # Z

    .prologue
    .line 51
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mProgram:Lcom/wmspanel/libstream/gles/Texture2dProgram;

    if-eqz v0, :cond_1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mProgram:Lcom/wmspanel/libstream/gles/Texture2dProgram;

    invoke-virtual {v0}, Lcom/wmspanel/libstream/gles/Texture2dProgram;->release()V

    .line 55
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/FullFrameRect;->mProgram:Lcom/wmspanel/libstream/gles/Texture2dProgram;

    .line 57
    :cond_1
    return-void
.end method
