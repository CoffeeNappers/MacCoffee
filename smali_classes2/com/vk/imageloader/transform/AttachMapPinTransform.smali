.class public Lcom/vk/imageloader/transform/AttachMapPinTransform;
.super Lcom/facebook/imagepipeline/request/BasePostprocessor;
.source "AttachMapPinTransform.java"


# static fields
.field private static final bitmapPaint:Landroid/graphics/Paint;


# instance fields
.field private final markerDrawable:Landroid/graphics/drawable/Drawable;

.field private final resultHeight:I

.field private final resultWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 12
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->bitmapPaint:Landroid/graphics/Paint;

    .line 14
    sget-object v0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 15
    sget-object v0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 16
    sget-object v0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 17
    return-void
.end method

.method public constructor <init>(IILandroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "resultWidth"    # I
    .param p2, "resultHeight"    # I
    .param p3, "markerDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/facebook/imagepipeline/request/BasePostprocessor;-><init>()V

    .line 24
    iput p1, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->resultWidth:I

    .line 25
    iput p2, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->resultHeight:I

    .line 26
    iput-object p3, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->markerDrawable:Landroid/graphics/drawable/Drawable;

    .line 27
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    const-string/jumbo v0, "AttachMapPinTransform"

    return-object v0
.end method

.method public process(Landroid/graphics/Bitmap;Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;)Lcom/facebook/common/references/CloseableReference;
    .locals 8
    .param p1, "sourceBitmap"    # Landroid/graphics/Bitmap;
    .param p2, "bitmapFactory"    # Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;",
            ")",
            "Lcom/facebook/common/references/CloseableReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    iget v3, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->resultWidth:I

    iget v4, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->resultHeight:I

    invoke-virtual {p2, v3, v4}, Lcom/facebook/imagepipeline/bitmaps/PlatformBitmapFactory;->createBitmap(II)Lcom/facebook/common/references/CloseableReference;

    move-result-object v0

    .line 36
    .local v0, "bitmapRef":Lcom/facebook/common/references/CloseableReference;, "Lcom/facebook/common/references/CloseableReference<Landroid/graphics/Bitmap;>;"
    :try_start_0
    invoke-virtual {v0}, Lcom/facebook/common/references/CloseableReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    .line 37
    .local v2, "destBitmap":Landroid/graphics/Bitmap;
    invoke-static {p1, v2}, Lcom/vk/imageloader/ImageLoaderUtils;->fastResizeBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 39
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 40
    .local v1, "c":Landroid/graphics/Canvas;
    iget-object v3, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->markerDrawable:Landroid/graphics/drawable/Drawable;

    iget v4, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->resultWidth:I

    div-int/lit8 v4, v4, 0x2

    iget-object v5, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->markerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    sub-int/2addr v4, v5

    iget v5, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->resultHeight:I

    div-int/lit8 v5, v5, 0x2

    iget-object v6, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->markerDrawable:Landroid/graphics/drawable/Drawable;

    .line 41
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    sub-int/2addr v5, v6

    iget v6, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->resultWidth:I

    div-int/lit8 v6, v6, 0x2

    iget-object v7, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->markerDrawable:Landroid/graphics/drawable/Drawable;

    .line 42
    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    add-int/2addr v6, v7

    iget v7, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->resultHeight:I

    div-int/lit8 v7, v7, 0x2

    .line 40
    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 44
    iget-object v3, p0, Lcom/vk/imageloader/transform/AttachMapPinTransform;->markerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 46
    invoke-static {v0}, Lcom/facebook/common/references/CloseableReference;->cloneOrNull(Lcom/facebook/common/references/CloseableReference;)Lcom/facebook/common/references/CloseableReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 48
    invoke-static {v0}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    return-object v3

    .end local v1    # "c":Landroid/graphics/Canvas;
    .end local v2    # "destBitmap":Landroid/graphics/Bitmap;
    :catchall_0
    move-exception v3

    invoke-static {v0}, Lcom/facebook/common/references/CloseableReference;->closeSafely(Lcom/facebook/common/references/CloseableReference;)V

    throw v3
.end method
