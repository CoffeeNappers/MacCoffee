.class public Lcom/vk/media/utils/RenderDrawable$Drawable2d;
.super Ljava/lang/Object;
.source "RenderDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/utils/RenderDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Drawable2d"
.end annotation


# static fields
.field private static final FULL_RECTANGLE_COORDS:[F

.field private static final FULL_RECTANGLE_TEX_COORDS_0:[F

.field private static final FULL_RECTANGLE_TEX_COORDS_180:[F

.field private static final FULL_RECTANGLE_TEX_COORDS_270:[F

.field private static final FULL_RECTANGLE_TEX_COORDS_90:[F

.field private static final SIZEOF_FLOAT:I = 0x4


# instance fields
.field private mCoordsPerVertex:I

.field private mTexCoordArray:Ljava/nio/FloatBuffer;

.field private mTexCoordArrayFlip:Ljava/nio/FloatBuffer;

.field private mTexCoordStride:I

.field private mType:Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

.field private mVertexArray:Ljava/nio/FloatBuffer;

.field private mVertexCount:I

.field private mVertexStride:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 90
    new-array v0, v1, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->FULL_RECTANGLE_COORDS:[F

    .line 97
    new-array v0, v1, [F

    fill-array-data v0, :array_1

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->FULL_RECTANGLE_TEX_COORDS_0:[F

    .line 103
    new-array v0, v1, [F

    fill-array-data v0, :array_2

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->FULL_RECTANGLE_TEX_COORDS_90:[F

    .line 109
    new-array v0, v1, [F

    fill-array-data v0, :array_3

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->FULL_RECTANGLE_TEX_COORDS_180:[F

    .line 115
    new-array v0, v1, [F

    fill-array-data v0, :array_4

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->FULL_RECTANGLE_TEX_COORDS_270:[F

    return-void

    .line 90
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 97
    :array_1
    .array-data 4
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 103
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 109
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
    .end array-data

    .line 115
    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;)V
    .locals 2
    .param p1, "type"    # Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

    .prologue
    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    sget-object v0, Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;->TEXTURE_2D:Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

    iput-object v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mType:Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

    .line 133
    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->FULL_RECTANGLE_COORDS:[F

    invoke-static {v0}, Lcom/vk/media/utils/grafika/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mVertexArray:Ljava/nio/FloatBuffer;

    .line 134
    iput-object p1, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mType:Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

    .line 136
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->makeTexCoordArrays(Z)V

    .line 138
    const/4 v0, 0x2

    iput v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mCoordsPerVertex:I

    .line 139
    iget v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mCoordsPerVertex:I

    mul-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mVertexStride:I

    .line 140
    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->FULL_RECTANGLE_COORDS:[F

    array-length v0, v0

    iget v1, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mCoordsPerVertex:I

    div-int/2addr v0, v1

    iput v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mVertexCount:I

    .line 142
    const/16 v0, 0x8

    iput v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mTexCoordStride:I

    .line 143
    return-void
.end method

.method private static flip(F)F
    .locals 2
    .param p0, "i"    # F

    .prologue
    const/4 v0, 0x0

    .line 257
    cmpl-float v1, p0, v0

    if-nez v1, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    :cond_0
    return v0
.end method

.method private static flipHorizontal([F)[F
    .locals 7
    .param p0, "rotatedTex"    # [F

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 248
    const/16 v0, 0x8

    new-array v0, v0, [F

    aget v1, p0, v2

    aput v1, v0, v2

    aget v1, p0, v3

    .line 249
    invoke-static {v1}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->flip(F)F

    move-result v1

    aput v1, v0, v3

    aget v1, p0, v4

    aput v1, v0, v4

    aget v1, p0, v5

    .line 250
    invoke-static {v1}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->flip(F)F

    move-result v1

    aput v1, v0, v5

    aget v1, p0, v6

    aput v1, v0, v6

    const/4 v1, 0x5

    const/4 v2, 0x5

    aget v2, p0, v2

    .line 251
    invoke-static {v2}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->flip(F)F

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x6

    const/4 v2, 0x6

    aget v2, p0, v2

    aput v2, v0, v1

    const/4 v1, 0x7

    const/4 v2, 0x7

    aget v2, p0, v2

    .line 252
    invoke-static {v2}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->flip(F)F

    move-result v2

    aput v2, v0, v1

    return-object v0
.end method

.method private static flipVertical([F)[F
    .locals 7
    .param p0, "rotatedTex"    # [F

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 239
    const/16 v0, 0x8

    new-array v0, v0, [F

    aget v1, p0, v2

    .line 240
    invoke-static {v1}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->flip(F)F

    move-result v1

    aput v1, v0, v2

    aget v1, p0, v3

    aput v1, v0, v3

    aget v1, p0, v4

    .line 241
    invoke-static {v1}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->flip(F)F

    move-result v1

    aput v1, v0, v4

    aget v1, p0, v5

    aput v1, v0, v5

    aget v1, p0, v6

    .line 242
    invoke-static {v1}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->flip(F)F

    move-result v1

    aput v1, v0, v6

    const/4 v1, 0x5

    const/4 v2, 0x5

    aget v2, p0, v2

    aput v2, v0, v1

    const/4 v1, 0x6

    const/4 v2, 0x6

    aget v2, p0, v2

    .line 243
    invoke-static {v2}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->flip(F)F

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x7

    const/4 v2, 0x7

    aget v2, p0, v2

    aput v2, v0, v1

    return-object v0
.end method

.method private static getRotation(Lcom/vk/media/utils/RenderDrawable$Rotation;Lcom/vk/media/utils/RenderDrawable$Flip;)[F
    .locals 3
    .param p0, "angle"    # Lcom/vk/media/utils/RenderDrawable$Rotation;
    .param p1, "flip"    # Lcom/vk/media/utils/RenderDrawable$Flip;

    .prologue
    .line 205
    sget-object v1, Lcom/vk/media/utils/RenderDrawable$1;->$SwitchMap$com$vk$media$utils$RenderDrawable$Rotation:[I

    invoke-virtual {p0}, Lcom/vk/media/utils/RenderDrawable$Rotation;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 219
    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->FULL_RECTANGLE_TEX_COORDS_0:[F

    .line 222
    .local v0, "rotatedTex":[F
    :goto_0
    sget-object v1, Lcom/vk/media/utils/RenderDrawable$1;->$SwitchMap$com$vk$media$utils$RenderDrawable$Flip:[I

    invoke-virtual {p1}, Lcom/vk/media/utils/RenderDrawable$Flip;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_1

    .line 235
    :goto_1
    return-object v0

    .line 207
    .end local v0    # "rotatedTex":[F
    :pswitch_0
    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->FULL_RECTANGLE_TEX_COORDS_0:[F

    .line 208
    .restart local v0    # "rotatedTex":[F
    goto :goto_0

    .line 210
    .end local v0    # "rotatedTex":[F
    :pswitch_1
    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->FULL_RECTANGLE_TEX_COORDS_90:[F

    .line 211
    .restart local v0    # "rotatedTex":[F
    goto :goto_0

    .line 213
    .end local v0    # "rotatedTex":[F
    :pswitch_2
    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->FULL_RECTANGLE_TEX_COORDS_180:[F

    .line 214
    .restart local v0    # "rotatedTex":[F
    goto :goto_0

    .line 216
    .end local v0    # "rotatedTex":[F
    :pswitch_3
    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->FULL_RECTANGLE_TEX_COORDS_270:[F

    .line 217
    .restart local v0    # "rotatedTex":[F
    goto :goto_0

    .line 224
    :pswitch_4
    invoke-static {v0}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->flipVertical([F)[F

    move-result-object v0

    .line 225
    goto :goto_1

    .line 227
    :pswitch_5
    invoke-static {v0}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->flipHorizontal([F)[F

    move-result-object v0

    .line 228
    goto :goto_1

    .line 230
    :pswitch_6
    invoke-static {v0}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->flipVertical([F)[F

    move-result-object v1

    invoke-static {v1}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->flipHorizontal([F)[F

    move-result-object v0

    .line 231
    goto :goto_1

    .line 205
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 222
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method private static getRotationByModel(Z)Lcom/vk/media/utils/RenderDrawable$Rotation;
    .locals 1
    .param p0, "backCamera"    # Z

    .prologue
    .line 261
    invoke-static {p0}, Lcom/vk/media/camera/CameraUtils;->hasVerticalFlipByModel(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Rotation;->ROTATION_90:Lcom/vk/media/utils/RenderDrawable$Rotation;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Rotation;->ROTATION_270:Lcom/vk/media/utils/RenderDrawable$Rotation;

    goto :goto_0
.end method


# virtual methods
.method public final getCoordsPerVertex()I
    .locals 1

    .prologue
    .line 188
    iget v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mCoordsPerVertex:I

    return v0
.end method

.method public final getTexCoordArray(Lcom/vk/media/utils/RenderDrawable$Flip;)Ljava/nio/FloatBuffer;
    .locals 1
    .param p1, "flip"    # Lcom/vk/media/utils/RenderDrawable$Flip;

    .prologue
    .line 160
    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Flip;->NO_FLIP:Lcom/vk/media/utils/RenderDrawable$Flip;

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mTexCoordArray:Ljava/nio/FloatBuffer;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mTexCoordArrayFlip:Ljava/nio/FloatBuffer;

    goto :goto_0
.end method

.method public final getTexCoordStride()I
    .locals 1

    .prologue
    .line 181
    iget v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mTexCoordStride:I

    return v0
.end method

.method public final getVertexArray()Ljava/nio/FloatBuffer;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mVertexArray:Ljava/nio/FloatBuffer;

    return-object v0
.end method

.method public final getVertexCount()I
    .locals 1

    .prologue
    .line 167
    iget v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mVertexCount:I

    return v0
.end method

.method public final getVertexStride()I
    .locals 1

    .prologue
    .line 174
    iget v0, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mVertexStride:I

    return v0
.end method

.method public makeTexCoordArrays(Z)V
    .locals 3
    .param p1, "backCamera"    # Z

    .prologue
    .line 192
    iget-object v1, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mType:Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

    sget-object v2, Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;->TEXTURE_2D:Lcom/vk/media/utils/grafika/Texture2dProgram$ProgramType;

    if-ne v1, v2, :cond_0

    .line 193
    invoke-static {p1}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getRotationByModel(Z)Lcom/vk/media/utils/RenderDrawable$Rotation;

    move-result-object v0

    .line 195
    .local v0, "rotation":Lcom/vk/media/utils/RenderDrawable$Rotation;
    sget-object v1, Lcom/vk/media/utils/RenderDrawable$Flip;->VERTICAL_HORIZONTAL:Lcom/vk/media/utils/RenderDrawable$Flip;

    invoke-static {v0, v1}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getRotation(Lcom/vk/media/utils/RenderDrawable$Rotation;Lcom/vk/media/utils/RenderDrawable$Flip;)[F

    move-result-object v1

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mTexCoordArray:Ljava/nio/FloatBuffer;

    .line 196
    sget-object v1, Lcom/vk/media/utils/RenderDrawable$Flip;->VERTICAL:Lcom/vk/media/utils/RenderDrawable$Flip;

    invoke-static {v0, v1}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getRotation(Lcom/vk/media/utils/RenderDrawable$Rotation;Lcom/vk/media/utils/RenderDrawable$Flip;)[F

    move-result-object v1

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mTexCoordArrayFlip:Ljava/nio/FloatBuffer;

    .line 201
    .end local v0    # "rotation":Lcom/vk/media/utils/RenderDrawable$Rotation;
    :goto_0
    return-void

    .line 198
    :cond_0
    sget-object v1, Lcom/vk/media/utils/RenderDrawable$Rotation;->ROTATION_0:Lcom/vk/media/utils/RenderDrawable$Rotation;

    sget-object v2, Lcom/vk/media/utils/RenderDrawable$Flip;->NO_FLIP:Lcom/vk/media/utils/RenderDrawable$Flip;

    invoke-static {v1, v2}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getRotation(Lcom/vk/media/utils/RenderDrawable$Rotation;Lcom/vk/media/utils/RenderDrawable$Flip;)[F

    move-result-object v1

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mTexCoordArray:Ljava/nio/FloatBuffer;

    .line 199
    sget-object v1, Lcom/vk/media/utils/RenderDrawable$Rotation;->ROTATION_0:Lcom/vk/media/utils/RenderDrawable$Rotation;

    sget-object v2, Lcom/vk/media/utils/RenderDrawable$Flip;->VERTICAL:Lcom/vk/media/utils/RenderDrawable$Flip;

    invoke-static {v1, v2}, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->getRotation(Lcom/vk/media/utils/RenderDrawable$Rotation;Lcom/vk/media/utils/RenderDrawable$Flip;)[F

    move-result-object v1

    invoke-static {v1}, Lcom/vk/media/utils/grafika/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/media/utils/RenderDrawable$Drawable2d;->mTexCoordArrayFlip:Ljava/nio/FloatBuffer;

    goto :goto_0
.end method
