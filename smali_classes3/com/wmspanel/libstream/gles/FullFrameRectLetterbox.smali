.class public Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;
.super Lcom/wmspanel/libstream/gles/FullFrameRect;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation


# direct methods
.method public constructor <init>(Lcom/wmspanel/libstream/gles/Texture2dProgram;)V
    .locals 0
    .param p1, "program"    # Lcom/wmspanel/libstream/gles/Texture2dProgram;

    .prologue
    .line 10
    invoke-direct {p0, p1}, Lcom/wmspanel/libstream/gles/FullFrameRect;-><init>(Lcom/wmspanel/libstream/gles/Texture2dProgram;)V

    .line 11
    return-void
.end method

.method private drawFrame(I[F[F)V
    .locals 11
    .param p1, "textureId"    # I
    .param p2, "texMatrix"    # [F
    .param p3, "matrix"    # [F

    .prologue
    .line 15
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->mProgram:Lcom/wmspanel/libstream/gles/Texture2dProgram;

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/gles/Drawable2d;->getVertexArray()Ljava/nio/FloatBuffer;

    move-result-object v2

    const/4 v3, 0x0

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;

    .line 16
    invoke-virtual {v1}, Lcom/wmspanel/libstream/gles/Drawable2d;->getVertexCount()I

    move-result v4

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;

    invoke-virtual {v1}, Lcom/wmspanel/libstream/gles/Drawable2d;->getCoordsPerVertex()I

    move-result v5

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;

    .line 17
    invoke-virtual {v1}, Lcom/wmspanel/libstream/gles/Drawable2d;->getVertexStride()I

    move-result v6

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;

    .line 18
    invoke-virtual {v1}, Lcom/wmspanel/libstream/gles/Drawable2d;->getTexCoordArray()Ljava/nio/FloatBuffer;

    move-result-object v8

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->mRectDrawable:Lcom/wmspanel/libstream/gles/Drawable2d;

    .line 19
    invoke-virtual {v1}, Lcom/wmspanel/libstream/gles/Drawable2d;->getTexCoordStride()I

    move-result v10

    move-object v1, p3

    move-object v7, p2

    move v9, p1

    .line 15
    invoke-virtual/range {v0 .. v10}, Lcom/wmspanel/libstream/gles/Texture2dProgram;->draw([FLjava/nio/FloatBuffer;IIII[FLjava/nio/FloatBuffer;II)V

    .line 20
    return-void
.end method

.method private makeMatrix()[F
    .locals 2

    .prologue
    .line 24
    const/16 v0, 0x10

    new-array v0, v0, [F

    .line 25
    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 27
    return-object v0
.end method


# virtual methods
.method public drawFrameMirrorX(I[FIF)V
    .locals 6
    .param p1, "textureId"    # I
    .param p2, "texMatrix"    # [F
    .param p3, "rotate"    # I
    .param p4, "scale"    # F

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    .line 80
    invoke-direct {p0}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->makeMatrix()[F

    move-result-object v0

    .line 82
    if-eqz p3, :cond_0

    .line 83
    int-to-float v2, p3

    move v4, v3

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 85
    :cond_0
    if-eqz p3, :cond_1

    const/16 v2, 0xb4

    if-ne p3, v2, :cond_2

    .line 86
    :cond_1
    neg-float p4, p4

    .line 88
    :cond_2
    cmpl-float v2, p4, v5

    if-eqz v2, :cond_3

    .line 89
    invoke-static {v0, v1, p4, v5, v5}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 91
    :cond_3
    const/16 v2, 0x5a

    if-eq p3, v2, :cond_4

    const/16 v2, 0x10e

    if-ne p3, v2, :cond_5

    .line 92
    :cond_4
    const/high16 v2, -0x40800000    # -1.0f

    invoke-static {v0, v1, v5, v2, v5}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 95
    :cond_5
    invoke-direct {p0, p1, p2, v0}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrame(I[F[F)V

    .line 96
    return-void
.end method

.method public drawFrameMirrorY(I[FIF)V
    .locals 6
    .param p1, "textureId"    # I
    .param p2, "texMatrix"    # [F
    .param p3, "rotate"    # I
    .param p4, "scale"    # F

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    .line 46
    invoke-direct {p0}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->makeMatrix()[F

    move-result-object v0

    .line 48
    if-eqz p3, :cond_0

    .line 49
    int-to-float v2, p3

    move v4, v3

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 51
    :cond_0
    const/16 v2, 0x5a

    if-eq p3, v2, :cond_1

    const/16 v2, 0x10e

    if-ne p3, v2, :cond_2

    .line 52
    :cond_1
    neg-float p4, p4

    .line 54
    :cond_2
    cmpl-float v2, p4, v5

    if-eqz v2, :cond_3

    .line 55
    invoke-static {v0, v1, v5, p4, v5}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 57
    :cond_3
    if-eqz p3, :cond_4

    const/16 v2, 0xb4

    if-ne p3, v2, :cond_5

    .line 58
    :cond_4
    const/high16 v2, -0x40800000    # -1.0f

    invoke-static {v0, v1, v2, v5, v5}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 61
    :cond_5
    invoke-direct {p0, p1, p2, v0}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrame(I[F[F)V

    .line 62
    return-void
.end method

.method public drawFrameX(I[FIF)V
    .locals 6
    .param p1, "textureId"    # I
    .param p2, "texMatrix"    # [F
    .param p3, "rotate"    # I
    .param p4, "scale"    # F

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    .line 66
    invoke-direct {p0}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->makeMatrix()[F

    move-result-object v0

    .line 68
    if-eqz p3, :cond_0

    .line 69
    int-to-float v2, p3

    move v4, v3

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 71
    :cond_0
    cmpl-float v2, p4, v5

    if-eqz v2, :cond_1

    .line 72
    invoke-static {v0, v1, p4, v5, v5}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 75
    :cond_1
    invoke-direct {p0, p1, p2, v0}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrame(I[F[F)V

    .line 76
    return-void
.end method

.method public drawFrameY(I[FIF)V
    .locals 6
    .param p1, "textureId"    # I
    .param p2, "texMatrix"    # [F
    .param p3, "rotate"    # I
    .param p4, "scale"    # F

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    .line 32
    invoke-direct {p0}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->makeMatrix()[F

    move-result-object v0

    .line 34
    if-eqz p3, :cond_0

    .line 35
    int-to-float v2, p3

    move v4, v3

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 37
    :cond_0
    cmpl-float v2, p4, v5

    if-eqz v2, :cond_1

    .line 38
    invoke-static {v0, v1, v5, p4, v5}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 41
    :cond_1
    invoke-direct {p0, p1, p2, v0}, Lcom/wmspanel/libstream/gles/FullFrameRectLetterbox;->drawFrame(I[F[F)V

    .line 42
    return-void
.end method
