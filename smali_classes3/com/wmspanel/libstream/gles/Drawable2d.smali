.class public Lcom/wmspanel/libstream/gles/Drawable2d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wmspanel/libstream/gles/Drawable2d$Prefab;
    }
.end annotation


# static fields
.field private static final FULL_RECTANGLE_BUF:Ljava/nio/FloatBuffer;

.field private static final FULL_RECTANGLE_COORDS:[F

.field private static final FULL_RECTANGLE_TEX_BUF:Ljava/nio/FloatBuffer;

.field private static final FULL_RECTANGLE_TEX_COORDS:[F

.field private static final RECTANGLE_BUF:Ljava/nio/FloatBuffer;

.field private static final RECTANGLE_COORDS:[F

.field private static final RECTANGLE_TEX_BUF:Ljava/nio/FloatBuffer;

.field private static final RECTANGLE_TEX_COORDS:[F

.field private static final SIZEOF_FLOAT:I = 0x4

.field private static final TRIANGLE_BUF:Ljava/nio/FloatBuffer;

.field private static final TRIANGLE_COORDS:[F

.field private static final TRIANGLE_TEX_BUF:Ljava/nio/FloatBuffer;

.field private static final TRIANGLE_TEX_COORDS:[F


# instance fields
.field private mCoordsPerVertex:I

.field private mPrefab:Lcom/wmspanel/libstream/gles/Drawable2d$Prefab;

.field private mTexCoordArray:Ljava/nio/FloatBuffer;

.field private mTexCoordStride:I

.field private mVertexArray:Ljava/nio/FloatBuffer;

.field private mVertexCount:I

.field private mVertexStride:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x6

    const/16 v1, 0x8

    .line 34
    new-array v0, v2, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->TRIANGLE_COORDS:[F

    .line 39
    new-array v0, v2, [F

    fill-array-data v0, :array_1

    sput-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->TRIANGLE_TEX_COORDS:[F

    .line 44
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->TRIANGLE_COORDS:[F

    .line 45
    invoke-static {v0}, Lcom/wmspanel/libstream/gles/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    sput-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->TRIANGLE_BUF:Ljava/nio/FloatBuffer;

    .line 46
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->TRIANGLE_TEX_COORDS:[F

    .line 47
    invoke-static {v0}, Lcom/wmspanel/libstream/gles/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    sput-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->TRIANGLE_TEX_BUF:Ljava/nio/FloatBuffer;

    .line 55
    new-array v0, v1, [F

    fill-array-data v0, :array_2

    sput-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->RECTANGLE_COORDS:[F

    .line 61
    new-array v0, v1, [F

    fill-array-data v0, :array_3

    sput-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->RECTANGLE_TEX_COORDS:[F

    .line 67
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->RECTANGLE_COORDS:[F

    .line 68
    invoke-static {v0}, Lcom/wmspanel/libstream/gles/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    sput-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->RECTANGLE_BUF:Ljava/nio/FloatBuffer;

    .line 69
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->RECTANGLE_TEX_COORDS:[F

    .line 70
    invoke-static {v0}, Lcom/wmspanel/libstream/gles/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    sput-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->RECTANGLE_TEX_BUF:Ljava/nio/FloatBuffer;

    .line 79
    new-array v0, v1, [F

    fill-array-data v0, :array_4

    sput-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->FULL_RECTANGLE_COORDS:[F

    .line 86
    new-array v0, v1, [F

    fill-array-data v0, :array_5

    sput-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->FULL_RECTANGLE_TEX_COORDS:[F

    .line 92
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->FULL_RECTANGLE_COORDS:[F

    .line 93
    invoke-static {v0}, Lcom/wmspanel/libstream/gles/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    sput-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->FULL_RECTANGLE_BUF:Ljava/nio/FloatBuffer;

    .line 94
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->FULL_RECTANGLE_TEX_COORDS:[F

    .line 95
    invoke-static {v0}, Lcom/wmspanel/libstream/gles/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    sput-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->FULL_RECTANGLE_TEX_BUF:Ljava/nio/FloatBuffer;

    .line 94
    return-void

    .line 34
    :array_0
    .array-data 4
        0x0
        0x3f13cd3a
        -0x41000000    # -0.5f
        -0x416c32c6
        0x3f000000    # 0.5f
        -0x416c32c6
    .end array-data

    .line 39
    :array_1
    .array-data 4
        0x3f000000    # 0.5f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 55
    :array_2
    .array-data 4
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        -0x41000000    # -0.5f
        -0x41000000    # -0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
        0x3f000000    # 0.5f
    .end array-data

    .line 61
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 79
    :array_4
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

    .line 86
    :array_5
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
.end method

.method public constructor <init>(Lcom/wmspanel/libstream/gles/Drawable2d$Prefab;)V
    .locals 3
    .param p1, "shape"    # Lcom/wmspanel/libstream/gles/Drawable2d$Prefab;

    .prologue
    const/4 v2, 0x2

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d$1;->$SwitchMap$com$wmspanel$libstream$gles$Drawable2d$Prefab:[I

    invoke-virtual {p1}, Lcom/wmspanel/libstream/gles/Drawable2d$Prefab;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 142
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown shape "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 121
    :pswitch_0
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->TRIANGLE_BUF:Ljava/nio/FloatBuffer;

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mVertexArray:Ljava/nio/FloatBuffer;

    .line 122
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->TRIANGLE_TEX_BUF:Ljava/nio/FloatBuffer;

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mTexCoordArray:Ljava/nio/FloatBuffer;

    .line 123
    iput v2, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mCoordsPerVertex:I

    .line 124
    iget v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mCoordsPerVertex:I

    mul-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mVertexStride:I

    .line 125
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->TRIANGLE_COORDS:[F

    array-length v0, v0

    iget v1, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mCoordsPerVertex:I

    div-int/2addr v0, v1

    iput v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mVertexCount:I

    .line 144
    :goto_0
    const/16 v0, 0x8

    iput v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mTexCoordStride:I

    .line 145
    iput-object p1, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mPrefab:Lcom/wmspanel/libstream/gles/Drawable2d$Prefab;

    .line 146
    return-void

    .line 128
    :pswitch_1
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->RECTANGLE_BUF:Ljava/nio/FloatBuffer;

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mVertexArray:Ljava/nio/FloatBuffer;

    .line 129
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->RECTANGLE_TEX_BUF:Ljava/nio/FloatBuffer;

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mTexCoordArray:Ljava/nio/FloatBuffer;

    .line 130
    iput v2, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mCoordsPerVertex:I

    .line 131
    iget v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mCoordsPerVertex:I

    mul-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mVertexStride:I

    .line 132
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->RECTANGLE_COORDS:[F

    array-length v0, v0

    iget v1, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mCoordsPerVertex:I

    div-int/2addr v0, v1

    iput v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mVertexCount:I

    goto :goto_0

    .line 135
    :pswitch_2
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->FULL_RECTANGLE_BUF:Ljava/nio/FloatBuffer;

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mVertexArray:Ljava/nio/FloatBuffer;

    .line 136
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->FULL_RECTANGLE_TEX_BUF:Ljava/nio/FloatBuffer;

    iput-object v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mTexCoordArray:Ljava/nio/FloatBuffer;

    .line 137
    iput v2, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mCoordsPerVertex:I

    .line 138
    iget v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mCoordsPerVertex:I

    mul-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mVertexStride:I

    .line 139
    sget-object v0, Lcom/wmspanel/libstream/gles/Drawable2d;->FULL_RECTANGLE_COORDS:[F

    array-length v0, v0

    iget v1, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mCoordsPerVertex:I

    div-int/2addr v0, v1

    iput v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mVertexCount:I

    goto :goto_0

    .line 119
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public getCoordsPerVertex()I
    .locals 1

    .prologue
    .line 191
    iget v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mCoordsPerVertex:I

    return v0
.end method

.method public getTexCoordArray()Ljava/nio/FloatBuffer;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mTexCoordArray:Ljava/nio/FloatBuffer;

    return-object v0
.end method

.method public getTexCoordStride()I
    .locals 1

    .prologue
    .line 184
    iget v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mTexCoordStride:I

    return v0
.end method

.method public getVertexArray()Ljava/nio/FloatBuffer;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mVertexArray:Ljava/nio/FloatBuffer;

    return-object v0
.end method

.method public getVertexCount()I
    .locals 1

    .prologue
    .line 170
    iget v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mVertexCount:I

    return v0
.end method

.method public getVertexStride()I
    .locals 1

    .prologue
    .line 177
    iget v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mVertexStride:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 196
    iget-object v0, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mPrefab:Lcom/wmspanel/libstream/gles/Drawable2d$Prefab;

    if-eqz v0, :cond_0

    .line 197
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[Drawable2d: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/wmspanel/libstream/gles/Drawable2d;->mPrefab:Lcom/wmspanel/libstream/gles/Drawable2d$Prefab;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 199
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "[Drawable2d: ...]"

    goto :goto_0
.end method
