.class public Lcom/vk/imageloader/ImageLoaderUtils;
.super Ljava/lang/Object;
.source "ImageLoaderUtils.java"


# static fields
.field public static final Rect1ThreadLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field public static final Rect2ThreadLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field public static final bitmapPaint:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 9
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/vk/imageloader/ImageLoaderUtils;->bitmapPaint:Landroid/graphics/Paint;

    .line 11
    sget-object v0, Lcom/vk/imageloader/ImageLoaderUtils;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 12
    sget-object v0, Lcom/vk/imageloader/ImageLoaderUtils;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 13
    sget-object v0, Lcom/vk/imageloader/ImageLoaderUtils;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 16
    new-instance v0, Lcom/vk/imageloader/ImageLoaderUtils$1;

    invoke-direct {v0}, Lcom/vk/imageloader/ImageLoaderUtils$1;-><init>()V

    sput-object v0, Lcom/vk/imageloader/ImageLoaderUtils;->Rect1ThreadLocal:Ljava/lang/ThreadLocal;

    .line 30
    new-instance v0, Lcom/vk/imageloader/ImageLoaderUtils$2;

    invoke-direct {v0}, Lcom/vk/imageloader/ImageLoaderUtils$2;-><init>()V

    sput-object v0, Lcom/vk/imageloader/ImageLoaderUtils;->Rect2ThreadLocal:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFrescoBitmap(Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;Landroid/graphics/Bitmap;IIII)Lcom/facebook/common/references/CloseableReference;
    .locals 9
    .param p0, "bitmapFactory"    # Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;
    .param p1, "source"    # Landroid/graphics/Bitmap;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;",
            "Landroid/graphics/Bitmap;",
            "IIII)",
            "Lcom/facebook/common/references/CloseableReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 77
    invoke-virtual {p0, p4, p5}, Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;->createBitmap(II)Lcom/facebook/common/references/CloseableReference;

    move-result-object v0

    .line 79
    .local v0, "bitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    :try_start_0
    invoke-virtual {v0}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    .line 81
    .local v2, "destBitmap":Landroid/graphics/Bitmap;
    sget-object v5, Lcom/vk/imageloader/ImageLoaderUtils;->Rect1ThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v5}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/Rect;

    .line 82
    .local v4, "srcRect":Landroid/graphics/Rect;
    add-int v5, p2, p4

    add-int v6, p3, p5

    invoke-virtual {v4, p2, p3, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 84
    sget-object v5, Lcom/vk/imageloader/ImageLoaderUtils;->Rect2ThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v5}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/Rect;

    .line 85
    .local v3, "dstRect":Landroid/graphics/Rect;
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    invoke-virtual {v3, v5, v6, v7, v8}, Landroid/graphics/Rect;->set(IIII)V

    .line 87
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 88
    .local v1, "canvas":Landroid/graphics/Canvas;
    sget-object v5, Lcom/vk/imageloader/ImageLoaderUtils;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, p1, v4, v3, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 90
    invoke-static {v0}, Lcom/facebook/common/references/CloseableReference;->cloneOrNull(Lcom/facebook/common/references/CloseableReference;)Lcom/facebook/common/references/CloseableReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v5

    .line 92
    invoke-static {v0}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    return-object v5

    .end local v1    # "canvas":Landroid/graphics/Canvas;
    .end local v2    # "destBitmap":Landroid/graphics/Bitmap;
    .end local v3    # "dstRect":Landroid/graphics/Rect;
    .end local v4    # "srcRect":Landroid/graphics/Rect;
    :catchall_0
    move-exception v5

    invoke-static {v0}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    throw v5
.end method

.method public static fastResizeBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 6
    .param p0, "src"    # Landroid/graphics/Bitmap;
    .param p1, "dst"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v5, 0x0

    .line 66
    sget-object v3, Lcom/vk/imageloader/ImageLoaderUtils;->Rect1ThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Rect;

    .line 67
    .local v2, "srcRect":Landroid/graphics/Rect;
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 69
    sget-object v3, Lcom/vk/imageloader/ImageLoaderUtils;->Rect2ThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Rect;

    .line 70
    .local v1, "dstRect":Landroid/graphics/Rect;
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-virtual {v1, v5, v5, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 72
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 73
    .local v0, "canvas":Landroid/graphics/Canvas;
    sget-object v3, Lcom/vk/imageloader/ImageLoaderUtils;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p0, v2, v1, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 74
    return-void
.end method

.method public static makeCircleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 13
    .param p0, "source"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v12, 0x1

    const/high16 v11, 0x40000000    # 2.0f

    .line 97
    if-nez p0, :cond_0

    .line 98
    const/4 v0, 0x0

    .line 136
    :goto_0
    return-object v0

    .line 100
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 102
    .local v5, "size":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    if-ne v9, v10, :cond_1

    .line 103
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v9

    invoke-static {v5, v5, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 105
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 106
    .local v1, "canvas":Landroid/graphics/Canvas;
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 107
    .local v2, "paint":Landroid/graphics/Paint;
    new-instance v4, Landroid/graphics/BitmapShader;

    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v10, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v4, p0, v9, v10}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 109
    .local v4, "shader":Landroid/graphics/BitmapShader;
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 110
    invoke-virtual {v2, v12}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 112
    int-to-float v9, v5

    div-float v3, v9, v11

    .line 113
    .local v3, "r":F
    invoke-virtual {v1, v3, v3, v3, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 117
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "canvas":Landroid/graphics/Canvas;
    .end local v2    # "paint":Landroid/graphics/Paint;
    .end local v3    # "r":F
    .end local v4    # "shader":Landroid/graphics/BitmapShader;
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    sub-int/2addr v9, v5

    div-int/lit8 v7, v9, 0x2

    .line 118
    .local v7, "x":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    sub-int/2addr v9, v5

    div-int/lit8 v8, v9, 0x2

    .line 120
    .local v8, "y":I
    invoke-static {p0, v7, v8, v5, v5}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 122
    .local v6, "squaredBitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v9

    invoke-static {v5, v5, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 124
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 125
    .restart local v1    # "canvas":Landroid/graphics/Canvas;
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 126
    .restart local v2    # "paint":Landroid/graphics/Paint;
    new-instance v4, Landroid/graphics/BitmapShader;

    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v10, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v4, v6, v9, v10}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 128
    .restart local v4    # "shader":Landroid/graphics/BitmapShader;
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 129
    invoke-virtual {v2, v12}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 131
    int-to-float v9, v5

    div-float v3, v9, v11

    .line 132
    .restart local v3    # "r":F
    invoke-virtual {v1, v3, v3, v3, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 134
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_0
.end method

.method public static rotateBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 9
    .param p0, "original"    # Landroid/graphics/Bitmap;
    .param p1, "angle"    # I

    .prologue
    .line 45
    if-nez p0, :cond_1

    .line 46
    const/4 p0, 0x0

    .line 60
    .end local p0    # "original":Landroid/graphics/Bitmap;
    :cond_0
    :goto_0
    return-object p0

    .line 49
    .restart local p0    # "original":Landroid/graphics/Bitmap;
    :cond_1
    if-eqz p1, :cond_0

    .line 53
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 54
    .local v5, "matrix":Landroid/graphics/Matrix;
    int-to-float v0, p1

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 57
    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .local v7, "result":Landroid/graphics/Bitmap;
    move-object p0, v7

    .line 58
    goto :goto_0

    .line 59
    .end local v7    # "result":Landroid/graphics/Bitmap;
    :catch_0
    move-exception v8

    .line 60
    .local v8, "throwable":Ljava/lang/Throwable;
    goto :goto_0
.end method
