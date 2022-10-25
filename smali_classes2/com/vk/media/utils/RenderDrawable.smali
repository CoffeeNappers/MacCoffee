.class public Lcom/vk/media/utils/RenderDrawable;
.super Ljava/lang/Object;
.source "RenderDrawable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/media/utils/RenderDrawable$Drawable2d;,
        Lcom/vk/media/utils/RenderDrawable$Flip;,
        Lcom/vk/media/utils/RenderDrawable$Rotation;
    }
.end annotation


# instance fields
.field private mProgram:Lcom/vk/media/utils/grafika/Texture2dProgram;

.field private mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;


# direct methods
.method public constructor <init>(Lcom/vk/media/utils/grafika/Texture2dProgram;)V
    .locals 2
    .param p1, "program"    # Lcom/vk/media/utils/grafika/Texture2dProgram;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    invoke-virtual {p1}, Lcom/vk/media/utils/grafika/Texture2dProgram;->getProgramType()Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;-><init>(Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;)V

    iput-object v0, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    .line 33
    iput-object p1, p0, Lcom/vk/media/utils/RenderDrawable;->mProgram:Lcom/vk/media/utils/grafika/Texture2dProgram;

    .line 34
    return-void
.end method


# virtual methods
.method public changeProgram(Lcom/vk/media/utils/grafika/Texture2dProgram;)V
    .locals 1
    .param p1, "program"    # Lcom/vk/media/utils/grafika/Texture2dProgram;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/vk/media/utils/RenderDrawable;->mProgram:Lcom/vk/media/utils/grafika/Texture2dProgram;

    invoke-virtual {v0}, Lcom/vk/media/utils/grafika/Texture2dProgram;->release()V

    .line 55
    iput-object p1, p0, Lcom/vk/media/utils/RenderDrawable;->mProgram:Lcom/vk/media/utils/grafika/Texture2dProgram;

    .line 56
    return-void
.end method

.method public createTextureObject()I
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/vk/media/utils/RenderDrawable;->mProgram:Lcom/vk/media/utils/grafika/Texture2dProgram;

    invoke-virtual {v0}, Lcom/vk/media/utils/grafika/Texture2dProgram;->createTextureObject()I

    move-result v0

    return v0
.end method

.method public drawFrame(I[FLcom/vk/media/utils/RenderDrawable$Flip;)V
    .locals 11
    .param p1, "textureId"    # I
    .param p2, "texMatrix"    # [F
    .param p3, "flip"    # Lcom/vk/media/utils/RenderDrawable$Flip;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/vk/media/utils/RenderDrawable;->mProgram:Lcom/vk/media/utils/grafika/Texture2dProgram;

    sget-object v1, Lcom/vk/media/utils/grafika/GlUtil;->IDENTITY_MATRIX:[F

    iget-object v2, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    invoke-virtual {v2}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getVertexArray()Ljava/nio/FloatBuffer;

    move-result-object v2

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    .line 65
    invoke-virtual {v4}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getVertexCount()I

    move-result v4

    iget-object v5, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    invoke-virtual {v5}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getCoordsPerVertex()I

    move-result v5

    iget-object v6, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    .line 66
    invoke-virtual {v6}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getVertexStride()I

    move-result v6

    iget-object v7, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    .line 67
    invoke-virtual {v7, p3}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getTexCoordArray(Lcom/vk/media/utils/RenderDrawable$Flip;)Ljava/nio/FloatBuffer;

    move-result-object v8

    iget-object v7, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    .line 68
    invoke-virtual {v7}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getTexCoordStride()I

    move-result v10

    move-object v7, p2

    move v9, p1

    .line 64
    invoke-virtual/range {v0 .. v10}, Lcom/vk/media/utils/grafika/Texture2dProgram;->draw([FLjava/nio/FloatBuffer;IIII[FLjava/nio/FloatBuffer;II)V

    .line 69
    return-void
.end method

.method public drawFrame2D(I[FLcom/vk/media/utils/RenderDrawable$Flip;Ljava/nio/IntBuffer;II)V
    .locals 15
    .param p1, "textureId"    # I
    .param p2, "texMatrix"    # [F
    .param p3, "flip"    # Lcom/vk/media/utils/RenderDrawable$Flip;
    .param p4, "pixels"    # Ljava/nio/IntBuffer;
    .param p5, "width"    # I
    .param p6, "height"    # I

    .prologue
    .line 74
    iget-object v1, p0, Lcom/vk/media/utils/RenderDrawable;->mProgram:Lcom/vk/media/utils/grafika/Texture2dProgram;

    sget-object v2, Lcom/vk/media/utils/grafika/GlUtil;->IDENTITY_MATRIX:[F

    iget-object v3, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    invoke-virtual {v3}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getVertexArray()Ljava/nio/FloatBuffer;

    move-result-object v3

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    .line 75
    invoke-virtual {v5}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getVertexCount()I

    move-result v5

    iget-object v6, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    invoke-virtual {v6}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getCoordsPerVertex()I

    move-result v6

    iget-object v7, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    .line 76
    invoke-virtual {v7}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getVertexStride()I

    move-result v7

    iget-object v8, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    .line 77
    move-object/from16 v0, p3

    invoke-virtual {v8, v0}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getTexCoordArray(Lcom/vk/media/utils/RenderDrawable$Flip;)Ljava/nio/FloatBuffer;

    move-result-object v9

    iget-object v8, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    .line 78
    invoke-virtual {v8}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getTexCoordStride()I

    move-result v11

    move-object/from16 v8, p2

    move/from16 v10, p1

    move/from16 v12, p5

    move/from16 v13, p6

    move-object/from16 v14, p4

    .line 74
    invoke-virtual/range {v1 .. v14}, Lcom/vk/media/utils/grafika/Texture2dProgram;->drawPixels([FLjava/nio/FloatBuffer;IIII[FLjava/nio/FloatBuffer;IIIILjava/nio/IntBuffer;)V

    .line 79
    return-void
.end method

.method public getDrawable()Lcom/vk/media/utils/RenderDrawable$Drawable2d;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/vk/media/utils/RenderDrawable;->mRectDrawable:Lcom/vk/media/utils/RenderDrawable$Drawable2d;

    return-object v0
.end method

.method public getProgram()Lcom/vk/media/utils/grafika/Texture2dProgram;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/media/utils/RenderDrawable;->mProgram:Lcom/vk/media/utils/grafika/Texture2dProgram;

    return-object v0
.end method

.method public release(Z)V
    .locals 1
    .param p1, "doEglCleanup"    # Z

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vk/media/utils/RenderDrawable;->mProgram:Lcom/vk/media/utils/grafika/Texture2dProgram;

    if-eqz v0, :cond_1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    iget-object v0, p0, Lcom/vk/media/utils/RenderDrawable;->mProgram:Lcom/vk/media/utils/grafika/Texture2dProgram;

    invoke-virtual {v0}, Lcom/vk/media/utils/grafika/Texture2dProgram;->release()V

    .line 41
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/media/utils/RenderDrawable;->mProgram:Lcom/vk/media/utils/grafika/Texture2dProgram;

    .line 43
    :cond_1
    return-void
.end method
